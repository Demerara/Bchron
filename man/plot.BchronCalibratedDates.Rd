\name{plot.BchronCalibratedDates}
\alias{plot.BchronCalibratedDates}
\title{
Plot calibrated dates from a BchronCalibrate run
}
\description{
Plots calibrated radiocarbon dates from a \code{\link{BchronCalibrate}} run. Has options to plot on a position (usually depth) scale if supplied with the original run
}
\usage{
\method{plot}{BchronCalibratedDates}(x,
withPositions = FALSE,
pause = FALSE,
dateHeight = 30,
borderCol = NULL,
fillCol = 'gray',
withHDR = TRUE,
hdrCol = 'darkgray',
\ldots)
}
\arguments{
  \item{x}{
Output from BchronCalibrate
}
  \item{withPositions}{
Whether to plot with positions (i.e. using the position values as the y axis). Default is FALSE in which case it will produce a sequence of plots, one for each calibrated age.
}
  \item{pause}{
Whether to pause between plots or go ahead and create them all.
}
  \item{dateHeight}{
The height of the dates in the same units as the positions (e.g. cm). Only relevant if \code{withPositions=TRUE}.
}
  \item{borderCol}{
The colour of the edges of the dates. If \code{NULL} there are no edges drawn
}
  \item{fillCol}{
The fill colour of the dates
}
  \item{withHDR}{
Whether to plot the 95% highest density region values
}
  \item{hdrCol}{
The colour of the HDR regions
}
  \item{\dots}{
Other arguments to plot, e.g. axis limits, titles, etc. See \code{\link{par}}.
}
}
\details{
These plots are intented to be pretty basic and used simply for quick information. Users are encouraged to learn the R plotting features to produce publication quality graphics
}
\references{
Forthcoming!
}
\author{
Andrew Parnell <andrew.parnell@ucd.ie>
}
\seealso{
\code{\link{BchronCalibrate}}, \code{\link{Bchronology}}, \code{\link{BchronRSL}}, \code{\link{BchronDensity}}, \code{\link{BchronDensityFast}}
}
\examples{
# Examples in BchronCalibrate
}
