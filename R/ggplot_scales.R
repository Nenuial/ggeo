#' Format labels
#'
#' These functions extend the {[scales](https://scales.r-lib.org)}
#' package and allow formatting labels.
#'
#' @details
#' [`ggeo_label_sci_10()`] is used to format numbers with a clean
#' scientific format using a multiplier and not the *ugly* notation
#' using the letter *e*.
#'
#' [`ggeo_label_pyramid()`] is used for population pyramids with
#' absolute numbers. It formats the absolute number using
#' [`ggeo_label_sci_10()`].
#'
#' [`ggeo_label_abs_percent()`] is also used for population pyramids
#' but with relative numbers (percents). It uses [`scales::percent()`]
#' and absolute numbers.
#'
#' @param x Number to format
#'
#' @return A formatted string for the scales
#' @export
ggeo_label_sci_10 <- function(x) {
  parse(text = gsub("e\\+?", "%.%10^", scales::scientific_format()(x)))
}

#' @rdname ggeo_label_sci_10
#' @export
ggeo_label_pyramid <- function(x) {
  ggeo_label_sci_10(abs(x))
}

#' @rdname ggeo_label_sci_10
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
#' This function can be used to modify the breaks of a ggplot2
#' scale. It is specifically designed to remove the some breaks
#' in the scale.
#'
#' @param original_func The function to create the breaks.
#'   Use the break functions from the {[scales](https://scales.r-lib.org)}
#' @param remove_list The values to remove from the scale.
#'
#' @return A list
#' @export
#' @examples
#' ggplot2::ggplot(ggplot2::aes(x = speed, y = dist), data = cars) +
#'   ggplot2::geom_point() +
#'   ggplot2::labs(title = "Fast cars!") +
#'   ggplot2::scale_y_continuous(
#'     breaks = ggeo::ggeo_remove_breaks(scales::breaks_pretty(6), list(0)),
#'   )
#'
ggeo_remove_breaks <- function(original_func, remove_list = list()) {
  function(x) {
    original_result <- original_func(x)
    original_result[!(original_result %in% remove_list)]
  }
}
