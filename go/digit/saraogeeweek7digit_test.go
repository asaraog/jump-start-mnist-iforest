package main

import (
	"testing"

	"github.com/e-XpertSolutions/go-iforest/v2/iforest"
)

func TestIsolationForestDigit(t *testing.T) {
	images, labels := GetMNIST()
	if len(images) != 60000 {
		t.Errorf("Error in data input. Incorrect number of images")
	}
	if len(images[0]) != 784 {
		t.Errorf("There is an incorrect number of pixels per image")
	}
	for digit := 0; digit < 10; digit++ {
		x, _ := DigitFilter(images, labels, digit)
		if len(x) == 60000 {
			t.Errorf("Filtering did not occur")
		}
		if len(x) == 0 {
			t.Errorf("Filtering removed all images. Something wrong with DigitFilter")
		}
		//Training of forest
		f := iforest.NewForest(100, 256, 0.0001) //initializes forest with 1000 trees, 256 samples, dummy threshold value (not used but maybe classifying)
		f.Train(x)                               //uses BSTs to do partitioning
		f.Test(x)                                // calculates anomaly scores for each sample

		if len(f.AnomalyScores) != len(x) {
			t.Errorf("Incorrect number of scores calculated by iforest package for %d digit", digit)
		}

		//Export
		scores := ExtractScores(f) //extracts scores into a [][]string for export
		if len(scores) != len(x)+1 {
			t.Errorf("Incorrect number of images or no header for export for %d digit", digit)
		}
	}
}
