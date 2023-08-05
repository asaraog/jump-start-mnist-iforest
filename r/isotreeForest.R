# R isotree program for running isolation forest on MNIST training images
# tested on R version 4.3.1
 
# R isotree isolation forest documentation at
# https://cran.r-project.org/web/packages/isotree/isotree.pdf

# run getMNIST.R before running this program
# creating R objects images28x28x and images784 from the MNIST training data

library(isotree)

cat("\nRunning R isotree isolation forest . . . ")

# retrieve MNIST training image objects from R binary file
load(file = "MNIST_image_objects.RData")

training <- data.frame(images784)
names(training) <- paste0("x", 1:dim(images784)[2])

# initialize random number generator for reproducibility
SEEDSET <- 9999

# set isotree isolation forest hyperparameters
# trying to be consistent with the initial isolation forest paper
# but allowing for larger maximum depth
# the original paper had maximum depth of 8
iso <- isolation.forest(data = training,
sample_size = 256,
ntrees = 100,
missing_action = "fail",
seed = SEEDSET,
ndim = 1,
max_depth = ceiling(log2(nrow(training)))
)

# fit model to training images and determine anomaly scores
isotreeRScore <- predict(iso, training)
isotreeRScoreDF <- data.frame("isotreeRScore" = isotreeRScore)

write.csv(isotreeRScoreDF, file = "../results/isotreeRScores.csv", row.names = FALSE)

cat("\nFinished running R isotree isolation forest . . . \n")
