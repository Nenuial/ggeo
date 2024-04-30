#' Save plots to out folder
#'
#' `r lifecycle::badge("deprecated")`
#'
#' @inheritParams ggplot2::ggsave
#' @param filename Name of the output file
#' @param format Optional: one of "keynote"
#' @param width Optional: width of output plot
#' @param height Optional: height of output plot
#' @param units Optional: units of output plot dimensions
#' @param extension Optional: output file extension
#' @param device Optional: output device
#'
#' @export
#' @keywords internal
ggeosave <- function(filename, ...,
                     format = c(NA, "keynote"),
                     width = 63.5,
                     height = 28.57,
                     dpi = 72,
                     units = "cm",
                     extension = "pdf",
                     device = grDevices::cairo_pdf) {

  lifecycle::deprecate_warn("1.0.0", "ggeosave()", "ggeo_save()")

  format <- match.arg(format)

  switch(format,
         keynote = {
           width <- 63.5
           height <- 28.57
           dpi <- 72
         }
  )

  if(stringr::str_detect(filename, "^/")) {
    filepath <- filename
  } else {
    filepath <- glue::glue("out/{filename}.{extension}")
  }

  ggplot2::ggsave(filename = filepath,
                  width = width, height = height, dpi = dpi, units = units,
                  bg = "transparent", device = device,
                  ...)
}

#' Save function
#'
#' @param plot The ggplot2 object to save (should by piped in ;)
#' @param filename Path for filename (with extension!)
#' @param width Width. Defaults to keynote width (full = geotools::gtl_options("plot_full_width"))
#' @param height Height. Defaults to keynote height (full = geotools::gtl_options("plot_full_width"))
#' @param dpi DPI. Defaults to 72.
#' @param units Units. Defaults to cm.
#' @param ... Arguments to pass to ggplot2::ggsave
#'
#' @export
ggeo_save <- function(plot,
                      filename,
                      width = geotools::gtl_options("plot_standard_width"),
                      height = geotools::gtl_options("plot_standard_height"),
                      dpi = 72,
                      units = "cm",
                      ...) {

  ggplot2::ggsave(
    filename = filename,
    width = width,
    height = height,
    dpi = dpi,
    units = units,
    plot = plot,
    ...
  )
}
