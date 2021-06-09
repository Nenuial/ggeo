#' Return sf coord for given crs code
#'
#' @param proj A string for the projection code
#' @param ... Arguments passed to ggplot2::coord_sf
#'
#' @return A ggplot2 coord object
#' @export
ggeo_coord <- function(proj, ...) {
  crs <- geotools::gtl_crs_proj(proj)

  ggplot2::coord_sf(crs = crs, datum = NA, ...)
}
