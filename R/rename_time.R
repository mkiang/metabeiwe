#' Just rename the original time column (UTC time) to utc_orig
#'
#' Wrapper function purely for readability of code in a pipeline-friendly
#' way.
#'
#' @param df dataframe with `UTC time` column
#'
#' @return dataframe with utc_orig column
#' @export
#' @importFrom dplyr rename '%>%'
rename_time <- function(df) {
    if (tibble::has_name(df, "UTC time")) {
        df <- df %>%
            dplyr::rename(utc_orig = `UTC time`)
    }
    return(df)

}
