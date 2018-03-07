#' Convenience function that takes path and returns the number of observations
#'
#' Because Beiwe chunks data into 1 hour files, we cannot immediately tell
#' which files have one observation and which files have thousands. This
#' is just a wrapper function that uses countLines() to return the number
#' of data lines (i.e., excluding the header file). In simple benchmarks,
#' this is the fastest funciton.
#'
#' @param csv_path path to the csv file as a string
#'
#' @return number of data lines (excluding header) as integer
.count_data_lines <- function(csv_path) {
    n_rows <- R.utils::countLines(csv_path) - 1

    return(as.integer(n_rows))
}
