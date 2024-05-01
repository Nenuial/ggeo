#' Return a paletteer palette depending on
#'
#' @param n Number of colors
#' @param params Parameters to pass on to paletteer
#' Must be a list with:
#' * type: the type of palette, on of `cont`, `dis` or `dyn`
#' * palette: the \{paletteer\} palette
#' * dir: the palette direction
#'
#' @export
#' @keywords internal
#'
#' @return A vector of colors
palette_chooser <- function(n, params) {
  lifecycle::deprecate_warn("1.0.0", "palette_chooser()", "ggeo_palette_chooser()")

  ggeo_palette_chooser(n, params)
}

#' Return a paletteer palette depending on
#'
#' @param n Number of colors
#' @param params Parameters to pass on to paletteer
#' Must be a list with:
#' * type: the type of palette, on of `cont`, `dis` or `dyn`
#' * palette: the {paletteer} palette
#' * dir: the palette direction
#'
#' @export
#'
#' @return A vector of colors
ggeopal_chooser <- function(n, params) {
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
#' @param center Where is the center (counted from the left).
#'  Use -1 for non diverging palettes.
#' @param params Parameters to pass on to paletteer
#'
#' @return A vector of colors
#' @export
#' @keywords internal
return_palette <- function(n, center, params) {
  lifecycle::deprecate_warn("1.0.0", "return_palette()", "ggeopal_center()")
  ggeopal_center(n, center, params)
}

#' Return a color palette with option to center diverging palettes
#'
#' @param n Number of colors
#' @param center Where is the center (counted from the left).
#'  Use -1 for non diverging palettes.
#' @param params Parameters to pass on to paletteer
#'
#' @return A vector of colors
#' @export
ggeopal_center <- function(n, center, params) {
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


#' Generate colors from a HEX color using HCL palette
#'
#' @param hex A string HEX color
#' @param n Number of colors wanted
#'
#' @return A string vector of HEX colors
#' @export
#'
#' @examples
#'
#' ggeopal_hex_to_hcl("#222b4c") |>
#'   prismatic::color()
#'
#' ggeopal_hex_to_hcl("#222b4c", 6) |>
#'   prismatic::color()
#'
#' @importClassesFrom colorspace polarLUV
ggeopal_hex_to_hcl <- function(hex, n = 4) {
  color <- colorspace::hex2RGB(hex)
  color <- methods::as(color, "polarLUV")

  color_l <- color@coords[1]
  color_c <- color@coords[2]
  color_h <- color@coords[3]

  colorspace::sequential_hcl(n = n + 1,
                             h = color_h,
                             c = c(color_c, color_c, NA),
                             l = c(color_l, 100),
                             power = 1.75)[seq_len(n)]
}

#' Create gradient for palette colors
#'
#' @param pal A vector of colors
#'
#' @return Print color vectors
#' @export
#' @keywords internal
ggeopal_pal_to_gradient <- function(pal) {
  lifecycle::deprecate_warn("1.0.0", "ggeopal_pal_to_gradient()", "ggeopal_to_gradient()")
}

#' Create gradient for palette colors
#'
#' @param pal A vector of colors
#'
#' @return Print color vectors
#' @export
#' @examples
#' ggeopal_to_gradient("#dd4123")
#' ggeopal_to_gradient("#ee950b")
#' ggeopal_to_gradient("#0b6b8b")
#'
ggeopal_to_gradient <- function(pal) {
  colors <- prismatic::color(pal)
  print(prismatic::clr_lighten(colors, shift = .5, space = "HCL"))
  print(colors)
  print(prismatic::clr_darken(colors, shift = .3, space = "HCL"))
  print(prismatic::clr_darken(colors, shift = .6, space = "HCL"))
}
