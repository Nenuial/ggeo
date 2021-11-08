#' @importFrom magrittr %>%
#' @export
magrittr::`%>%`

#' @importFrom magrittr %<>%
#' @export
magrittr::`%<>%`

#' @importFrom rlang !!
#' @export
rlang::`!!`

.onLoad = function(lib, pkg) {
  # Use showtext ------------------------------------------------------------
  showtext::showtext_auto()


  # Check registered fonts --------------------------------------------------
  registered <- sysfonts::font_families()
  needed <- c("Helvetica", "Fira Sans", "Fira Sans Light")

  check_registered_fonts <- function(font) {
    if (!(font %in% registered)) geovizr::gvz_register_fonts()
  }

  needed |>
    purrr::walk(check_registered_fonts)
}
