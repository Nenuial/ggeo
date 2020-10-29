#' ggeo theme
#'
#'
#' @inheritParams ggplot2::theme_minimal
#' @param horizontal \code{logical}. Horizontal axis lines?
#' @param theme Name of the theme to use
#' @param mode One of light or dark
#' @param base Base ggplot2 theme to use
#' @return An object of class \code{\link[ggplot2]{theme}()}.
#' @export
#' @family themes nord_dark
ggeotheme <- function(theme = c("ghibli_mononoke", "islamic_samarquand",
                                "pomological_green", "pomological_red",
                                "nord_blue", "swiss_red",
                                "oc_exams"),
                      main = "main",
                      plot = "plot",
                      ...,
                      mode = c("light", "dark"),
                      base = ggplot2::theme_bw()) {

  theme <- match.arg(theme)
  mode <- match.arg(mode)

  theme <- (base +
              ggplot2::theme(rect =
                               ggplot2::element_rect(fill = "transparent", color = NA),
                             line =
                               ggplot2::element_line(color = ggeodata$themes[[theme]][[mode]]$line),
                             text =
                               ggplot2::element_text(family = ggeodata$themes[[main]]$text$family,
                                                     size = ggeodata$themes[[main]]$text$size,
                                                     face = ggeodata$themes[[main]]$text$face,
                                                     color = ggeodata$themes[[theme]][[mode]]$text),
                             title =
                               ggplot2::element_text(family = ggeodata$themes[[main]]$title$family,
                                                     size = ggeodata$themes[[main]]$title$size,
                                                     face = ggeodata$themes[[main]]$title$face,
                                                     color = ggeodata$themes[[theme]][[mode]]$title),

                             axis.text =
                               ggplot2::element_text(family = ggeodata$themes[[main]]$text$family,
                                                     size = ggeodata$themes[[main]]$text$size,
                                                     face = ggeodata$themes[[main]]$text$face,
                                                     color = ggeodata$themes[[theme]][[mode]]$text),

                             legend.key =
                               ggplot2::element_blank(),
                             legend.text =
                               ggplot2::element_text(family = ggeodata$themes[[main]]$text$family,
                                                     size = ggeodata$themes[[main]]$text$size,
                                                     face = ggeodata$themes[[main]]$text$face,
                                                     color = ggeodata$themes[[theme]][[mode]]$text),

                             panel.background =
                               ggplot2::element_rect(fill = "transparent", color = NA),
                             panel.border =
                               ggplot2::element_rect(color = ggeodata$themes[[theme]][[mode]]$line),
                             panel.grid =
                               ggplot2::element_line(color = ggeodata$themes[[theme]][[mode]]$grid),

                             plot.background =
                               ggplot2::element_rect(fill = "transparent", color = NA),
                             plot.title =
                               ggplot2::element_text(family = ggeodata$themes[[plot]]$title$family,
                                                     size = ggeodata$themes[[plot]]$title$size,
                                                     face = ggeodata$themes[[plot]]$title$face,
                                                     color = ggeodata$themes[[theme]][[mode]]$title),
                             plot.subtitle =
                               ggplot2::element_text(family = ggeodata$themes[[plot]]$subtitle$family,
                                                     size = ggeodata$themes[[plot]]$subtitle$size,
                                                     face = ggeodata$themes[[plot]]$subtitle$face,
                                                     color = ggeodata$themes[[theme]][[mode]]$title),
                             plot.caption =
                               ggplot2::element_text(family = ggeodata$themes[[plot]]$caption$family,
                                                     size = ggeodata$themes[[plot]]$caption$size,
                                                     face = ggeodata$themes[[plot]]$caption$face,
                                                     color = ggeodata$themes[[theme]][[mode]]$text)
              ) +
              ggplot2::theme(...)
  )

  return(theme)
}
