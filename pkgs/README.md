# Packages


## NASApredictor

To create this package `setwd()` to this directory. Then run `devtools::create("NASApredictor")`. Then add the model objects to the data directory using `devtools::use_data(model_object, pkg = NASApredictor, overwrite = TRUE)`. Once you have added all of the model objects and filled out the DESCRIPTION, then run `devtools::document("NASApredictor")`.

To install this package run `devtools::install("NASApredictor")`.

To run the tests that exist for this package run `devtools::test("NASApredictor")`.