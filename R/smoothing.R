#' Smooth the average of binary picture column values
#'
#' Reads in an image and takes the average column value then smooths the array for more defined local maximas and minimas.
#'
#' The function reads in an image as a data frame then takes the mean of each column within the picture. Since the image is binary the mean will have a value between [0,1], with one being all white. It then uses \url{https://www.rdocumentation.org/packages/stats/versions/3.6.1/topics/smooth.spline} smooth.spline to get rid of jagged portions for more defined local maximas and minimas.
#'
#' @importFrom stats smooth.spline
#'
#' @param picture The binary image.
#'
#' @param intensity The intensity of smoothening of the vector.
#'
#' @return A smoothed vector.
#'
#' @examples \donttest{smoothed_vector <- smoothing(picture, intensity)}
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
