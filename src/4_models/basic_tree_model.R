##################################
# Load Data and Packages
##################################

library(rpart)
library(rpart.plot)

## read data 
source('./src/1_import/read_data.R')

## munge data
source('./src/2_munge/01-prepare_train_sets.R')
source('./src/2_munge/02-prepare_test_sets.R')

##################################
# Basic Regression to Predict End of Life
##################################

# How many cycles are there (starting now) before the engine will fail?

# based on Exploratory Data Analysis, leave out Sensors 1, 5, 10, 16, 18, 19
basic_regtree_model <- rpart(rul ~ sensor_measurement_2 + sensor_measurement_3 +
                           sensor_measurement_4 + sensor_measurement_6 +
                           sensor_measurement_7 + sensor_measurement_8 + sensor_measurement_9 +
                           sensor_measurement_11 + sensor_measurement_12 +
                           sensor_measurement_13 + sensor_measurement_14 + sensor_measurement_15 +
                           sensor_measurement_17 + sensor_measurement_20 + sensor_measurement_21
                         , data = train.FD001, method = 'anova')

#look at prelimiary model fit indicators
regtree_fit_reg_table <- printcp(basic_regtree_model)
regtree_fit_reg_summary <- summary(basic_regtree_model)

rpart.plot(basic_regtree_model, main = "Regression Tree for Engine RUL")

#make predictions
factors <- c('sensor_measurement_2','sensor_measurement_3', 'sensor_measurement_4', 'sensor_measurement_6',
             'sensor_measurement_7', 'sensor_measurement_8','sensor_measurement_9', 'sensor_measurement_11','sensor_measurement_12',
             'sensor_measurement_13','sensor_measurement_14','sensor_measurement_15', 'sensor_measurement_17',
             'sensor_measurement_20','sensor_measurement_21')

#prediction on last (ie. most recent) test datapoint is the only one that counts
most_recent_test <- test.FD001 %>%
  group_by(unit_number) %>%
  filter(row_number() == which.max(cycles))

basic_regtree_predictions <- predict(basic_regtree_model, most_recent_test[factors])



##################################
# Basic Classification to Predict Failure
##################################

# Will this engine fail in the next 30 cycles?

# based on Exploratory Data Analysis, leave out Sensors 1, 5, 10, 16, 18, 19
basic_classtree_model <- rpart(factor(class_label) ~ sensor_measurement_2 + sensor_measurement_3 +
                              sensor_measurement_4 + sensor_measurement_6 +
                              sensor_measurement_7 + sensor_measurement_8 + sensor_measurement_9 +
                              sensor_measurement_11 + sensor_measurement_12 +
                              sensor_measurement_13 + sensor_measurement_14 + sensor_measurement_15 +
                              sensor_measurement_17 + sensor_measurement_20 + sensor_measurement_21
                            , data = train.FD001, method = 'class')

#look at prelimiary model fit indicators
classtree_fit_class_table <- printcp(basic_classtree_model)
classtree_fit_class_summary <- summary(basic_classtree_model)

rpart.plot(basic_classtree_model, main = "Classification Tree for Engine RUL")

#make predictions
factors <- c('sensor_measurement_2','sensor_measurement_3', 'sensor_measurement_4', 'sensor_measurement_6',
             'sensor_measurement_7', 'sensor_measurement_8','sensor_measurement_9', 'sensor_measurement_11','sensor_measurement_12',
             'sensor_measurement_13','sensor_measurement_14','sensor_measurement_15', 'sensor_measurement_17',
             'sensor_measurement_20','sensor_measurement_21')

#use same test set as created in regression modeling
basic_classtree_predictions <- predict(basic_classtree_model, most_recent_test[factors], type = 'prob')
