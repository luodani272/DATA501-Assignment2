#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector bootstrap_median_cpp(
    NumericVector x,
    int B,
    double conf
) {

    int n = x.size();

    NumericVector bootstrap_medians(B);

    for (int b = 0; b < B; b++) {

        NumericVector sample(n);

        for (int i = 0; i < n; i++) {

            int index = floor(R::runif(0, n));

            sample[i] = x[index];
        }

        std::sort(sample.begin(), sample.end());

        if (n % 2 == 0) {
            bootstrap_medians[b] =
                (sample[n / 2 - 1] + sample[n / 2]) / 2.0;
        } else {
            bootstrap_medians[b] =
                sample[n / 2];
        }
    }

    return bootstrap_medians;
}