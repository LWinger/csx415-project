# Deploying the Trained Models on New Data

## Installing deployment

This project can be deployed using packrat unbundle. Assuming you `setwd()` to this directory, you can run `packrat::unbundle(bundle = './packrat/bundles/deploy-2018-05-30.tar.gz', where = 'path_to_directory_to_unbundle_project', restore = TRUE)`.

To make new predictions, use the make-predictions.R script. The user can choose which model to use and can either use default sample data or provide new data in the form of an R dataframe.

## Model objects (stored as data) in package ‘NASApredictor’:

The following 8 model objects (trained and evaluated in the `csx415-project\src` directory) are kept in the package for deployment. These are:

basic_linear_model: basic linear regression model to predict remaining useful life using all 15 sensors as features
basic_logistic_model: basic logistic classification model to predict failure within 30 days using all 15 sensors as features
basic_classtree_model: basic classification decision tree model to predict failure within 30 days (only 5 sensors chosen by model as features) 
basic_regtree_model: basic regression decision tree model to predict remaining useful life (only 3 sensors chosen by model as features)             
tuned_rf_class_model: tuned random forest classification model to predict failure within 30 days with 25 trees and Kappa to evaluate models due to imbalance
tuned_rf_reg_model: tuned random forest regression model to predict remaining useful life with 25 trees and RMSE as the metric to evaluate models
tuned_xgb_class_model: eXtreme Gradient Boosting classification to predict failure within 30 days using grid search and RMSE as the metric to evaluate models
tuned_xgb_reg_model: eXtreme Gradient Boosting regression to predict remaining useful life using grid search and Kappa to evaluate models due to imbalance


## Sample data in package ‘NASApredictor’:

There is a sample of both test and train data in the package as well. These are:

test_sample: prepared as in `csx415-project\src\2_munge` directory                        
train_sample: prepared as in `csx415-project\src\2_munge` directory