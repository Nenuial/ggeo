#' Install DIN fonts
#'
#' @return Installs the fonts using sysfonts
#' @export
ggeo_install_fonts <- function() {
  sysfonts::font_add("DIN Alternate",
                     regular = here::here("data/fonts/DIN Alternate Bold.ttf"),
                     bold = here::here("data/fonts/DIN Alternate Bold.ttf"))

  sysfonts::font_add("DIN Condensed",
                     regular = here::here("data/fonts/DIN Condensed Bold.ttf"),
                     bold = here::here("data/fonts/DIN Condensed Bold.ttf"))
}
