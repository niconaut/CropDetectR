#' Finds local maxima of a vector
#'
#' Takes in a vector and finds the local maximas.  (Credit user Tommy https://stackoverflow.com/questions/6836409/finding-local-maxima-and-minima).
#'
#' @param x A 1D array or vector
#'
#' @return A list of local maximas in the vector
#'
#' @example
#' \donttest{
#' maximas <- localMaxima(smoothed_vector)
#' }
#'
#' @export

localMaxima <- function(x) {
  # Use Inf instead if x is numeric (non-integer)
  y <- diff(c(-.Machine$integer.max, x)) > 0L
  rle(y)$lengths
  y <- cumsum(rle(y)$lengths)
  y <- y[seq.int(1L, length(y), 2L)]
  if (x[[1]] == x[[2]]) {
    y <- y[-1]
  }
  y
}

#' Finds local minima of a vector
#'
#' Takes in a vector and finds the local minimas.  (Credit user Tommy https://stackoverflow.com/questions/6836409/finding-local-maxima-and-minima).
#'
#' @param x Any vector
#'
#' @return A list of local minimas in the vector
#'
#' @example
#' \donttest{
#' minimas <- localMinima(smoothed_vector)
#' }
#'
#' @export

localMinima <- function(x) {
  # Use Inf instead if x is numeric (non-integer)
  y <- diff(c(.Machine$integer.max, x)) > 0L
  rle(y)$lengths
  y <- cumsum(rle(y)$lengths)
  y <- y[seq.int(1L, length(y), 2L)]
  if (x[[1]] == x[[2]]) {
    y <- y[-1]
  }
  y
}
