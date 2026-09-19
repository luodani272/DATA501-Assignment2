# This is a very basic test to check that the confidence interval contains the sample median. 

test_that("confidence interval contains the sample median", {

  set.seed(123)

  x <- rnorm(100)

  result <- bootstrap_median_ci(
    x,
    B = 1000,
    conf = 0.95
  )

  expect_lte(
    result$lower,
    result$estimate
  )

  expect_gte(
    result$upper,
    result$estimate
  )
})

# This test checks whether the generated confidence interval is sensible or not

test_that("confidence interval contains the sample median", {

  set.seed(123)

  x <- rnorm(100)

  result <- bootstrap_median_ci(
    x,
    B = 1000,
    conf = 0.95
  )

  expect_lte(
    result$lower,
    result$estimate
  )

  expect_gte(
    result$upper,
    result$estimate
  )
})

# This test checks whether the function rejects invalid input.

test_that("invalid input is rejected", {

  expect_error(
    bootstrap_median_ci("hello"),
    "x must be numeric"
  )

  expect_error(
    bootstrap_median_ci(1),
    "at least two observations"
  )

  expect_error(
    bootstrap_median_ci(c(1, 2, NA)),
    "only finite values"
  )

  expect_error(
    bootstrap_median_ci(1:10, B = 0),
    "B must be a positive integer"
  )

  expect_error(
    bootstrap_median_ci(1:10, conf = 1),
    "between 0 and 1"
  )
})