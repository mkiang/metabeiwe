#' A convenience wrapper for list.dirs() with our more common defaults
#'
#' @param folder file path to the study folder
#' @param full_path return full paths (including study folder)? Default: FALSE
#' @param recursive check paths recursively? Default: FALSE
#'
#' @return a vector of user folders
.list_dirs <- function(folder, full_path = FALSE, recursive = FALSE) {
    list.dirs(folder, recursive = recursive, full.names = full_path)
}
