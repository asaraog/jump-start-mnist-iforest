# Isolation Forests

## Project Summary
This project aims to compare Go with Python and R in training isolation forests, an unsupervised learning method to identify anomalies or outliers. It was first introduced by Liu 2008 by observing that path lengths for anomalies were significantly SHORTER by averaging over many trees. He introduces an anomaly score to normalize comparisons with HIGHER scores indicating more abnormality. This project will utilize the The Modified National Institute of Standards and Technology (MNIST) dataset which comprises of 60 thousand training observations and 10 thousand test observations of handwritten digits. Our use of MNIST will be conducted on the 60 thousand training observations only. An additional analysis was carried out by running independent tests for each digit (0-9) to compare Go and Python.

All models are benchmarked for runtime using 'time' before commands in the command line. Runtimes were significantly lower in Go.

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



