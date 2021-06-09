#' Install fonts
#'
#' @return Installs the fonts using sysfonts
#' @export
ggeo_install_fonts <- function() {
  # DIN Alternate
  sysfonts::font_add("DIN Alternate",
                     regular = system.file("fonts/DIN Alternate Bold.ttf", package = "ggeo"),
                     bold = system.file("fonts/DIN Alternate Bold.ttf", package = "ggeo"),)

  # DIN Condensed
  sysfonts::font_add("DIN Condensed",
                     regular = system.file("fonts/DIN Condensed Bold.ttf", package = "ggeo"),
                     bold = system.file("fonts/DIN Condensed Bold.ttf", package = "ggeo"))

  # Fira Sans
  sysfonts::font_add("FiraSans",
                     regular = system.file("fonts/FiraSans-Light.ttf", package = "ggeo"),
                     italic = system.file("fonts/FiraSans-LightItalic.ttf", package = "ggeo"),
                     bold = system.file("fonts/FiraSans-Regular.ttf", package = "ggeo"),
                     bolditalic = system.file("fonts/FiraSans-Italic.ttf", package = "ggeo"))
}
