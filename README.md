# jump-start-mnist-iforest

The Modified National Institute of Standards and Technology (MNIST) dataset comprises 60 thousand training observations and 10 thousand test observations

Each observation image includes a 28-by-28 grid of pixel values. Black (value 255) represents a foreground pixel for a digit, and white (value 0) the background. The labels associated with the images represent digits are 0 through 9.

These MNIST data are commonly used to demonstrate image classification, a supervised learning task. Classificaton models are trained on the labeled training observations and tested on the labeled test observations. Labels are central to supervised learning methods.

Our use of MNIST is distinct from previous uses. Our isolation forests will be constructed with training images only, demonstrating unsupervised outlier/anomaly detection.

### Under the data directory

Compressed image and label files for MNIST. See **README.md** under this directory for addition information about the original MNIST data.

### Under the python directory

**getMNIST.py** uses the Python packages [gzip](https://github.com/petar/GoMNIST) to read the original MNIST training data. 

**isolationForest.py** uses the [SciKit Learn isolation forest](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.IsolationForest.html) package to obtain anomaly scores for the 60 thousand training images.

### Under the r directory

**getMNIST.R** uses the R package [idx2r](https://cran.r-project.org/web/packages/idx2r/index.html) to read the original MNIST training data. 

**isolationForest.R** uses the R package [Solitude](https://cran.r-project.org/web/packages/solitude/solitude.pdf) to obtain anomaly scores for the 60 thousand training images.

**isotreeForest.R** uses the R package [isotree](https://cran.r-project.org/web/packages/isotree/isotree.pdf) to obtain anomaly scores for the 60 thousand training images.

### Under the results directory

**labels.csv** shows the digits associated with the images. Not used in isolation forests. May be useful in subsequent analyses showing which of the digits are more likely to have outliers/anomalies.

**pythonScores.csv** comma-delimited file of Python anomaly scores.

**solitudeRScores.csv** comma-delimited file of R solitude anomaly scores.

**isotreeRScores.csv** comma-delimited file of R isotree anomaly scores.

It is sufficient to compare outlier/anomaly detection methods by examining scatterplots and correlations between the anomaly scores obtained from the Python, R, and Go isolation forest programs, recognizing that algorithms and hyperparameter settings can affect these scores. 

**analyzeResults.R** is an R program that analyzes the results from the Python and R isolation forests. We examine R results from both the solitude and isotree packages. We should Add the Go results after these are available.

Base R graphics are used to summarize results in portable document format (pdf) figure files.

Results from Python and R scores are not expected to be in perfect agreement because the algorithms and hyperparameter sets differ.

Initial results from Python and R solitude isolation forests are disconcerting because the anomaly score distributions have different shapes. Also, the correlation between Python and R anomaly scores is only 0.58. These results were the major reason we considered the R isotree package.

Results for Python and R isotree methods were closer, with a correlation of 0.72. With additional manipulation of hyperparameter settings, we may be able to move these results closer. The R isotree package appears to be much more customizable, offering many more hyperparameter options than the solitude package.

Bottom line: More work is needed on the Python and R isolation forest programs. Also, we have the option of reviewing images that are identified as outliers or anomalous images and seeing how these differ from normal images.





