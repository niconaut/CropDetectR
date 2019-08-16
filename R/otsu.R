#' Changes a grayscale image to black and white
#'
#' Takes in a grayscale image and finds the best threshold for binarization of the image.
#'
#' This function uses the \code{\link{}} otsu function from EBImage to make the grayscale image into a binary black and white image. How the otsu transformation works and chooses the threshold can be understood more clearly at \code{\url{}}.
#'
#' @param image The image generated after the ExG transformation in the EBImage format.
#'
#' @return A binary image
#'
#' @example
#'
#' \dontrun{BW_Image <- make_bw(image)}
#'
#' @aliases otsu
#'
#' @export

make_bw <- function(image){
  BW <- image > otsu(image, range = c(max(image),min(image)))
  return(BW)
}
