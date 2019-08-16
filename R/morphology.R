#' Denoise a black and white image to only core features
#'
#' This takes a black and white image, preferrably the image produced by an otsu transformation, and gets rid of all extrenuous features. Many long skinny features and random clumps of features will be erased, leaving only the larger core features of an image.
#'
#' Using morphology functions \code{\url{}} to get rid of unwanted noise and features.
#' With this package the features to eliminate will mostly be random weeds and bushy leaves. The specific functions being use are opening (\code{\url{}) and closing (\code{\url{}).
#' The first step of the function is opening to start to get rid of smaller features. It then closes the holes created by opening the image and repeats this process several times with bigger and bigger kernels.
#' This allows more important featrures to remain while insignificant ones are erased. There is a minimum starting size of 2, because when doing the first closing process it needs to be at least a 1 pixel kernel.
#'
#' @param images One, or more, image(s).
#'
#' @param size The starting size of the kernel for morphology (minimum of 2).
#'
#' @example
#'
#' \dontrun{final_blob <- blobify(images)}
#'
#' @aliases denoise declutter blob
#'
#' @export

blobify <- function(images, size) {

  kern3 <- makeBrush(size, shape = 'box')
  open1 <- opening(image, kern3)

  kern2 <- makeBrush((size-1), shape = 'box')
  close1 <- closing(open1, kern2)

  kern4 <- makeBrush((size+1), shape = 'box')
  open2 <- opening(close1, kern4)

  close2 <- closing(open2, kern3)

  kern5 <- makeBrush((size+2), shape = 'box')
  open3 <- opening(close2, kern5)

  close3 <- closing(open3, kern4)

  final_blob <- EBImage::dilate(close3, kern3)
  final_blob <- as.cimg(final_blob)

  return(final_blob)

}
