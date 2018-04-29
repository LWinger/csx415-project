##################################
# Clean testing datasets and add labels for regression / classification
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


#use the ground truth data set to create labels for the test data
add_test_rul <- function(dataframe_test, ground_truth){
  #training datasets end when the engine fails, so find max number of cycles by engine
  #determine # cycles in the test dataset for each engine
  rul <- dataframe_test %>%
    group_by(unit_number) %>%
    filter(cycles == max(cycles)) %>%
    select(unit_number, cycles)
  
  #drop column will all na
  ground_truth = subset(ground_truth, select = -c(2))
  colnames(ground_truth) <- "ground_truth"
  ground_truth$id <- seq.int(nrow(ground_truth))
  
  #add the ground truth rul to the number of cycles in the test dataset
  ground_truth <- merge(rul,ground_truth, by.x = 'unit_number', by.y = 'id')
  
  #add test observed rul and ground truth to get the actual rul for the test data
  ground_truth$ground_truth_rul = ground_truth$cycles + ground_truth$ground_truth
  
  #join to test set
  dataframe_test <- dataframe_test %>%
    left_join(ground_truth, by = "unit_number") %>%
    select(-c(cycles.y,ground_truth))
  colnames(dataframe_test)[colnames(dataframe_test) == "cycles.x"] <- "cycles"
  
  dataframe_test$ground_truth_rul <- dataframe_test$ground_truth_rul - dataframe_test$cycles
  
  return(dataframe_test)
}

#create a column in the test data for classification window binary prediction
# ie. will the engine fail in the next x cycles
add_class_label <- function(dataframe_y, classification_window){
  dataframe_y = dataframe_y %>%
    mutate(class_label = ifelse(ground_truth_rul <=  classification_window, 1, 0))
  return(dataframe_y)
}



#### Call functions on each testing set ####

#rename the columns for train and test datasets
test.FD001 <- rename_cols(test.FD001)
test.FD002 <- rename_cols(test.FD002)
test.FD003 <- rename_cols(test.FD003)
test.FD004 <- rename_cols(test.FD004)

test.FD001 <- add_test_rul(test.FD001, RUL.FD001)
test.FD002 <- add_test_rul(test.FD002, RUL.FD002)
test.FD003 <- add_test_rul(test.FD003, RUL.FD003)
test.FD004 <- add_test_rul(test.FD004, RUL.FD004)

test.FD001 = add_class_label(test.FD001, 30)
test.FD002 = add_class_label(test.FD002, 30)
test.FD003 = add_class_label(test.FD003, 30)
test.FD004 = add_class_label(test.FD004, 30)
