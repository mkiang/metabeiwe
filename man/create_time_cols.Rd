% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_time_cols.R
\name{create_time_cols}
\alias{create_time_cols}
\title{Create POSIX-compliant columns for dt components (e.g., year, hour, month)}
\usage{
create_time_cols(df)
}
\arguments{
\item{df}{a dataframe with a timestamp column (`utc_orig` or `UTC time`)}
}
\value{
a dataframe with five additional time columns
}
\description{
Given a dataframe with either `utc_orig` or `UTC time` column, adds five
more columns: year, month, day, hour minute.
}
