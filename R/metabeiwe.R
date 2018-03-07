#' metabeiwe an R package for analyzing Beiwe metadata
#'
#' @docType package
#' @name metabeiwe
#' @importFrom utils globalVariables
NULL

## These are just here to declare globals so I don't get notes on R CMD check
if(getRversion() >= "2.15.1") {
    utils::globalVariables(c("%>%"))
}

## For misc_dplyr_helpers
if(getRversion() >= "2.15.1") {
    utils::globalVariables(c("time", "utc_orig", "UTC time"))
}
