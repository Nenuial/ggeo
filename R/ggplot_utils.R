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

  if (stringr::str_detect(filename, "^/")) {
    filepath <- filename
  } else {
    filepath <- glue::glue("out/{filename}.{extension}")
  }

  ggplot2::ggsave(
    filename = filepath,
    width = width, height = height, dpi = dpi, units = units,
    bg = "transparent", device = device,
    ...
  )
}

#' Save function
#'
#' @param plot The ggplot2 object to save (should be piped in ;)
#' @param filename Path for filename (with extension!)
#' @param width The plot width.
#'  Defaults to keynote width (`geotools::gtl_options("plot_standard_width")`).
#'  For full slide width use `geotools::gtl_options("plot_full_width")`.
#' @param height The plot height.
#'  Defaults to keynote height (`geotools::gtl_options("plot_standard_height")`).
#'  For full slide height use `geotools::gtl_options("plot_full_height")`.
#' @param dpi The DPI. Default is 72.
#' @param units Units. Default is cm.
#' @inheritDotParams ggplot2::ggsave device scale limitsize bg create.dir
#'
#' @export
#' @examplesIf interactive()
#' cars |>
#'   ggplot2::ggplot(ggplot2::aes(x = speed, y = dist)) +
#'   ggplot2::geom_point() -> simple_plot
#'
#' ggeo_save(simple_plot, "simple_plot.png")
#'
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


#' Copitalize plot title
#'
#' @param plot A ggplot2 object
#'
#' @return A ggplot2 object
#' @export
#' @examplesIf interactive()
#' ggplot(aes(x = speed, y = dist), data = cars) +
#'   geom_point() +
#'   labs(title = "Fast cars !") +
#'   ggeo_remove_title()
#'
ggeo_capitalize_title <- function(plot) {
  plot$labels$title %>%
    stringr::str_to_upper() %>%
    stringr::str_replace_all("COLOR:#", "color:#") -> plot$labels$title

  plot$patches$annotation$title %>%
    stringr::str_to_upper() %>%
    stringr::str_replace("COLOR:#", "color:#") -> plot$patches$annotation$title

  plot
}

#' Remove plot title
#'
#' @param plot A ggplot2 object
#'
#' @return A ggplot2 object
#' @export
#' @examplesIf interactive()
#' ggplot(aes(x = speed, y = dist), data = cars) +
#'   geom_point() +
#'   labs(title = "Fast cars !") +
#'   ggeo_remove_title()
#'
ggeo_remove_title <- function(plot) {
  plot$labels$title <- NULL
  plot$patches$annotation$title <- NULL
  plot
}
