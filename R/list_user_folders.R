#' Helper that returns all the user folders for any given study folder
#'
#' @param study_folder file path to the study folder
#' @param full_path return full paths (including study folder)? Default: FALSE
#'
#' @return a vector of user folders
.list_user_folders <- function(study_folder, full_path = FALSE) {
    x <- list.dirs(study_folder,
                   recursive = FALSE,
                   full.names = full_path)
    return(x)
}
