#' Finds local maxima of a vector
#'
#' This takes in a vector and finds the local maximas (credit user Tommy https://stackoverflow.com/questions/6836409/finding-local-maxima-and-minima).
#'
#' @param x A 1D array or vector
#'
#' @return A list of local maximas in the vector
#'
#' @examples
#'
#' \dontrun{maximas <- localMaxima(smoothed_vector)}
#'
#' @aliases local_maxima local_max local_maxes maximums
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
#' This takes in a vector and finds the local minimas (credit user Tommy https://stackoverflow.com/questions/6836409/finding-local-maxima-and-minima).
#'
#' @param x Any vector
#'
#' @return A list of local minimas in the vector
#'
#' \dontrun{minimas <- localMinima(smoothed_vector)}
#'
#' @aliases local_minima local_mins local_min minimums
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
