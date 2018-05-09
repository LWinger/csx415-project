##################################
# Load Data and Packages
##################################

library(moderndive)
library(caret)

#parallelize model training
library(doMC)
registerDoMC(cores = 3)

## read data 
source('./src/1_import/read_data.R')

## munge data
source('./src/2_munge/01-prepare_train_sets.R')
source('./src/2_munge/02-prepare_test_sets.R')

##################################
# eXtreme Gradient Boosting Regression to Predict End of Life
##################################

# How many cycles are there (starting now) before the engine will fail?


# based on Exploratory Data Analysis, leave out Sensors 1, 5, 10, 16, 18, 19
predictors <- train.FD001 %>% select(sensor_measurement_2, sensor_measurement_3,
                                     sensor_measurement_4, sensor_measurement_6,
                                     sensor_measurement_7, sensor_measurement_8, sensor_measurement_9, 
                                     sensor_measurement_11, sensor_measurement_12, 
                                     sensor_measurement_13, sensor_measurement_14, sensor_measurement_15, 
                                     sensor_measurement_17, sensor_measurement_20, sensor_measurement_21) %>% as.matrix()
output <- train.FD001$rul

# create the tuning grid
tuneGridXGB <- expand.grid(
  nrounds=c(350),
  max_depth = c(4, 6),
  eta = c(0.01, 0.1),
  gamma = c(0.01),
  colsample_bytree = c(1),
  subsample = c(0.50),
  min_child_weight = c(0, 2))

# use caret to tune grid search
tuned_xgb_reg_model <- train(x = predictors, y = output,
                            method = "xgbTree", # eXtreme Gradient Boosting
                            #preProcess = c("center", "scale", "pca"),
                            metric = "RMSE", # use RMSE to evaluate models
                            tuneGrid = tuneGridXGB)

print(tuned_xgb_reg_model)

# plot the rmse for various possible training values
ggplot(tuned_xgb_reg_model)

#look at prelimiary model fit indicators
xgb_fit_reg_summary <- summary(tuned_xgb_reg_model$finalModel)

#make predictions
factors <- c('sensor_measurement_2','sensor_measurement_3', 'sensor_measurement_4', 'sensor_measurement_6',
             'sensor_measurement_7', 'sensor_measurement_8','sensor_measurement_9', 'sensor_measurement_11','sensor_measurement_12',
             'sensor_measurement_13','sensor_measurement_14','sensor_measurement_15', 'sensor_measurement_17',
             'sensor_measurement_20','sensor_measurement_21')
tuned_xgb_reg_predictions <- predict(tuned_xgb_reg_model, test.FD001[factors])



##################################
# Basic Classification to Predict Failure
##################################

# Will this engine fail in the next 30 cycles?

# change label for classification
output <- factor(train.FD001$class_label)

# use caret to pick a value for mtry
tuned_xgb_class_model <- train(x = predictors, y = output,
                              method = "xgbTree", # eXtreme Gradient Boosting
                              #preProcess = c("center", "scale", "pca"),
                              metric = "Kappa", # use Kappa to evaluate models due to imbalance
                              tuneGrid = tuneGridXGB)

print(tuned_xgb_class_model)

#look at prelimiary model fit indicators
xgb_fit_class_summary <- summary(tuned_xgb_class_model)

#make predictions
factors <- c('sensor_measurement_2','sensor_measurement_3', 'sensor_measurement_4', 'sensor_measurement_6',
             'sensor_measurement_7', 'sensor_measurement_8','sensor_measurement_9', 'sensor_measurement_11','sensor_measurement_12',
             'sensor_measurement_13','sensor_measurement_14','sensor_measurement_15', 'sensor_measurement_17',
             'sensor_measurement_20','sensor_measurement_21')
tuned_xgb_class_predictions <- predict(tuned_xgb_class_model, test.FD001[factors], type = 'raw')
