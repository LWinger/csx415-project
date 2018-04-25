##################################
# Load Data and Packages
##################################

library('ProjectTemplate')
load.project()
library(moderndive)

##################################
# Basic Regression to Predict End of Life
##################################

# How many cycles are there (starting now) before the engine will fail?

# based on Exploratory Data Analysis, leave out Sensors 1, 5, 10, 16, 18, 19
basic_linear_model <- lm(rul ~ sensor_measurement_2 + sensor_measurement_3 +
                  sensor_measurement_4 + sensor_measurement_6 +
                  sensor_measurement_7 + sensor_measurement_8 + sensor_measurement_9 +
                  sensor_measurement_11 + sensor_measurement_12 +
                  sensor_measurement_13 + sensor_measurement_14 + sensor_measurement_15 +
                  sensor_measurement_17 + sensor_measurement_20 + sensor_measurement_21
                  , data = train.FD001)

#look at prelimiary model fit indicators
get_regression_table(basic_linear_model)
summary(basic_linear_model)

#make predictions
factors <- c('sensor_measurement_2','sensor_measurement_3', 'sensor_measurement_4', 'sensor_measurement_6',
             'sensor_measurement_7', 'sensor_measurement_8','sensor_measurement_9', 'sensor_measurement_11','sensor_measurement_12',
             'sensor_measurement_13','sensor_measurement_14','sensor_measurement_15', 'sensor_measurement_17',
             'sensor_measurement_20','sensor_measurement_21')
basic_linear_predictions <- predict(basic_linear_model, test.FD001[factors])



##################################
# Basic Classification to Predict Failure
##################################

# Will this engine fail in the next 30 cycles?

# based on Exploratory Data Analysis, leave out Sensors 1, 5, 10, 16, 18, 19
basic_logistic_model <- glm(factor(class_label) ~ sensor_measurement_2 + sensor_measurement_3 +
                           sensor_measurement_4 + sensor_measurement_6 +
                           sensor_measurement_7 + sensor_measurement_8 + sensor_measurement_9 +
                           sensor_measurement_11 + sensor_measurement_12 +
                           sensor_measurement_13 + sensor_measurement_14 + sensor_measurement_15 +
                           sensor_measurement_17 + sensor_measurement_20 + sensor_measurement_21
                         , data = train.FD001, family=binomial())

#look at prelimiary model fit indicators
summary(basic_linear_model) 
confint(basic_linear_model) # 95 CI for the coefficients

#make predictions
factors <- c('sensor_measurement_2','sensor_measurement_3', 'sensor_measurement_4', 'sensor_measurement_6',
             'sensor_measurement_7', 'sensor_measurement_8','sensor_measurement_9', 'sensor_measurement_11','sensor_measurement_12',
             'sensor_measurement_13','sensor_measurement_14','sensor_measurement_15', 'sensor_measurement_17',
             'sensor_measurement_20','sensor_measurement_21')
basic_logistic_predictions <- predict(basic_logistic_model, test.FD001[factors], type = 'response')

