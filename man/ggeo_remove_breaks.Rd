% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggplot_scales.R
\name{ggeo_remove_breaks}
\alias{ggeo_remove_breaks}
\title{Remove specific breaks}
\usage{
ggeo_remove_breaks(original_func, remove_list = list())
}
\arguments{
\item{original_func}{The function to create the breaks.
Use the break functions from the {\href{https://scales.r-lib.org}{scales}}}

\item{remove_list}{The values to remove from the scale.}
}
\value{
A list
}
\description{
This function can be used to modify the breaks of a ggplot2
scale. It is specifically designed to remove the some breaks
in the scale.
}
\examples{
ggplot2::ggplot(ggplot2::aes(x = speed, y = dist), data = cars) +
  ggplot2::geom_point() +
  ggplot2::labs(title = "Fast cars!") +
  ggplot2::scale_y_continuous(
    breaks = ggeo::ggeo_remove_breaks(scales::breaks_pretty(6), list(0)),
  )

}
