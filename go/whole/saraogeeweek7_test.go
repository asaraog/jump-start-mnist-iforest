package main

import (
	"github.com/e-XpertSolutions/go-iforest/v2/iforest"

	"testing"
)

func TestIsolationForest(t *testing.T) {

	images, _ := GetMNIST()
	if len(images) != 60000 {
		t.Errorf("Error in data input. Incorrect number of images")
	}
	if len(images[0]) != 784 {
		t.Errorf("There is an incorrect number of pixels per image")
	}
	//Training of forest
	f := iforest.NewForest(1000, 256, 0.0001) //initializes forest with 1000 trees, 256 samples, dummy threshold value (not used but maybe classifying)
	f.Train(images)                           //uses BSTs to do partitioning
	f.Test(images)                            // calculates anomaly scores for each sample

	if len(f.AnomalyScores) != 60000 {
		t.Errorf("Incorrect number of scores calculated by iforest package")
	}

	//Export
	scores := ExtractScores(f) //extracts scores into a [][]string for export
	if len(scores) != 60001 {
		t.Errorf("Incorrect number of images or no header for export")
	}

}
