#' Find crop lines of an image
#'
#' Finds the crop row lines of an image. It uses other functions in the package such as: \code{\link{smoothing}}, \code{\link{localMaxima}}, and \code{\link{localMinima}}.
#'
#' This function takes in: one or more images, a ratio that will become the threshold of what qualifies as a crop row, the index from \code{\link{best_rotation}} of what the best image was, and the intensity of smoothening from \code{\link{smoothing}}. It then uses the ratio as the threshold for acceptable crop rows and makes a list of the x-axis values.
#'
#' @param picture_list One or more images created from rotating the same image.
#'
#' @param final_ratio Any number, typically (0-1) that will be the ratio needed to determine a true crop row.
#'
#' @param best_image The output of the best_rotations function.
#'
#' @param intensity The amount of smoothing of the image.
#'
#' @return A vector of x-axis values for a given image.
#'
#' @example
#' \donttest{
#' crop_positions <- crop_lines(picture_list, 0.5, best_image, 0.25)
#' }
#'
#' @export

crop_lines <- function(picture_list, final_ratio, best_image, intensity) {

  crop_ratios <- NULL

  for (i in 1:length(picture_list)) {

    crop_smooth <- smoothing(picture_list[which.max(best_image)], intensity)
    peaks <- localMaxima(crop_smooth)
    valleys <- localMinima(crop_smooth)

    crop_lines <- NULL

    for (i in 1:length(peaks)) {

      right_ratio <- round(abs((crop_smooth[peaks[i]]-crop_smooth[min(valleys[valleys >= peaks[i]])])/(max(crop_smooth))),5)
      left_ratio <- round(abs((crop_smooth[peaks[i]]-crop_smooth[max(valleys[valleys <= peaks[i]])])/(max(crop_smooth))),5)

      if ((!is.na(left_ratio) & !is.na(right_ratio)) & (left_ratio > (final_ratio) & right_ratio > (final_ratio))) {
        crop_lines[i] <- peaks[i]
      }
    }
    crop_ratios <- c(crop_ratios,length(na.omit(crop_lines)))
  }
  return(na.omit(crop_lines))
}
