##################################
# Clean training datasets and add labels for regression / classification
##################################

library(dplyr)

#### Define functions ####

# define a function to fix column names for training / testing data
rename_cols <- function(dataframe_x){
  #drop columns will all na
  dataframe_x = subset(dataframe_x, select = -c(27,28))
  
  #fix header
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

#create a column in the training data for RUL (remaining useful life / time to failure) for regression
add_train_rul <- function(dataframe_y){
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

#create a column in the training data for classification window binary prediction
# ie. will the engine fail in the next x cycles
add_class_label <- function(dataframe_y, classification_window){
  dataframe_y = dataframe_y %>%
    mutate(class_label = ifelse(rul <=  classification_window, 1, 0))
  return(dataframe_y)
}



#### Call functions on each training set ####

#rename the columns for train and test datasets
train.FD001 <- rename_cols(train.FD001)
train.FD002 <- rename_cols(train.FD002)
train.FD003 <- rename_cols(train.FD003)
train.FD004 <- rename_cols(train.FD004)

#reorder time series for training datasets
train.FD001 <- train.FD001[order(train.FD001$unit_number, train.FD001$cycles),]
train.FD002 <- train.FD002[order(train.FD002$unit_number, train.FD002$cycles),]
train.FD003 <- train.FD003[order(train.FD003$unit_number, train.FD003$cycles),]
train.FD004 <- train.FD004[order(train.FD004$unit_number, train.FD004$cycles),]

train.FD001 = add_train_rul(train.FD001)
train.FD002 = add_train_rul(train.FD002)
train.FD003 = add_train_rul(train.FD003)
train.FD004 = add_train_rul(train.FD004)

train.FD001 = add_class_label(train.FD001, 30)
train.FD002 = add_class_label(train.FD002, 30)
train.FD003 = add_class_label(train.FD003, 30)
train.FD004 = add_class_label(train.FD004, 30)
