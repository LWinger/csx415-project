#load packages
library(NASApredictor)

# load test data from package calling getdata() or specify a dataframe
test_sample_data <- getdata("test_sample")

# make predictions
# specify model to test from list and new data to make predictions on
# 
# basic_classtree_model             
# basic_linear_model                
# basic_logistic_model              
# basic_regtree_model               
# tuned_rf_class_model              
# tuned_rf_reg_model                
# tuned_xgb_class_model             
# tuned_xgb_reg_model 


predictions <- new_NASApredictions("tuned_xgb_reg_model", test_sample_data)
