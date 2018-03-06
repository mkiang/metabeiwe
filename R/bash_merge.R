#' Merge all csv files within a directory into a single file
#'
#' @param folder path to directory with csv files to be merged
#' @param awk use awk (default: TRUE) if there is a header row, else use cat
#' @param joined_file name of the merged file
#'
#' @return none
#' @export
bash_merge <- function(folder, awk = TRUE, joined_file = "0000-merged.csv") {
    # Uses bash `awk` or `cat` to merge files.
    # In general, faster than looping `fread()` for `read_csv`.
    # Note: `cat` doesn't work if there is a header row.
    original_wd <- getwd()
    setwd(folder)
    if (awk){
        system(paste0("awk 'FNR==1 && NR!=1{next;}{print}' *.csv > ",
                      joined_file))
    } else {
        system(paste0("cat *.csv > ", joined_file))
    }
    setwd(original_wd)
}
