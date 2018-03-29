#' Simply subsets any given dataframe to only columns with "time" in the name
#'
#' @param df a dataframe
#'
#' @return a dataframe with only columns containing "time" in the name
#' @export
keep_time_only <- function(df) {
    df %>%
        dplyr::select(dplyr::contains("time"))
}
