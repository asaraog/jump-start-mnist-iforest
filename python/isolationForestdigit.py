# Python program for running isolation forest on MNIST training images PER DIGIT

# isolation forest documentation:
# https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.IsolationForest.html

import math
import numpy as np
import pandas as pd
from sklearn.preprocessing import MinMaxScaler
from sklearn.ensemble import IsolationForest
from sklearn.pipeline import Pipeline
 
import getMNIST

print("Running Python isolation forest . . . ")

# isolation forest hyperparameters
CONTAMINATION_SET = "auto"  # frequency of anomalies is unknown
MAX_SAMPLES = "auto"  # small number ensures better results
# set to min of 256 or training sample size
N_ESTIMATORS = 1000  # changed number of trees to 1000 as there are 10 times more samples than original paper
# max_features will be set as recommended for random forests,
#   the square root of the number of features in the training data: 
#   max_features = math.trunc(training.shape[1]**0.5)

# Pandas training data frame
training = pd.DataFrame(getMNIST.images784)
labels = pd.DataFrame(getMNIST.labels)

#for filtering of digits
for i in range(0,10):
    zeroindex = [j for j in range(0,60000) if labels[0][j]==i]
    indices = pd.DataFrame({'Index':zeroindex})
    trainingdigit = training.loc[indices['Index']]
    SEED = np.random.RandomState(9999)
    iforest_pipeline_fit = Pipeline([
        ('scale', MinMaxScaler()),
        ('iforest', IsolationForest(max_samples = MAX_SAMPLES,
            n_estimators = 100, #changed to 100 as there are 10 times fewer samples per digit
            contamination = CONTAMINATION_SET,
            max_features = math.trunc(trainingdigit.shape[1]**0.5),
            random_state = SEED 
        ))
    ]).fit(trainingdigit)

    # predict anomalies on training data
    # IsolationForest returns 1 = normal, -1 = anomaly
    iforestPreds = iforest_pipeline_fit.predict(trainingdigit)
    iforestPythonScore = (-1)*iforest_pipeline_fit.score_samples(trainingdigit)
    iforestPythonScoreDF = pd.DataFrame(iforestPythonScore)  
    iforestPythonScoreDF.to_csv("../results/digitanalysis/pythonScores_%d.csv" % i, 
                                index_label = True,
                                header = ["iforestPythonScore"])

    print("Finished running Python isolation forest %d. . . " % i)