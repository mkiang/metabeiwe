#' Combine csv files into a single dataframe, removing sensor data
#'
#' This helper function will read in all csv files, remove sensor data, and
#' combine all files into a single dataframe.
#'
#' @param file_list a vector of file paths to be combined
#' @param na a vector of values to read in as NA
#' @return a tibble with timestamp and `UTC time` columns
#' @export
#' @importFrom dplyr select contains '%>%' bind_rows
#' @importFrom readr read_csv
#' @importFrom purrr map reduce
tidy_merge <- function(file_list, na = c("", "NA", "unknown")) {
    x <- file_list %>%
        purrr::map(~ readr::read_csv(.x, na = na) %>%
                dplyr::select(dplyr::contains("time"))) %>%
        purrr::reduce(dplyr::bind_rows)

    return(x)
}
