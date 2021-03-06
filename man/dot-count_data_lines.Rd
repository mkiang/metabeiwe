% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/count_data_lines.R
\name{.count_data_lines}
\alias{.count_data_lines}
\title{Convenience function that takes path and returns the number of observations}
\usage{
.count_data_lines(csv_path)
}
\arguments{
\item{csv_path}{path to the csv file as a string}
}
\value{
number of data lines (excluding header) as integer
}
\description{
Because Beiwe chunks data into 1 hour files, we cannot immediately tell
which files have one observation and which files have thousands. This
is just a wrapper function that uses countLines() to return the number
of data lines (i.e., excluding the header file). In simple benchmarks,
this is the fastest funciton.
}
