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

	//Loads data into [][]float64
	images, labels := GetMNIST()

	//For filtering out a digit
	for digit := 0; digit < 10; digit++ {
		x, _ := DigitFilter(images, labels, digit) //creates new dataframe x for subset of training data for digit

		//Training of forest
		f := iforest.NewForest(100, 256, 0.0001) //reduced number of trees to 100 as fewer parameters than whole dataset
		f.Train(x)                               //uses BSTs to do partitioning
		f.Test(x)                                // calculates anomaly scores for each sample

		//Export
		scores := ExtractScores(f) //extracts scores into a [][]string for export
		file, _ := os.Create(fmt.Sprintf("../results/digitanalysis/go_data_%d.csv", digit))
		z := csv.NewWriter(file)
		z.WriteAll(scores)

		//Printing images with image package
		// for i := 0; i < len(intx); i++ {
		// 	if forest.Labels[i] == 1 { //The Labels category depends on the contamination ratio used.
		// 		pic := image.NewGray(image.Rect(0, 0, 28, 28))
		// 		pic.Pix = intx[i]
		// 		out, _ := os.Create("./" + fmt.Sprintf("%d_%d", digit, i) + ".png")
		// 		png.Encode(out, pic)
		// 	}
		// }

	}
}

func GetMNIST() (images [][]float64, labels []int) {

	//Loads data into [][]float64
	train, _, _ := GoMNIST.Load("../data")
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

func DigitFilter(images [][]float64, labels []int, digit int) (x [][]float64, intx [][]uint8) {
	//For filtering out a dataframe of MNIST images by digit labels
	x = make([][]float64, 0)  //initialize output array
	intx = make([][]uint8, 0) //'intx' is the uint8 version for printing using image package
	for i := range images {
		if labels[i] == digit { //Calls out whether label at image index is equal to the input digit
			xx := make([]float64, len(images[0])) //temporary variable
			intxx := make([]uint8, len(images[0]))
			for j := 0; j < len(images[0]); j++ {
				xx[j] = float64(images[i][j])
				intxx[j] = uint8(images[i][j])
			}
			x = append(x, xx)
			intx = append(intx, intxx)
		}
	}
	return x, intx
}
