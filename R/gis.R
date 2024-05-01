#' Return sf coord for given CRS code
#'
#' A function that uses [`geotools::gtl_crs_proj()`] to
#' get the CRS configuration and applies it to a ggplot2
#' map.
#'
#' @seealso [geotools::gtl_crs_proj()]
#'
#' @inheritParams geotools::gtl_crs_proj
#' @inheritDotParams ggplot2::coord_sf
#'
#' @return A ggplot2 coord object
#' @export
#' @examples
#' rnaturalearth::ne_countries() |>
#'   ggplot2::ggplot() +
#'   ggplot2::geom_sf() +
#'   ggeo_coord("eqearth")
#'
ggeo_coord <- function(code, ...) {
  crs <- geotools::gtl_crs_proj(code)

  ggplot2::coord_sf(crs = crs, datum = NA, ...)
}
