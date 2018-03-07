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
    df %>%
        dplyr::rename(utc_orig = `UTC time`)
}

#' Take in a dataframe with utc_orig and return date components as columns
#'
#' @param df dataframe with `utc_orig` column
#'
#' @return dataframe with year, month, day, hour, minute columns
#' @export
#' @importFrom dplyr mutate '%>%'
#' @importFrom lubridate year month day hour minute
create_time_cols <- function(df) {
    df %>%
        dplyr::mutate(year   = lubridate::year(utc_orig),
                      month  = lubridate::month(utc_orig),
                      day    = lubridate::day(utc_orig),
                      hour   = lubridate::hour(utc_orig),
                      minute = lubridate::minute(utc_orig))
}

#' Takes a dataframe and file path and adds metadata to the dataframe
#'
#' @param df dataframe to add metadata to (study_name, user_id, data_type)
#' @param file_path path to the originating CSV file
#'
#' @return a dataframe with metadata columns
#' @export
create_metadata_cols <- function(df, file_path) {
    metadata <- .parse_file_name(file_path)

    df %>%
        dplyr::mutate(study_name = metadata$study_name,
                      data_type  = metadata$data_type,
                      user_id    = metadata$user_id)
}

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
