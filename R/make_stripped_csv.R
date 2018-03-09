#' Given a CSV file returns an identical file with only timestamp data
#'
#' In some instances, it may not be possible or desirable to merge all files
#' first. This function will allow a researcher to strip away data on a file-
#' specific basis. It is *much* slower than the functions that merge all files
#' before reading them in or saving them (e.g., bash_merge() or tidy_merge()).
#'
#' @param csv_path path to the csv file as a string
#' @param suffix string to append to new csv file
#'
#' @return none
#'
#' @importFrom readr read_csv cols
#' @importFrom utils write.csv
make_stripped_csv <- function(csv_path, suffix = "_stripped") {
    readr::read_csv(csv_path, col_types = readr::cols()) %>%
        keep_time_only() %>%
        write.csv(file = gsub("\\.csv", paste0(suffix, ".csv"), x = csv_path),
                  row.names = FALSE)
}
