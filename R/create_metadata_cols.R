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
