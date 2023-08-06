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

	samples := 256
	threshold := 0.0001
	//For filtering out a digit
	for digit := 0; digit < 10; digit++ {
		//Filters out digit into x
		f := iforest.NewForest(100, samples, threshold)
		x := make([][]float64, 0)
		// intx := make([][]uint8, 0)
		for i := range images {
			if labels[i] == digit {
				xx := make([]float64, len(images[0]))
				// intxx := make([]uint8, len(images[0]))
				for j := 0; j < len(images[0]); j++ {
					xx[j] = float64(images[i][j])
					// intxx[j] = uint8(images[i][j])
				}
				x = append(x, xx)
				// intx = append(intx, intxx)
			}
		}
		f.Train(x)
		f.Test(x)
		file, _ := os.Create(fmt.Sprintf("../results/digitanalysis/go_data_%d.csv", digit))
		z := csv.NewWriter(file)
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
		z.WriteAll(scores)

		//Printing images with image package
		// for i := 0; i < len(intx); i++ {
		// 	if forest.Labels[i] == 1 {
		// 		pic := image.NewGray(image.Rect(0, 0, 28, 28))
		// 		pic.Pix = intx[i]
		// 		out, _ := os.Create("./" + fmt.Sprintf("%d_%d", digit, i) + ".png")
		// 		png.Encode(out, pic)
		// 	}
		// }

	}
}
