#' Format population labels on pyramids
#'
#' @param x The label
#' @param ... For compatibility
#'
#' @return Absolute
#' @export
ggeoformat_pyramid_pop <- function(x, ...) {
  scales::number(abs(x), scale = 1e-3)
}
