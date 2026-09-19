### RcppBootstrap

This is a very simple package that contains one function and a print version of it. It provides a simple implementation of bootstrap confidence intervals for the median using Rcpp.

### Instructions:

1. Checkout this repository
2. Use getwd() and setwd() to get into the right folder
3. Run the following commands in your R terminal
```R
install.packages("Rcpp")
install.packages("devtools")

Rcpp::compileAttributes()
devtools::load_all()

result <- bootstrap_median_ci(
    rnorm(100),
    B = 1000,
    conf = 0.95
)

print(result)

devtools::test()
```