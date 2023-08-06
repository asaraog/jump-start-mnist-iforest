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
	train, _, _ := GoMNIST.Load("../data")
	images := make([][]float64, len(train.Images))
	labels := make([]int, len(train.Images))

	for i := 0; i < len(train.Images); i++ {
		images[i] = make([]float64, len(train.Images[0]))
		for p := range train.Images[0] {
			images[i][p] = float64(train.Images[i][p])
			labels[i] = int(train.Labels[i])

		}
	}

	//Training of forest
	TREES := 1000
	samples := 256
	threshold := 0.0001
	f := iforest.NewForest(TREES, samples, threshold)

	f.Train(images)
	f.Test(images)

	//Export
	file, _ := os.Create("../results/go_data.csv")
	w := csv.NewWriter(file)
	scores := make([][]string, len(f.AnomalyScores)+1)
	for i := 0; i < len(scores); i++ {
		scores[i] = make([]string, 2)
		if i == 0 {
			scores[0][0] = "id"
			scores[0][1] = "scores"
		}
		if i != 0 {
			score := 0.5 - f.AnomalyScores[i-1]
			scores[i][0] = fmt.Sprintf("%d", i-1)
			scores[i][1] = fmt.Sprintf("%f", score)
		}

	}
	w.WriteAll(scores)
}
