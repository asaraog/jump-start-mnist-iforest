# tested on R version 4.3.1
# documentation
# idx2r: Convert Files to and from IDX Format to Vectors, Matrices and Arrays
#     https://cran.r-project.org/web/packages/idx2r/index.html
# IDX is a format to store vector and arrays in binary format. 
# Reading IDX format is needed for instance to use the MNIST database 
# digits from http://yann.lecun.com/exdb/mnist/ provided by Yann LeCun.
# GitHub repository: https://github.com/edoffagne/idx2r

library(idx2r)
library(R.utils)

cat("\nRunning getMNIST.R . . . ")

# read in training images
fileName <- "../data/train-images-idx3-ubyte.gz"
images28x28 <- read_idx(gsub(pattern = "\\.gz", "", fileName))

cat("\nDimensions of images28x28:")
print(dim(images28x28))
# brute-force matrix transformation beginning with empty matrix
images784 <- matrix(, nrow = dim(images28x28)[1], 
                      ncol = dim(images28x28)[2]*dim(images28x28)[3], 
                      byrow = TRUE)
for (imageNo in 1:dim(images28x28)[1]) {
    image784Col <- 0
    for (imageRow in 1:dim(images28x28)[2]) {
        for (imageCol in 1:dim(images28x28)[3]) {
            image784Col <- image784Col + 1
            images784[imageNo, image784Col] <- images28x28[imageNo,imageRow,imageCol]
        }
    } 
}

cat("\nDimensions of images784")
print(dim(images784))

# save MNIST objects to R binary file
binaryFileName <- "MNIST_image_objects.RData"
save(images28x28, images784, file = binaryFileName)
cat("\nimages28x28 and images784 saved to", binaryFileName)

cat("\nFinished running getMNIST.R . . . \n")

