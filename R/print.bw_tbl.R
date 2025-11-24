#' Custom print method for bw_tbl objects
#'
#' This method provides a cleaner print output for the birth weight dataset.
#'
#' @param x An object of class \code{bw_tbl}.
#' @param ... Additional arguments (ignored)
#'
#' @export
print.bw_tbl <- function(x, ...) {
  cat("Friedman birth-weight dataset\n")
  cat(nrow(x), "rows and", ncol(x), "variables\n\n")
  NextMethod()
}
