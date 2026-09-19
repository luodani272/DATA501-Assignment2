
#' Bootstrap confidence interval for the median
#'
#' Calculates a percentile bootstrap confidence interval for
#' the population median.
#'
#' @param x Numeric vector of observations.
#' @param B Number of bootstrap samples.
#' @param conf Confidence level between 0 and 1.
#'
#' @return An S3 object of class "bootstrap_median_ci" containing
#' the sample median, confidence interval, and number of bootstrap
#' samples.
#'
#' @export
bootstrap_median_ci <- function(x, B = 1000, conf = 0.95) {

  if (!is.numeric(x)) {
    stop("x must be numeric")
  }

  if (length(x) < 2) {
    stop("x must contain at least two observations")
  }

  if (any(!is.finite(x))) {
    stop("x must contain only finite values")
  }

  if (length(B) != 1 || B <= 0 || B != as.integer(B)) {
    stop("B must be a positive integer")
  }

  if (length(conf) != 1 || conf <= 0 || conf >= 1) {
    stop("conf must be between 0 and 1")
  }

  bootstrap_values <- bootstrap_median_cpp(
    x = x,
    B = as.integer(B),
    conf = conf
  )

  alpha <- 1 - conf

  lower <- as.numeric(
    stats::quantile(
      bootstrap_values,
      probs = alpha / 2,
      names = FALSE
    )
  )

  upper <- as.numeric(
    stats::quantile(
      bootstrap_values,
      probs = 1 - alpha / 2,
      names = FALSE
    )
  )

  result <- list(
    estimate = stats::median(x),
    lower = lower,
    upper = upper,
    B = as.integer(B),
    confidence = conf
  )

  class(result) <- "bootstrap_median_ci"

  result
}
