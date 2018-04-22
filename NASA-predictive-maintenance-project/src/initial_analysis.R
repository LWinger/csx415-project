##################################
# Load Data and Packages
##################################

setwd("~/Documents/GitHub/csx415-project/NASA-predictive-maintenance-project")
library('ProjectTemplate')
load.project()
library(dplyr)
library(moderndive)

##################################
# Basic Regression to Predict End of Life
##################################

# define a function to fix column names for training / testing data
rename_cols <- function(dataframe_x){
  names1 <- list()
  names2 <- list()
  for(i in 1:3){
    a <- paste("operational_setting_",i, sep = "")
    names1[i] <- a  
  }
  for(i in 1:21){
    a <- paste("sensor_measurement_",i, sep = "")
    names2[i] <- a  
  }
  colnames(dataframe_x) <- c("unit_number", "cycles", names1, names2)
  return(dataframe_x)
}

#rename the columns for train and test datasets
train.FD001 <- rename_cols(train.FD001)
train.FD002 <- rename_cols(train.FD002)
train.FD003 <- rename_cols(train.FD003)
train.FD004 <- rename_cols(train.FD004)
test.FD001 <- rename_cols(test.FD001)
test.FD002 <- rename_cols(test.FD002)
test.FD003 <- rename_cols(test.FD003)
test.FD004 <- rename_cols(test.FD004)

#reorder time series for training datasets
train.FD001 <- train.FD001[order(train.FD001$unit_number, train.FD001$cycles),]
train.FD002 <- train.FD002[order(train.FD002$unit_number, train.FD002$cycles),]
train.FD003 <- train.FD003[order(train.FD003$unit_number, train.FD003$cycles),]
train.FD004 <- train.FD004[order(train.FD004$unit_number, train.FD004$cycles),]

#create a column in the training data for RUL (remaining useful life / time to failure)
add_rul <- function(dataframe_y){
  #training datasets end when the engine fails, so find max number of cycles by engine
  rul <- dataframe_y %>%
    group_by(unit_number) %>%
    filter(cycles == max(cycles)) %>%
    select(unit_number, cycles)
  
  dataframe_y <- dataframe_y %>%
    left_join(rul, by = "unit_number") %>%
    mutate(rul = cycles.y - cycles.x) %>%
    select(-cycles.y)
  #rename column for cycles back to what it was before the join
  colnames(dataframe_y)[colnames(dataframe_y) == "cycles.x"] <- "cycles"
  return(dataframe_y)
}

train.FD001 = add_rul(train.FD001)
train.FD002 = add_rul(train.FD002)
train.FD003 = add_rul(train.FD003)
train.FD004 = add_rul(train.FD004)

#fit the basic linear model to the first engine
engine1_train <- train.FD001 %>%
  filter(unit_number == 1)

engine1_test <- test.FD001 %>%
  filter(unit_number == 1) %>%
  select(-c(unit_number,cycles,operational_setting_1,operational_setting_2,operational_setting_3))

#try all sensors
basic_model <- lm(rul ~ sensor_measurement_1 + sensor_measurement_2 + sensor_measurement_3 +
                  sensor_measurement_4 + sensor_measurement_5 + sensor_measurement_6 +
                  sensor_measurement_7 + sensor_measurement_8 + sensor_measurement_9 +
                  sensor_measurement_10 + sensor_measurement_11 + sensor_measurement_12 +
                  sensor_measurement_13 + sensor_measurement_14 + sensor_measurement_15 +
                  sensor_measurement_16 + sensor_measurement_17 + sensor_measurement_18 +
                  sensor_measurement_19 + sensor_measurement_20 + sensor_measurement_21
                  , data = engine1_train)

#look at prelimiary model fit indicators
get_regression_table(basic_model)
summary(basic_model)

#make predictions
basic_predictions <- predict(basic_model, engine1_test)

