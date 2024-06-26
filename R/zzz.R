#' A shortcut function for the system.file to the ggeo package
#'
#' @inheritDotParams base::system.file
#'
#' @return A file path
#'
#' @keywords internal
#' @export
ggeo_file <- function(...) {
  system.file(..., package = "ggeo", mustWork = TRUE)
}

.onLoad <- function(lib, pkg) {
  # Use showtext ------------------------------------------------------------
  showtext::showtext_auto()


  # Check registered fonts --------------------------------------------------
  registered <- sysfonts::font_families()
  needed <- c("Helvetica", "Fira Sans", "Fira Sans Light")

  check_registered_fonts <- function(font) {
    if (!(font %in% registered)) {
      if (Sys.info()[["sysname"]] == "Darwin") {
        ggeo_install_fonts_macos(system_wide = TRUE)
        ggeo_register_fonts()
      }
    }
  }

  needed |>
    purrr::walk(check_registered_fonts)
}
