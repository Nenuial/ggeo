#' Highcharts themes
#'
#' These functions can be used to modify the theme of
#' a highcharts plot.
#'
#' @param hc A highcharts object
#'
#' @return A highcharts object
#' @export
#' @examples
#' highcharter::hchart(
#'   cars, "point",
#'   highcharter::hcaes(x = speed, y = dist)
#' ) |>
#'   hc_purple_theme()
#'
#' highcharter::hchart(
#'   cars, "point",
#'   highcharter::hcaes(x = speed, y = dist)
#' ) |>
#'   hc_samarqand_theme()
#'
#' highcharter::hchart(
#'   cars, "point",
#'   highcharter::hcaes(x = speed, y = dist)
#' ) |>
#'   hc_web_theme()
hc_purple_theme <- function(hc) {
  base_colors <- list(
    main_color  = "#e0d9fb",
    axis_color  = "#ced2fa",
    title_color = "#a84890"
  )

  theme <- ggeo_create_highchart_theme(
    base_colors,
    wesanderson::wes_palette("GrandBudapest2")
  )

  hc |> highcharter::hc_add_theme(theme)
}

#' Function factory to create a highcharter theme
#'
#' @param base_colors A list with the main, axis and title colors
#' @param palette A color palette
#' @param web_theme A boolean to indicate if the theme is for the web
#' @param title_font_size The title font size
#' @param title_font_weight The title font weight
#' @param subtitle_font_size The subtitle font size
#' @param subtitle_font_weight The subtitle font weight
#'
#' @returns A highcharter theme object
#' @keywords internal
ggeo_create_highchart_theme <- function(base_colors, palette, web_theme = FALSE,
                                        title_font_size = if (!web_theme) "52px" else NULL,
                                        title_font_weight = if (!web_theme) "400" else NULL,
                                        subtitle_font_size = if (!web_theme) "38px" else NULL,
                                        subtitle_font_weight = if (!web_theme) "300" else NULL) {
  base_text_style <- list(
    fontFamily = "Fira Sans",
    color = base_colors$main_color
  )
  if (!web_theme) {
    base_text_style$fontWeight <- "100"
    base_text_style$fontSize <- "24px"
  }

  axis_title_style <- list(
    fontFamily = "Fira Sans",
    color = base_colors$axis_color
  )
  if (!web_theme) {
    axis_title_style$fontWeight <- "300"
    axis_title_style$fontSize <- "24px"
  }

  title_style <- list(
    color = base_colors$title_color,
    fontFamily = "Fira Sans"
  )
  if (!is.null(title_font_size)) title_style$fontSize <- title_font_size
  if (!is.null(title_font_weight)) title_style$fontWeight <- title_font_weight

  subtitle_style <- list(
    color = base_colors$title_color,
    fontFamily = "Fira Sans"
  )
  if (!is.null(subtitle_font_size)) subtitle_style$fontSize <- subtitle_font_size
  if (!is.null(subtitle_font_weight)) subtitle_style$fontWeight <- subtitle_font_weight

  tooltip_style <- list(fontFamily = "Fira Sans")
  if (!web_theme) {
    tooltip_style$fontWeight <- "200"
    tooltip_style$fontSize <- "28px"
    tooltip_header <- "<span style='font-size: 24px'>{point.key}</span><br/>"
  } else {
    tooltip_header <- NULL
  }

  highcharter::hc_theme(
    colors = palette,
    chart = list(
      backgroundColor = "transparent"
    ),
    title = list(
      style = title_style
    ),
    subtitle = list(
      style = subtitle_style
    ),
    legend = list(
      itemStyle = base_text_style,
      itemHoverStyle = list(
        color = base_colors$main_color
      )
    ),
    tooltip = if (!is.null(tooltip_header)) {
      list(headerFormat = tooltip_header, style = tooltip_style)
    } else {
      list(style = tooltip_style)
    },
    caption = list(
      style = base_text_style
    ),
    xAxis = list(
      labels = list(
        style = base_text_style
      ),
      title = list(
        style = axis_title_style
      )
    ),
    yAxis = list(
      labels = list(
        style = base_text_style
      ),
      title = list(
        style = axis_title_style
      )
    )
  )
}

#' @rdname hc_purple_theme
#' @export
hc_samarqand_theme <- function(hc) {
  base_colors <- list(
    main_color  = "#cec0a5",
    axis_color  = "#c0d9eb",
    title_color = "#6098c0"
  )

  theme <- ggeo_create_highchart_theme(
    base_colors,
    wesanderson::wes_palette("GrandBudapest2")
  )

  hc |> highcharter::hc_add_theme(theme)
}

#' @rdname hc_purple_theme
#' @export
hc_pomogreen_theme <- function(hc) {
  base_colors <- list(
    main_color  = "#2b323f",
    axis_color  = "#3a3e3f",
    title_color = "#919c4c"
  )

  theme <- ggeo_create_highchart_theme(
    base_colors,
    wesanderson::wes_palette("GrandBudapest2")
  )

  hc |> highcharter::hc_add_theme(theme)
}

#' @rdname hc_purple_theme
#' @export
hc_jerusalem_theme <- function(hc) {
  base_colors <- list(
    main_color  = "#FAE3A0",
    axis_color  = "#c0d9eb",
    title_color = "#699CB6"
  )

  theme <- ggeo_create_highchart_theme(
    base_colors, wesanderson::wes_palette("GrandBudapest2")
  )

  hc |> highcharter::hc_add_theme(theme)
}

#' @rdname hc_purple_theme
#' @export
hc_guonian_theme <- function(hc) {
  base_colors <- list(
    main_color  = "#cc9456",
    axis_color  = "#ffe29e",
    title_color = "#be3b49"
  )

  theme <- ggeo_create_highchart_theme(
    base_colors,
    PNWColors::pnw_palette("Bay", 10)
  )

  hc |> highcharter::hc_add_theme(theme)
}

#' @rdname hc_purple_theme
#' @export
hc_web_theme <- function(hc) {
  base_colors <- list(
    main_color  = "#4c566a",
    axis_color  = "#73819B",
    title_color = "#73819B"
  )

  theme <- ggeo_create_highchart_theme(
    base_colors,
    wesanderson::wes_palette("GrandBudapest2"),
    web_theme = TRUE
  )

  hc |> highcharter::hc_add_theme(theme)
}

#' @rdname hc_purple_theme
#' @export
hc_dark_web_theme <- function(hc) {
  base_colors <- list(
    main_color  = "#acb5c9",
    axis_color  = "#b7caed",
    title_color = "#ffffff"
  )

  theme <- ggeo_create_highchart_theme(
    base_colors,
    wesanderson::wes_palette("GrandBudapest2"),
    web_theme = TRUE
  )

  hc |> highcharter::hc_add_theme(theme)
}
