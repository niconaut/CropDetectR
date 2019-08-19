#' Rotates an image by x degrees
#'
#' Takes an image and rotates it by a number of degrees choosen by the user.
#'
#' The function takes in an image and rotates it by a number of degrees chosen by the user. It will keep rotating until it has reached the 360 degree limit and save the images into a list.
#'
#' @param picture The image to be rotated.
#'
#' @param degrees The degrees of rotation until 180 (30 = every 30 degrees).
#'
#' @return A list of pictures that have been rotated by x degrees each.
#'
#' @example
#' \donttest{
#' picture_list <- rotations(picture, 45)
#' }
#'
#' @export

rotations <- function(picture, degrees) {

  new_deg <- 0
  rotated <- imrotate(picture, new_deg)
  picture_list <- rotated
  # rotation_list <- paste('rotated_',new_deg,sep = "")

  while (new_deg < (360 - degrees)) {
    new_deg <- new_deg + degrees
    rotated <- imrotate(picture, new_deg)
    picture_list <- ci(picture_list, rotated)
    # rotation_list <- append(rotation_list, paste('rotated_', new_deg, sep = ""))
  }
  # return(rotation_list)
  return(picture_list)
}
