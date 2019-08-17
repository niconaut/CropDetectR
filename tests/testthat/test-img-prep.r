context("Image ExG and Binarization")
library(crop.row.finder)
library(imager)
library(magick)
library(ggplot2)
library(dplyr)
library(reshape2)
library(EBImage)

img <- load.image('C:/Users/Nico/Desktop/UNOwork/img_26.JPG')

img_grayscale <- make_ExG(img)

test_that("image is not a single channel", {
  expect_equal(length(dim(img_grayscale)), 2)
})

test_that("otsu binarization", {
  expect_equal(length(unique(black_white[1:length(black_white)])), 2)
})
