#' Maps out the crop rows of the image (of a maize field)
#'
#' Finds the x coordinates of the crop rows in the image.
#'
#' This function is a combination of two previous functions \code{\link{best_rotation}} and \code{\link{crop_lines}} to find the best rotation and then map out the x coordinates of the crop rows in the image.
#'
#' @param picture_list The list of rotated images originally from a single image.
#'
#' @param ratio The first strict ratio used to identify which rotation has the most vertical crop rows.
#'
#' @param final_ratio The less-strict ratio used on the best image after rotations to capture smaller potential crop rows.
#'
#' @param intensity The amount of smoothing of the image.
#'
#' @return a list of x coordinates for the image on which the function was applied.
#'
#' @examples \donttest{crop_rows <- crop_row_finder(picture_list, 0.5, 0.05, 0.25)}
#'
#' @export

crop_row_finder <- function(picture_list, ratio, final_ratio, intensity) {

  best_image <- best_rotation(picture_list, ratio, intensity)

  crop_rows <- crop_lines(picture_list, final_ratio, best_image, intensity)

  return(crop_rows)
}
