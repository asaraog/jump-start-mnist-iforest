# Isolation Forests

## Project Summary
This project aims to compare [Go](./go) with [Python](./python) and [R](./r) in training isolation forests, an unsupervised learning method to identify anomalies or outliers. It was introduced by [Liu 2008](https://cs.nju.edu.cn/zhouzh/zhouzh.files/publication/icdm08b.pdf) by observing that path lengths for anomalies were significantly SHORTER by averaging over many trees. He introduces an anomaly score to normalize comparisons with HIGHER scores indicating more abnormality. This project will utilize the The Modified National Institute of Standards and Technology (MNIST) dataset which comprises of 60 thousand training observations and 10 thousand test observations of handwritten digits. Our use of MNIST will be conducted on all of the 60 thousand training observations and [compared](./results) across languages for Go, Risotree, Rsolitude and Python's sklearn. An [additional analysis](./results/digitanalysis/) was carried out by running independent tests for each digit (0-9) to compare Go and Python.

The [go-iforest](https://github.com/e-XpertSolutions/go-iforest) package was used for the analysis in Go. [Another package that already analyzed the MNIST dataset](https://github.com/malaschitz/randomForest/blob/master/examples/isolation2.go) was considered though was dropped because it doesn't let you change the hyperparameter for number of samples in a tree. Comparison code for Risotree, Rsolitude and Python was adapted from [Miller 2023](https://github.com/ThomasWMiller/jump-start-mnist-iforest). Hyperparameters were kept the same across languages with 1000 trees and 256 samples for each tree. For each digit, the number of trees was changed to 100 as there are 10 times fewer parameters than in the whole dataset.

All models are benchmarked for runtime using 'time' before commands in the command line. Runtimes were significantly lower in Go with runtimes of __,__, ___ and ___ for Go, Risotree, Rsolitude and Python respectively. This is likely due to the goroutines utilized in the go-iforest package. With the difference in processing time, Go is strongly recommended for large datasets. Anomaly scores were sufficiently correlated across languages with the corresponding correlations below:

---

The per digit correlations for anomaly scores are also reported between Python and Go here:

---

## Under the data directory

Compressed image and label files for MNIST. See **README.md** under this directory for addition information about the original MNIST data.

## Under the go directory

**saraogeeweek7.go:** loads MNIST training data and trains isolation forest on the whole dataset and calculates anomaly scores for each sample.

**saraogeeweek7_test.go:** does unit tests for 

**saraogeeweek7digit.go** loads MNIST training data and trains isolation forest for each digit and calculates anomaly scores for each sample.

**saraogeeweek7digit_test.go** does unit tests for

**Week7** executable for saraogeeweek7.go on whole dataset cross-compiled Go code for Mac/Windows. 

**Week7digit** executable for saraogeeweek7digit.go for each digit cross-compiled Go code for Mac/Windows.

## Under the python directory

**getMNIST.py** uses the Python packages [gzip](https://github.com/petar/GoMNIST) to read the original MNIST training data. 

**isolationForest.py** uses the [SciKit Learn isolation forest](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.IsolationForest.html) package to obtain anomaly scores for the 60 thousand training images.

**isolationForestdigit.py** uses the [SciKit Learn isolation forest](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.IsolationForest.html) package to obtain anomaly scores for each digit subset for the 60 thousand training images.

## Under the r directory

**getMNIST.R** uses the R package [idx2r](https://cran.r-project.org/web/packages/idx2r/index.html) to read the original MNIST training data. 

**isolationForest.R** uses the R package [Solitude](https://cran.r-project.org/web/packages/solitude/solitude.pdf) to obtain anomaly scores for the 60 thousand training images.

**isotreeForest.R** uses the R package [isotree](https://cran.r-project.org/web/packages/isotree/isotree.pdf) to obtain anomaly scores for the 60 thousand training images.

## Under the results directory

**labels.csv** shows the digits associated with the images. Not used in isolation forests. May be useful in subsequent analyses showing which of the digits are more likely to have outliers/anomalies.

**pythonScores.csv** comma-delimited file of Python anomaly scores.

**solitudeRScores.csv** comma-delimited file of R solitude anomaly scores.

**isotreeRScores.csv** comma-delimited file of R isotree anomaly scores.

**go_data.csv** comma-delimited file of Go anomaly scores.

**analyzeResults.R** is an R program that analyzes the results from the Python, Go and R isolation forests. We examine R results from both the solitude and isotree packages. 

Base R graphics are used to summarize results in portable document format (pdf) figure files.

## Under the results/digitanalysis directory

**pythonScores_i.csv** comma-delimited file of Python anomaly scores for each digit i.

**go_data_i.csv** comma-delimited file of Go anomaly scores for each digit i.

**analyzedigitResults.R** is an R program that analyzes the results from the Python and Go isolation forests trained on each digit by itself.

## Installation

Download or git clone this project onto local machine into folder on local machine.
```
git clone https://github.com/asaraog/msds431week7.git

cd msds431week7/go
time ./Week7
time ./Week7digit

cd ../python
time python3 isolateForest.py
time python3 isolateForestdigit.py

cd ../r
time Rscript isotreeForest.R
time Rscript solitudeForest.R

cd ../results
time Rscript analyzeResults.R
cd digitanalysis
time Rscript analyzeResultsdigit.R

```

## References

Liu, Fei Tony, Kai Ming Ting, and Zhi-Hua Zhou. 2008. [“Isolation Forest.”](https://cs.nju.edu.cn/zhouzh/zhouzh.files/publication/icdm08b.pdf). In ICDM '08: Proceedings of the 2008 Eighth IEEE International Conference on Data Mining, December 2008, 413–422.



