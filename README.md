# jump-start-mnist-iforest

The Modified National Institute of Standards and Technology (MNIST) dataset comprises 60 thousand training observations and 10 thousand test observations

Each observation image includes a 28-by-28 grid of values. Black (value 255) represents a foreground pixel for a digit, and white (value 0) the background. The digits are 0 through 9.
Labels 0 through 9 are associated with the images. 

These MNIST data are commonly used to demonstrate image classification, a supervised learning task. Classificaton models are trained on the labeled training observations and tested on the labeled test observations. Labels are central to supervised learning methods.

Our use of MNIST is distinct from previous uses. We are working with the images only, demonstrating unsupervised outlier/anomaly detection with isolation forests.

**getMNIST.go** uses the [GoMNIST](https://github.com/petar/GoMNIST) Go package to gather the necessary study data. This program also prepares comman-delimited text files for use in the R and Python isolation forest programs.

**runIForest.R** uses the R package [Solitude](https://cran.r-project.org/web/packages/solitude/solitude.pdf) to identify outliers/anomalies across the full set of 60 thousand images.

**runIForest.py** uses the [SciKit Learn isolation forest](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.IsolationForest.html) method to identify outliers/anomalies across the full set of 60 thousand images.

**runIForest.go** represents jump-start code for a Go isolation forest program. Initial development of a Go isolation forest program can be carried out with the smaller set of the 10 thousand test images. 

After Go development is complete, we can use the Go isolation forest program on the larger data set of 60 thousand observations, comparing Go results with results from the R and/or Python isolation forest programs on these same 60 thousand observations.

It is sufficient to compare outlier/anomaly detection methods using statistics summarizing the degree of agreement in normal/anomaly classification across the 60 thousand images, recognizing that hyperparameter settings affect outlier/anomaly classification results. 

