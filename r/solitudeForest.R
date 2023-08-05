# R solitude program for running isolation forest on MNIST training images
# tested on R version 4.3.1
 
# R solitude isolation forest documentation at
# https://cran.r-project.org/web/packages/solitude/solitude.pdf

# run getMNIST.R before running this program
# creating R objects images28x28x and images784 from the MNIST training data

library(solitude)

cat("\nRunning R solitude isolation forest . . . ")

# retrieve MNIST training image objects from R binary file
load(file = "MNIST_image_objects.RData")

training <- data.frame(images784)
names(training) <- paste0("x", 1:dim(images784)[2])

# initialize random number generator for reproducibility
SEEDSET <- 9999

# set isolation forest hyperparameters
iso <- isolationForest$new(
sample_size = 256,
num_trees = 100,
replace = FALSE,
seed = SEEDSET,
nproc = NULL,
respect_unordered_factors = "order",
max_depth = ceiling(log2(nrow(training)))
)

# fit model to training images and determine anomaly scores
iso$fit(training)
iforestRScore <- iso$predict(training)
iforestRScoreDF <- data.frame("iforestRScore" = iforestRScore)

write.csv(iforestRScoreDF, file = "../results/solitudeRScores.csv", row.names = FALSE)

cat("\nFinished running R solitude isolation forest . . . \n")
