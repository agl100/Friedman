#' Access the cleaned birth weight dataset
#'
#' This function returns the cleaned version of the \code{birthwt} dataset
#' included in the package. It checks that the dataset exists and provides a
#' clear error message if something is wrong.
#'
#' @return A data frame containing the cleaned birth weight dataset.
#' @examples
#' data <- bw_data()
#' head(data)
#' @export
bw_data <- function() {
  # Check that the dataset exists in the package environment
  if (!exists("birthwt_clean", where = .GlobalEnv) &&
      !"birthwt_clean" %in% ls("package:Friedman")) {
    stop(
      "The dataset 'birthwt_clean' was not found.\n",
      "Try reinstalling the package or checking that data-raw/prepare_data.R was run."
    )
  }

  # Load from package namespace
  data("birthwt_clean", package = "Friedman", envir = environment())

  # Return using S3 Class
  x <- birthwt_clean
  class(x) <- c("bw_tbl", class(x))
  return(x)
}
