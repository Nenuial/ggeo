#' Return sf coord for given CRS code
#'
#' A function that uses [`geotools::gtl_crs_proj()`] to
#' get the CRS configuration and applies it to a ggplot2
#' map.
#'
#' @seealso [geotools::gtl_crs_proj()]
#'
#' @param proj A string for the projection code
#' @inheritDotParams ggplot2::coord_sf
#'
#' @return A ggplot2 coord object
#' @export
#' @examplesIf interactive()
#' ggeo_coord("eqearth")
#'
ggeo_coord <- function(proj, ...) {
  crs <- geotools::gtl_crs_proj(proj)

  ggplot2::coord_sf(crs = crs, datum = NA, ...)
}
