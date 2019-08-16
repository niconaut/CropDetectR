#' Smooth the average of binary picture column values
#'
#' \code{smoothing} reads in an image and takes the average column value then smooths the array for more defined local maximas and minimas.
#'
#' The function reads in an image as a data frame then takes the mean of each column within the picture. Since the image is binary the mean will have a value between [0,1], with one being all white. It then uses \code{\link{}} smooth.spline to get rid of jagged portions for more defined local maximas and minimas.
#'
#' @param picture The binary image.
#'
#' @param intensity The intensity of smoothening of the vector.
#'
#' @return A smoothed vector.
#'
#' @example
#'
#' \dontrun{smoothed_vector <- smoothing(picture)}
#'
#' @aliases smooth_vector smooth_image make_smooth smoothen
#'
#' @export

smoothing <- function(picture, intensity) {

  BW_df <- as.data.frame(picture) %>%
    select(x, y, value) %>%
    group_by(x) %>%
    summarise(row_threshold = mean(value))

  y <- as.array(BW_df$row_threshold)
  smoothed <- smooth.spline(BW_df$x,y,spar = intensity)
  y_smooth <- smoothed$y
  return(y_smooth)
}
