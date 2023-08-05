# tested under Python 3.9.13

import gzip
import numpy as np

# read in the training images
print("Running getMNIST.py . . . ")
print("\nReading MNIST training data\n")
with gzip.open('../data/train-images-idx3-ubyte.gz','r') as f:
   imageSize = 28
   numImages = 60000
   f.read(16)
   buffer = f.read(imageSize * imageSize * numImages)
   images = np.frombuffer(buffer, dtype=np.uint8).astype(np.float32)
   images28x28 = images.reshape(numImages, imageSize, imageSize, 1)
   images784 = images28x28.reshape(numImages, 28*28)
   
print("Shape of numpy array images28x28:", images28x28.shape)
print("First image from images28x28:")
print(images28x28[0,:,:,0])
print("Shape of numpy array images784:", images784.shape)
print("First image from images784:")
print(images784[0,:])

# read in training labels
with gzip.open('../data/train-labels-idx1-ubyte.gz','r') as f:
   numLabels = 60000
   f.read(8)
   buffer = f.read(numLabels)
   labels = np.frombuffer(buffer, dtype=np.uint8)

print("Shape of numpy array labels:", labels.shape)

print("Finished running getMNIST.py . . . ")


