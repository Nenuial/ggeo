#' Install fonts on MacOS
#'
#' @param system_wide Install the fonts for all users?
#'
#' @return Move fonts to MacOS font folder
#' @export
ggeo_install_fonts_macos <- function(system_wide = FALSE) {
  new_font_path <- "~/Library/Fonts/"
  if (system_wide) new_font_path <- "/Library/Fonts/"

  fs::dir_ls(path = ggeo_file("fonts/")) |>
    purrr::walk(
      .f = ~fs::file_copy(
        path = .x,
        new_path = new_font_path,
        overwrite = TRUE
      )
    )
}

#' Install fonts on Linux
#'
#' @return Move fonts to Linux font folders
#' @export
ggeo_install_fonts_linux <- function() {
  fs::dir_ls(path = ggeo_file("fonts/")) |>
    purrr::walk(
      .f = ~fs::file_copy(
        path = .x,
        new_path = "~/.local/share/fonts/",
        overwrite = TRUE
      )
    )

  fs::dir_ls(path = ggeo_file("fonts/")) |>
    purrr::walk(
      .f = ~fs::file_copy(
        path = .x,
        new_path = "~/.local/share/fonts/",
        overwrite = TRUE
      )
    )
}

#' Register fonts
#'
#' @export
#' @keywords internal
ggeo_register_fonts <- function() {
  sysfonts::font_add("Fira Sans", regular = "FiraSans-Regular.otf", bold = "FiraSans-Bold.otf", italic = "FiraSans-Italic.otf")
  sysfonts::font_add("Fira Sans Light", regular = "FiraSans-Light.otf", italic = "FiraSans-LightItalic.otf")
  sysfonts::font_add("Helvetica", regular = "Helvetica.ttc")
}
