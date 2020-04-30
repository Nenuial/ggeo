#' Save plots to out folder
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
ggeosave <- function(filename, ...,
                     format = c(NA, "keynote"),
                     width = 63.5,
                     height = 28.57,
                     dpi = 72,
                     units = "cm",
                     extension = "pdf",
                     device = grDevices::cairo_pdf) {
  format <- match.arg(format)

  switch(format,
         keynote = {
           width <- 63.5
           height <- 28.57
           dpi <- 72
         }
  )

  ggplot2::ggsave(filename = glue::glue("out/{filename}.{extension}"),
                  width = width, height = height, dpi = dpi, units = units,
                  bg = "transparent", device = device,
                  ...)
}
