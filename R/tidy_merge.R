#' Combine csv files into a single dataframe, removing sensor data
#'
#' This helper function will read in all csv files, remove sensor data, and
#' combine all files into a single dataframe.
#'
#' @param file_list a vector of file paths to be combined
#' @param na a vector of values to read in as NA
#' @param metadata_only if TRUE (default), subset to only time columns
#' @return a tibble with timestamp and `UTC time` columns
#'
#' @export
#'
#' @importFrom dplyr select contains '%>%' bind_rows
#' @importFrom readr read_csv cols
#' @importFrom purrr map reduce
tidy_merge <- function(file_list, na = c("", "NA", "unknown"),
                       metadata_only = TRUE) {

    if (metadata_only) {
        p_formula <- ~ readr::read_csv(.x, na = na,
                                       col_types = readr::cols()) %>%
            dplyr::select(dplyr::contains("time"))
    } else {
        p_formula <- ~ readr::read_csv(.x, na = na,
                                       col_types = readr::cols())
    }

    df <- file_list %>%
        purrr::map(p_formula) %>%
        purrr::reduce(dplyr::bind_rows)

    return(df)
}
