#' ggeo plot themes
#'
#' A function that returns the ggplot theme elements for the chosen
#' theme.
#'
#' @inheritParams ggplot2::theme_minimal
#' @param theme Name of the theme to use. One of "ghibli_mononoke", "islamic_samarquand",
#'   "pomological_green", "pomological_red", "nord_blue", "swiss_red",
#'   "purple", "doc" or "oc_exams"
#' @param main One of `main`, `main_latex` or `main_exa`
#' @param plot One of `plot`, `plot_latex` or `plot_exa`
#' @param mode One of `light` or `dark`
#' @param base A ggplot2 theme
#' @inheritDotParams ggplot2::theme
#' @return An object of class [ggplot2::theme()].
#' @export
#' @examplesIf interactive()
#' ggeotheme("ghibli_mononoke")
#'
ggeotheme <- function(theme = c("ghibli_mononoke", "islamic_samarquand",
                                "pomological_green", "pomological_red",
                                "nord_blue", "swiss_red", "purple",
                                "doc", "oc_exams"),
                      main = "main",
                      plot = "plot",
                      ...,
                      mode = c("light", "dark"),
                      base = ggplot2::theme_bw()) {

  theme <- match.arg(theme)
  mode <- match.arg(mode)
  main <- match.arg(main, choices = c("main", "main_exa", "main_latex", "main_svg"))
  plot <- match.arg(plot, choices = c("plot", "plot_exa", "plot_latex", "plot_svg"))

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
                               ggplot2::element_blank(),
                               #ggplot2::element_line(color = ggeodata$themes[[theme]][[mode]]$grid),

                             plot.background =
                               ggplot2::element_rect(fill = "transparent", color = NA),
                             plot.caption =
                               ggplot2::element_text(family = ggeodata$themes[[plot]]$caption$family,
                                                     size = ggeodata$themes[[plot]]$caption$size,
                                                     face = ggeodata$themes[[plot]]$caption$face,
                                                     color = ggeodata$themes[[theme]][[mode]]$text),
                             plot.margin =
                               ggeodata$themes[[plot]]$margin,

                             plot.title =
                               ggplot2::element_text(family = ggeodata$themes[[plot]]$title$family,
                                                     size = ggeodata$themes[[plot]]$title$size,
                                                     face = ggeodata$themes[[plot]]$title$face,
                                                     color = ggeodata$themes[[theme]][[mode]]$title),
                             plot.title.position =
                               "plot",
                             plot.subtitle =
                               ggplot2::element_text(family = ggeodata$themes[[plot]]$subtitle$family,
                                                     size = ggeodata$themes[[plot]]$subtitle$size,
                                                     face = ggeodata$themes[[plot]]$subtitle$face,
                                                     color = ggeodata$themes[[theme]][[mode]]$title,
                                                     margin = ggeodata$themes[[plot]]$subtitle_margin)
              ) +
              ggplot2::theme(...)
  )

  return(theme)
}
