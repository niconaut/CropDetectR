#' Converts a color image into a grayscale image using ExG methodology.
#'
#' Uses the Excessive Green (ExG) methodology to create a grayscale image of crop rows. The image is first broken down into a dataframe and each pixel is tested then put onto a varying intensity according to the ExG.
#'
#' The function first reads the image as a data frame with x and y columns for the pixel postion. Reading the data frame as \code{wide = "c"} also creates a column for red, green, and blue intensity. Each color column is then normalized and the normal values of the colors are put into the ExG equation, creating a new ExG column for each pixel. The values of the ExG are then treated as a 1D array and transformed into a format for the EBImage package commands.
#'
#' @param color_image The image to have ExG applied to it
#'
#' @return An image formatted for EBImage commands.
#'
#' @example
#' \donttest{
#' grayscale <- make_ExG(crop_rows)
#' }
#'
#' @export

make_ExG <- function(color_image) {

  df_field <- as.data.frame(color_image, wide="c")

  df_field <- df_field %>%
    mutate(r_small = c.1/(c.1 + c.2 + c.3)) %>%
    mutate(g_small = c.2/(c.1 + c.2 + c.3)) %>%
    mutate(b_small = c.3/(c.1 + c.2 + c.3))

  df_field <- df_field %>%
    mutate(ExG = 2*g_small - r_small - b_small)

  df_bw <- df_field %>%
    dplyr::select(c("x","y","ExG"))

  df_bw <- melt(df_bw, id = c("x","y"))

  names(df_bw)[3] <- "cc"

  df_bw <- na.omit(df_bw)

  df_bw$cc <- as.integer(df_bw$cc)

  df_bw <- Image(df_bw$value, dim = c(max(df_bw$x),max(df_bw$y)), colormode = 'Grayscale')

  return(df_bw)
}

