#' @export
print.bootstrap_median_ci <- function(x, ...) {

  cat("Bootstrap confidence interval for the median\n")
  cat("============================================\n")

  cat("Estimate:", x$estimate, "\n")
  cat("Lower:", x$lower, "\n")
  cat("Upper:", x$upper, "\n")
  cat("Confidence:", x$confidence, "\n")
  cat("Bootstrap samples:", x$B, "\n")

  invisible(x)
}
