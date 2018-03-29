#' Create a grouping column based on specified time buffer
#'
#' @param df a dataframe with `utc_orig` or `UTC time` column
#' @param buffer a buffer (in seconds) between "groupings" of data collection
#'
#' @return a new dataframe with columns t_delta, time_gap, and grouping
#' @export
#' @importFrom dplyr group_by arrange mutate lag
#' @importFrom tibble has_name
create_grouping_cols <- function(df, buffer) {
    ## Make sure `utc_orig` exists
    df <- df %>% rename_time()

    ## Make sure time columns exist
    if (!tibble::has_name(df, "hour")) {
        df <- df %>%
            create_time_cols()
    }

    ## If it all exists, add in time delta
    df <- df %>%
        dplyr::group_by(year, month, day, hour, add = TRUE) %>%
        dplyr::arrange(utc_orig) %>%
        dplyr::mutate(t_delta  = utc_orig - dplyr::lag(utc_orig),
                      time_gap = ifelse(is.na(t_delta), 1, t_delta > buffer))

    ## Add grouping column
    df <- df %>%
        dplyr::mutate(grouping = cumsum(time_gap))

    return(df)
}
