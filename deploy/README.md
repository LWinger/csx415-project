# Deploying the Trained Models on New Data

## Installing deployment

This project can be deployed using packrat unbundle. Assuming you `setwd()` to this directory, you can run `packrat::unbundle(bundle = './packrat/bundles/deploy-2018-05-30.tar.gz', where = 'path_to_directory_to_unbundle_project', restore = TRUE)`.

To make new predictions, use the make-predictions.R script. The user can choose which model to use and can either use default sample data or provide new data in the form of an R dataframe.

## Model objects (stored as data) in package ‘NASApredictor’:

The following 8 model objects (trained and evaluated in the `csx415-project\src` directory) are kept in the package for deployment. These are:

basic_classtree_model             
basic_linear_model                
basic_logistic_model              
basic_regtree_model               
tuned_rf_class_model              
tuned_rf_reg_model                
tuned_xgb_class_model             
tuned_xgb_reg_model   


## Sample data in package ‘NASApredictor’:

There is a sample of both test and train data in the package as well. These are:

test_sample                       
train_sample  