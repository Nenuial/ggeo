#' Format labels using scientific notation
#'
#' @param x Number to format
#'
#' @return A formatted expression
#' @export
ggeo_label_sci_10 <- function(x) {
  parse(text = gsub("e\\+?", "%.%10^", scales::scientific_format()(x)))
}

#' Format labels for pyramids
#'
#' @param x Number to format
#'
#' @return A formatted expression
#' @export
ggeo_label_pyramid <- function(x) {
  ggeo_label_sci_10(abs(x))
}

#' Format labels for relative pyramids
#'
#' @param x Number to format
#'
#' @return A formatted expression
#' @export
ggeo_label_abs_percent <- function(x) {
  scales::percent(abs(x), accuracy = 0.1)
}

#' Format population labels on pyramids
#'
#' `r lifecycle::badge("deprecated")`
#'
#' @param x The label
#' @param ... For compatibility
#'
#' @return Absolute
#' @export
#' @keywords internal
ggeoformat_pyramid_pop <- function(x, ...) {
  scales::number(abs(x), scale = 1e-3)
}



#' Remove specific breaks
#'
#' @param original_func The break function
#' @param remove_list The values to remove from the breaks
#'
#' @return A list
#' @export
ggeo_remove_breaks <- function(original_func, remove_list = list()) {
  function(x) {
    original_result <- original_func(x)
    original_result[!(original_result %in% remove_list)]
  }
}
