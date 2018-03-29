#' Summarize the groupings that you've already calculated
#'
#' @param df a dataframe with grouping columns (see `create_grouping_cols()``)
#'
#' @return a summarized dataframe
#' @export
#' @importFrom dplyr group_by summarize n ungroup
summarize_groupings <- function(df) {
    df <- df %>%
        dplyr::group_by(year, month, day, hour, grouping, add = TRUE) %>%
        dplyr::summarize(t_min   = min(utc_orig),
                         t_max   = max(utc_orig),
                         t_delta = difftime(t_max, t_min, units = "secs"),
                         dur_sec = round(t_delta, 0),
                         n_obs   = n()) %>%
        dplyr::ungroup()

    return(df)
}
