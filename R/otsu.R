#' Changes a grayscale image to black and white
#'
#' Takes in a grayscale image and finds the best threshold for binarization of the image.
#'
#' This function uses the \url{https://github.com/aoles/EBImage/blob/master/R/otsu.R}} otsu function from EBImage to make the grayscale image into a binary black and white image. How the otsu transformation works and chooses the threshold can be understood more clearly at \url{http://www.labbookpages.co.uk/software/imgProc/otsuThreshold.html}}.
#'
#' @param image The image generated after the ExG transformation in the EBImage format.
#'
#' @return A binary image
#'
#' @example
#' \donttest{
#' BW_Image <- make_bw(image)
#' }
#'
#' @export

make_bw <- function(image){

  BW <- image > otsu(image, range = c(max(image),min(image)))
  return(BW)
}
