#' Summarize birth weight by a grouping variable
#'
#' This function calculates the average birth weight for each level of a chosen
#' categorical variable (e.g., "smoke", "race", "low"). It includes defensive
#' checks to ensure the input is valid.
#'
#' @param group A string naming the column to group by.
#' @return A tibble summarizing mean birth weight and sample sizes.
#' @examples
#' data <- bw_data()
#' bw_summary(data, "smoke")
#' @export
bw_summary <- function(data, group) {
  # Defensive checks ----

  # Must be a data frame
  if (!is.data.frame(data)) {
    stop("'data' must be a data frame returned by bw_data().")
  }

  # Group must be a single string
  if (!is.character(group) || length(group) != 1) {
    stop("'group' must be a single column name (string).")
  }

  # Group must exist in dataset
  if (!group %in% names(data)) {
    stop(paste0("The column '", group, "' does not exist in the dataset."))
  }

  # Special check — dataset must contain 'bwt'
  if (!"bwt" %in% names(data)) {
    stop("The dataset does not contain the column 'bwt' (birth weight).")
  }

  # Summary ----
  result <- dplyr::group_by(data, .data[[group]]) |>
    dplyr::summarise(
      n = dplyr::n(),
      mean_bwt = mean(bwt, na.rm = TRUE),
      sd_bwt = sd(bwt, na.rm = TRUE),
      .groups = "drop"
    )

  return(result)
}
