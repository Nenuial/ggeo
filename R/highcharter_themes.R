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
#'
hc_purple_theme <- function(hc) {
  base_colors <- list(
    main_color  = "#e0d9fb",
    axis_color  = "#ced2fa",
    title_color = "#a84890"
  )

  base_text_style <- list(
    fontFamily = "Fira Sans",
    fontWeight = "100",
    fontSize = "24px",
    color = base_colors$main_color
  )

  axis_title_style <- list(
    fontFamily = "Fira Sans",
    fontWeight = "300",
    fontSize = "24px",
    color = base_colors$axis_color
  )

  theme <- highcharter::hc_theme(
    colors = wesanderson::wes_palette("GrandBudapest2"),
    chart = list(
      backgroundColor = "transparent"
    ),
    title = list(
      style = list(
        color = base_colors$title_color,
        fontFamily = "Fira Sans",
        fontSize = "52px",
        fontWeight = "400"
      )
    ),
    subtitle = list(
      style = list(
        color = base_colors$title_color,
        fontFamily = "Fira Sans",
        fontSize = "38px",
        fontWeight = "300"
      )
    ),
    legend = list(
      itemStyle = base_text_style,
      itemHoverStyle = list(
        color = base_colors$main_color
      )
    ),
    tooltip = list(
      headerFormat = "<span style='font-size: 24px'>{point.key}</span><br/>",
      style = list(
        fontFamily = "Fira Sans",
        fontWeight = "200",
        fontSize = "28px"
      )
    ),
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

  hc |>
    highcharter::hc_add_theme(theme)
}

#' @rdname hc_purple_theme
#' @export
hc_samarqand_theme <- function(hc) {
  base_colors <- list(
    main_color  = "#cec0a5",
    axis_color  = "#c0d9eb",
    title_color = "#6098c0"
  )

  base_text_style <- list(
    fontFamily = "Fira Sans",
    fontWeight = "100",
    fontSize = "24px",
    color = base_colors$main_color
  )

  axis_title_style <- list(
    fontFamily = "Fira Sans",
    fontWeight = "300",
    fontSize = "24px",
    color = base_colors$axis_color
  )

  theme <- highcharter::hc_theme(
    colors = wesanderson::wes_palette("GrandBudapest2"),
    chart = list(
      backgroundColor = "transparent"
    ),
    title = list(
      style = list(
        color = base_colors$title_color,
        fontFamily = "Fira Sans",
        fontSize = "52px",
        fontWeight = "400"
      )
    ),
    subtitle = list(
      style = list(
        color = base_colors$title_color,
        fontFamily = "Fira Sans",
        fontSize = "38px",
        fontWeight = "300"
      )
    ),
    legend = list(
      itemStyle = base_text_style,
      itemHoverStyle = list(
        color = base_colors$main_color
      )
    ),
    tooltip = list(
      headerFormat = "<span style='font-size: 24px'>{point.key}</span><br/>",
      style = list(
        fontFamily = "Fira Sans",
        fontWeight = "200",
        fontSize = "28px"
      )
    ),
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

  hc |>
    highcharter::hc_add_theme(theme)
}

#' @rdname hc_purple_theme
#' @export
hc_pomogreen_theme <- function(hc) {
  base_colors <- list(
    main_color  = "#2b323f",
    axis_color  = "#3a3e3f",
    title_color = "#919c4c"
  )

  base_text_style <- list(
    fontFamily = "Fira Sans",
    fontWeight = "100",
    fontSize = "24px",
    color = base_colors$main_color
  )

  axis_title_style <- list(
    fontFamily = "Fira Sans",
    fontWeight = "300",
    fontSize = "24px",
    color = base_colors$axis_color
  )

  theme <- highcharter::hc_theme(
    colors = wesanderson::wes_palette("GrandBudapest2"),
    chart = list(
      backgroundColor = "transparent"
    ),
    title = list(
      style = list(
        color = base_colors$title_color,
        fontFamily = "Fira Sans",
        fontSize = "52px",
        fontWeight = "400"
      )
    ),
    subtitle = list(
      style = list(
        color = base_colors$title_color,
        fontFamily = "Fira Sans",
        fontSize = "38px",
        fontWeight = "300"
      )
    ),
    legend = list(
      itemStyle = base_text_style,
      itemHoverStyle = list(
        color = base_colors$main_color
      )
    ),
    tooltip = list(
      headerFormat = "<span style='font-size: 24px'>{point.key}</span><br/>",
      style = list(
        fontFamily = "Fira Sans",
        fontWeight = "200",
        fontSize = "28px"
      )
    ),
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

  hc |>
    highcharter::hc_add_theme(theme)
}

#' @rdname hc_purple_theme
#' @export
hc_jerusalem_theme <- function(hc) {
  base_colors <- list(
    main_color  = "#FAE3A0",
    axis_color  = "#c0d9eb",
    title_color = "#699CB6"
  )

  base_text_style <- list(
    fontFamily = "Fira Sans",
    fontWeight = "100",
    fontSize = "24px",
    color = base_colors$main_color
  )

  axis_title_style <- list(
    fontFamily = "Fira Sans",
    fontWeight = "300",
    fontSize = "24px",
    color = base_colors$axis_color
  )

  theme <- highcharter::hc_theme(
    colors = wesanderson::wes_palette("GrandBudapest2"),
    chart = list(
      backgroundColor = "transparent"
    ),
    title = list(
      style = list(
        color = base_colors$title_color,
        fontFamily = "Fira Sans",
        fontSize = "52px",
        fontWeight = "400"
      )
    ),
    subtitle = list(
      style = list(
        color = base_colors$title_color,
        fontFamily = "Fira Sans",
        fontSize = "38px",
        fontWeight = "300"
      )
    ),
    legend = list(
      itemStyle = base_text_style,
      itemHoverStyle = list(
        color = base_colors$main_color
      )
    ),
    tooltip = list(
      headerFormat = "<span style='font-size: 24px'>{point.key}</span><br/>",
      style = list(
        fontFamily = "Fira Sans",
        fontWeight = "200",
        fontSize = "28px"
      )
    ),
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

  hc |>
    highcharter::hc_add_theme(theme)
}

#' @rdname hc_purple_theme
#' @export
hc_web_theme <- function(hc) {
  base_colors <- list(
    main_color  = "#4c566a",
    axis_color  = "#73819B",
    title_color = "#73819B"
  )

  base_text_style <- list(
    fontFamily = "Fira Sans",
    color = base_colors$main_color
  )

  axis_title_style <- list(
    fontFamily = "Fira Sans",
    color = base_colors$axis_color
  )

  theme <- highcharter::hc_theme(
    colors = wesanderson::wes_palette("GrandBudapest2"),
    chart = list(
      backgroundColor = "transparent"
    ),
    title = list(
      style = list(
        color = base_colors$title_color,
        fontFamily = "Fira Sans"
      )
    ),
    subtitle = list(
      style = list(
        color = base_colors$title_color,
        fontFamily = "Fira Sans"
      )
    ),
    legend = list(
      itemStyle = base_text_style,
      itemHoverStyle = list(
        color = base_colors$main_color
      )
    ),
    tooltip = list(
      style = list(
        fontFamily = "Fira Sans"
      )
    ),
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

  hc |>
    highcharter::hc_add_theme(theme)
}
