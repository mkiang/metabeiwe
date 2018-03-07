#' Given a vector of Date objects, return a sequence from min to max
#'
#' @param x vector of Date objects
#' @param t_unit time steps to use (default: "days")
#'
#' @return a new vector with sequence of time steps from min(x) to max(x)
#' @export
#'
#' @examples
#' seq_date(c("2017-01-01", "2017-01-02", "2017-01-15"))
seq_date <- function(x, t_unit = "day") {
    ## Takes a vector of Date objects and returns a sequence from
    ## highest to lowest.
    x <- as.Date(x)
    seq(min(x), max(x), by = t_unit)
}
