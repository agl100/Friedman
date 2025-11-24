#' Scatterplot for the birth weight dataset
#'
#' This function creates a scatterplot of two numeric variables from the
#' cleaned birth weight dataset. Users can optionally color points by a
#' categorical variable and choose whether to add a linear trendline.
#'
#' @param data A data frame returned by \code{bw_data()}.
#' @param x A string naming the x-axis numeric variable.
#' @param y A string naming the y-axis numeric variable.
#' @param color Optional string naming a grouping variable for point colors.
#' @param trend Logical; if TRUE, adds a linear regression trendline.
#'
#' @return A ggplot object.
#'
#' @examples
#' data <- bw_data()
#' bw_plot(data, "age", "bwt", color = "smoke", trend = TRUE)
#'
#' @export
bw_plot <- function(data, x, y, color = NULL, trend = TRUE) {
  # --- Defensive checks ---

  # dataset check
  if (!is.data.frame(data)) {
    stop("'data' must be a data frame returned by bw_data().")
  }

  # x and y must be strings
  if (!is.character(x) || length(x) != 1) {
    stop("'x' must be a single column name (string).")
  }
  if (!is.character(y) || length(y) != 1) {
    stop("'y' must be a single column name (string).")
  }

  # columns must exist
  needed_cols <- c(x, y)
  if (!all(needed_cols %in% names(data))) {
    stop("One or more of the specified x/y columns do not exist in the dataset.")
  }

  # optional color must exist
  if (!is.null(color)) {
    if (!is.character(color) || length(color) != 1) {
      stop("'color' must be a single column name (string) if used.")
    }
    if (!color %in% names(data)) {
      stop(paste0("The color column '", color, "' does not exist in the dataset."))
    }
  }

  # Build plot
  aes_mapping <- if (is.null(color)) {
    ggplot2::aes_string(x = x, y = y)
  } else {
    ggplot2::aes_string(x = x, y = y, color = color)
  }

  p <- ggplot2::ggplot(data, aes_mapping) +
    ggplot2::geom_point(na.rm = TRUE) +
    ggplot2::theme_minimal() +
    ggplot2::labs(x = x, y = y)

  # Add trendline
  if (isTRUE(trend)) {
    p <- p + ggplot2::geom_smooth(
      method = "lm",
      se = FALSE,
      na.rm = TRUE
    )
  }

  return(p)
}
