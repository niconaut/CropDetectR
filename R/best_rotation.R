#' Find the best rotated image for crop row detection
#'
#' \code{best_rotation} analyzes the list of rotated images of crop rows and finds the best angle of rotation for row detection.
#'
#' This takes in a list of images and looks at the average of each column in the form of an arry.
#' Ideally the image is black and white, with crops being white, so the range of numbers in the array {0,1}.
#'
#' The function then smooths out the array using \code{\link{smoothing}} so the local minima and maximas using \code{\link{local}} are more pronounced,
#' then creates two vectors of the local min/max of each image.
#' Then the ratio between neighbor local minima and maxima are calculated and compared to
#' a threshold given by the user. If the found ratio is larger than the threshold the ratio
#' is counted.
#'
#' @param picture_list One or more images created from rotating the same image.
#'
#' @param ratio Any number, typically (0-1) that will be the ratio needed to determine a true crop row.
#'
#' @param intensity The amount of smoothing of the image.
#'
#' @return The index of the image with the most \emph{good ratios} (ratios that exceed the given threshold).
#'
#' @example
#'
#' \dontrun{best_image <- best_rotation(picture_list, 0.5, 0.25)}
#'
#' @aliases best_image best_picture
#'
#' @export

best_rotation <- function(picture_list, ratio, intensity) {

  good_ratios <- NULL

  for (i in 1:length(picture_list)) {

    y_smooth <- smoothing(picture_list[i], intensity)
    peaks <- localMaxima(y_smooth)
    valleys <- localMinima(y_smooth)

    crop_rows <- NULL

    for (i in 1:length(peaks)) {
      right_ratio <- round(abs((y_smooth[peaks[i]]-y_smooth[min(valleys[valleys >= peaks[i]])])/(max(y_smooth))),5)
      left_ratio <- round(abs((y_smooth[peaks[i]]-y_smooth[max(valleys[valleys <= peaks[i]])])/(max(y_smooth))),5)

      if ((!is.na(left_ratio) & !is.na(right_ratio)) & (left_ratio > (ratio) & right_ratio > (ratio))) {
        crop_rows[i] <- peaks[i]
      }
    }
    good_ratios <- c(good_ratios,length(na.omit(crop_rows)))
  }
  return(which.max(good_ratios))
}
