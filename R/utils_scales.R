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


#' Remove specific breaks
#'
#' @param original_func The break function
#' @param remove_list The values to remove from the breaks
#'
#' @return
#' @export
#'
#' @examples
ggeo_remove_breaks <- function(original_func, remove_list = list()) {
  function(x) {
    original_result <- original_func(x)
    original_result[!(original_result %in% remove_list)]
  }
}
