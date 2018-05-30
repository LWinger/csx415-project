library(testthat)
library(NASApredictor)

#Check Baseline Models
test_that("baseline model objects are the correct model type", {
  expect_is(basic_linear_model,'lm')
  expect_is(basic_logistic_model,'glm')
})

#Check Basic Tree Models
test_that("basic tree model objects are the correct model type", {
  expect_is(basic_regtree_model, 'rpart')
  expect_is(basic_classtree_model, 'rpart')
})

#Check Random Forest Models
test_that("random forest model objects are the correct model type", {
  expect_is(tuned_rf_reg_model, 'train')
  expect_is(tuned_rf_class_model, 'train')
})

#Tuned XGBOOST Models
test_that("random forest model objects are the correct model type", {
  expect_is(tuned_xgb_reg_model, 'train')
  expect_is(tuned_xgb_class_model, 'train')
})