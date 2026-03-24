# Example Data Diagnostics Script

data <- rnorm(100000, 0, 1)
testthat::expect_true(length(data) == 100000)
