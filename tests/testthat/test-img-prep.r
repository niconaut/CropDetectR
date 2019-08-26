context("Image ExG and Binarization")
library(CropDetectR)
library(imager)
library(ggplot2)
library(dplyr)
library(reshape2)
library(EBImage)

img <- c(0.3176471, 0.3294118, 0.2352941, 0.2274510, 0.3176471, 0.4235294, 0.4588235, 0.2823529, 0.1764706, 0.2627451, 0.2901961, 0.2823529, 0.3882353, 0.5372549, 0.1490196, 0.2784314, 0.1411765, 0.2039216, 0.3058824, 0.2196078, 0.5058824, 0.4235294, 0.4274510, 0.3137255, 0.2980392, 0.3725490, 0.4588235, 0.4862745, 0.3882353, 0.2745098, 0.3411765, 0.3607843, 0.3372549, 0.4235294, 0.5647059, 0.2549020, 0.3764706, 0.2196078, 0.2745098, 0.3607843, 0.2549020, 0.5333333, 0.3960784, 0.4117647, 0.3058824, 0.2980392, 0.3843137, 0.4862745, 0.5176471, 0.3607843, 0.2588235, 0.3333333, 0.3607843, 0.3490196, 0.4509804, 0.5960784, 0.2274510, 0.3607843, 0.2117647, 0.2745098, 0.3725490, 0.2823529, 0.5647059)

img <- as.cimg(img, dim = c(7,3,1,3))

img_grayscale <- make_ExG(img)

test_that("image is not a single channel", {
  expect_equal(length(dim(img_grayscale)), 2)
})

black_white <- make_bw(img_grayscale)

test_that("otsu binarization", {
  expect_equal(length(unique(black_white[1:length(black_white)])), 2)
})
