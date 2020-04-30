#' Return a paletteer palette depending on
#'
#' @param n Number of colors
#' @param params Parameters to pass on to paletteer
#'
#' @return A vector of colors
palette_chooser <- function(n, params) {
  if (params$type == "cont") {
    paletteer::paletteer_c(palette   = params$palette,
                           n         = n,
                           direction = params$dir)
  } else if (params$type == "dis") {
    paletteer::paletteer_d(palette   = params$palette,
                           n         = n,
                           direction = params$dir)
  } else if (params$type == "dyn") {
    paletteer::paletteer_dynamic(palette   = params$palette,
                                 n         = n,
                                 direction = params$dir)
  } else {
    stop("Palette type is unmatched")
  }
}

#' Return a color palette with option to center diverging palettes
#'
#' @param n Number of colors
#' @param center Where is the center (counted from the left). Use -1 for non diverging palettes.
#' @param params Parameters to pass on to paletteer
#'
#' @return A vector of colors
#' @export
return_palette <- function(n, center, params) {
  # Non diverging color palette, easy...
  if (center < 0) {
    palette_chooser(n, params)

    # Diverging parellel color palette, also easy...
  } else if (center == (n / 2)) {
    palette_chooser(n, params)

    # Diverging right heavy
  } else if (center < (n / 2)) {
    colors <- palette_chooser((n - center) * 2 + 1, params)
    utils::tail(colors, n)

    # Diverging left heavy
  } else if (center > (n / 2)) {
    colors <- palette_chooser((center - 1) * 2 + 1, params)
    utils::head(colors, n)

  } else {
    stop("Can't create color palette. Check parameters!")
  }
}
