#' Create POSIX-compliant columns for dt components (e.g., year, hour, month)
#'
#' Given a dataframe with either `utc_orig` or `UTC time` column, adds five
#' more columns: year, month, day, hour minute.
#'
#' @param df a dataframe with a timestamp column (`utc_orig` or `UTC time`)
#'
#' @return a dataframe with five additional time columns
#' @importFrom dplyr mutate "%>%" rename
#' @importFrom tibble has_name
#' @importFrom lubridate year month day hour minute second
create_time_cols <- function(df) {
    ## Add in time components
    df <- df %>%
        rename_time() %>%
        dplyr::mutate(year   = lubridate::year(utc_orig),
                      month  = lubridate::month(utc_orig),
                      day    = lubridate::day(utc_orig),
                      hour   = lubridate::hour(utc_orig),
                      minute = lubridate::minute(utc_orig),
                      second = lubridate::second(utc_orig))

    return(df)
}
