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
