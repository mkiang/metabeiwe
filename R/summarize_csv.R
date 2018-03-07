#' Return metadata about a csv file
#'
#' Given a file path, this function will return a dataframe with file metadata:
#'  study_name, user_id, data_type, timestamp, n_rows, and file_path
#'
#' @param csv_path path to the csv file as a string
#'
#' @return a tibble with metadata about that file
#' @export
#' @importFrom dplyr select one_of
#' @importFrom tibble as_data_frame
summarize_csv <- function(csv_path) {

    parsed <- .parse_file_name(csv_path)
    parsed[["n_rows"]] <- .count_data_lines(csv_path)

    df <- tibble::as_data_frame(parsed) %>%
        dplyr::select(dplyr::one_of("study_name", "user_id", "data_type",
                                    "timestamp", "n_rows", "file_path"))

    return(df)
}
