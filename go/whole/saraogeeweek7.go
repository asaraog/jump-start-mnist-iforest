package main

import (

	// "image"
	// "image/png"
	"encoding/csv"
	"fmt"
	"os"

	"github.com/e-XpertSolutions/go-iforest/v2/iforest"
	"github.com/petar/GoMNIST"
)

func main() {

	//Get Training images
	images, _ := GetMNIST()

	//Training of forest
	f := iforest.NewForest(1000, 256, 0.0001) //initializes forest with 1000 trees, 256 samples, dummy threshold value (not used but maybe classifying)
	f.Train(images)                           //uses BSTs to do partitioning
	f.Test(images)                            // calculates anomaly scores for each sample

	//Export
	scores := ExtractScores(f) //extracts scores into a [][]string for export
	file, _ := os.Create("../../results/go_data.csv")
	w := csv.NewWriter(file)
	w.WriteAll(scores)
}

func GetMNIST() (images [][]float64, labels []int) {

	//Loads data into [][]float64
	train, _, _ := GoMNIST.Load("../../data")
	images = make([][]float64, len(train.Images))
	labels = make([]int, len(train.Images))

	for i := 0; i < len(train.Images); i++ {
		images[i] = make([]float64, len(train.Images[0]))
		for p := range train.Images[0] {
			images[i][p] = float64(train.Images[i][p]) //converts integer pixel values to float64 for input to iforest
			labels[i] = int(train.Labels[i])

		}
	}
	return images, labels

}

func ExtractScores(f *iforest.Forest) (scores [][]string) {
	scores = make([][]string, len(f.AnomalyScores)+1)
	for i := 0; i < len(scores); i++ {
		scores[i] = make([]string, 2)
		if i == 0 { //adds header in csv for easy import into R dataframes
			scores[0][0] = "id"
			scores[0][1] = "scores"
		}
		if i != 0 {
			score := 0.5 - f.AnomalyScores[i-1] //changes to conform with anomaly scores as defined by Liu 2008
			scores[i][0] = fmt.Sprintf("%d", i-1)
			scores[i][1] = fmt.Sprintf("%f", score)
		}

	}
	return scores
}
