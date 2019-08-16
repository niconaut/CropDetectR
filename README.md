# crop.row.finder: a crop row detection package

## Introduction

crop.row.finder is a package developed to identify crop rows from a drone image. It uses techniques such as: **ExG** color transformation, **Otsu Transformation**, and **morphology**.

## Workflow

A color image of crop rows is first transformed into a grayscale image using *ExG* [citation], then made binary using the *Otsu Transformation* [citation]. The binary image is then modified using morphology [citation] to best isolate crop row centers and remove all unwanted noise (leaves, grass patches, weeds).

Once modified to an acceptable level, the image is rotated to find the degree of rotation that gives the most vertical crop rows. Crop rows need to be vertical so when taking the average of each column (value between [0,1]), high value columns can be identified as crop rows.

Ratios between local maxima and minima determine the 'goodness' of the crop row. large ratios = well defined crop rows, and the rotation with the most 'good ratios' is the best rotation for crop row identification of that image.

## Results

Demonstration of transformation on crop rows.

Before:

<img src="images/before_rows.JPG" alt="before" width="70%" height="70%"/>

After:

<img src="images/after_rows.JPG" alt="before" width="70%" height="70%"/>
