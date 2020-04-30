#' Generate four colors from a HEX color using HCL palette
#'
#' @param hex A string HEX color
#'
#' @return A string vector of HEX colors
#' @export
#'
#' @importClassesFrom colorspace polarLUV
ggeopal_hex_to_hcl <- function(hex, n = 4) {
  color <- colorspace::hex2RGB(hex)
  color <- as(color, "polarLUV")

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
ggeopal_pal_to_gradient <- function(pal) {
  colors <- prismatic::color(pal)
  print(prismatic::clr_lighten(colors, shift = .5, space = "HCL"))
  print(colors)
  print(prismatic::clr_darken(colors, shift = .3, space = "HCL"))
  print(prismatic::clr_darken(colors, shift = .6, space = "HCL"))
}
