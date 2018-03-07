#' Given a file path (in the original format), returns metadata about path
#'
#' Beiwe data is structured as:
#'      /study_folder/user_folder/sensor_folder/DATE_TIME.csv
#'
#' This is just a convenience function that extract important metadata from
#' the file path. Given any file path (as a string), it will return a list
#' with elements $data_type, $user_id, $study_name, $file_path, and optionally
#' $datetime.
#'
#' @param csv_path path to the csv file as a string
#' @param with_dttm when TRUE, also returns the timestamp of the file
#'
#' @return a list
.parse_file_name <- function(csv_path, with_dttm = FALSE) {
    ## Takes a file name and returns the study folder, subject_id,
    ## data stream, and a POSIX timestamp of the file.

    split_text <- strsplit(csv_path, '/')[[1]]
    fields     <- length(split_text)

    x <- list()
    x[["data_type"]]  <- split_text[fields - 1]
    x[["user_id"]]    <- split_text[fields - 2]
    x[["study_name"]] <- split_text[fields - 3]
    x[["file_path"]]  <- csv_path

    if (with_dttm) {
        x[["datetime"]]   <- lubridate::ymd_hms(split_text[fields])
    }

    return(x)
}
