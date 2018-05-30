#' Load Sample Data
#'
#' This function loads data from a package as a dataframe. It assumes that the 
#' package is already loaded with library() and expects a string that is the
#' name of the dataset.
#'
#' @param ... String name of dataset
#' @return Dataframe
#' @export



getdata <- function(...)
{
  e <- new.env()
  name <- data(..., envir = e)[1]
  e[[name]]
}


#' Make New Predictions
#'
#' This function makes predictions on new data. For every rown in the dataset, a prediction will 
#' be made. There are 8 models that have been trained and are ready to make regression and classification
#' predictions. For regression the predictions will be the RUL (the remaining useful life of the engine)
#' and for classification the predictions will be whether or not the engine will fail in the next 30
#' days. 
#' 
#' The models that the user can choose from are: basic_classtree_model, basic_linear_model,                
#' basic_logistic_model, basic_regtree_model, tuned_rf_class_model, tuned_rf_reg_model, tuned_xgb_class_model,              
#' tuned_xgb_reg_model.
#' 
#'
#' @param specified_model String name of acceptable model type listed in details
#' @param new_data Dataframe of new data with all sensor measurements
#' @return Predictions
#' @export


# define a function to make predictions given new data and a model
new_NASApredictions <- function(specified_model, new_data){
  
  #load models
  data(list = c("basic_linear_model","basic_logistic_model","basic_regtree_model","basic_classtree_model",
                "tuned_rf_reg_model","tuned_rf_class_model","tuned_xgb_reg_model","tuned_xgb_class_model"))
  
  #define factors (based on model training)
  factors <- c('sensor_measurement_2','sensor_measurement_3', 'sensor_measurement_4', 'sensor_measurement_6',
               'sensor_measurement_7', 'sensor_measurement_8','sensor_measurement_9', 'sensor_measurement_11',
               'sensor_measurement_12', 'sensor_measurement_13','sensor_measurement_14','sensor_measurement_15', 
               'sensor_measurement_17', 'sensor_measurement_20','sensor_measurement_21')
  
  #make predictions
  if(specified_model == "basic_linear_model"){
    predictions <- predict(basic_linear_model, new_data[factors])  
  } else if(specified_model == "basic_logistic_model"){
    predictions <- predict(basic_logistic_model, new_data[factors], type = 'response')  
  } else if(specified_model == "basic_regtree_model"){
    predictions <- predict(basic_regtree_model, new_data[factors]) 
  } else if(specified_model == "basic_classtree_model"){
    predictions <- predict(basic_classtree_model, new_data[factors], type = 'prob') 
  } else if(specified_model == "tuned_rf_reg_model"){
    predictions <- predict(tuned_rf_reg_model, new_data[factors]) 
  } else if(specified_model == "tuned_rf_class_model"){
    predictions <- predict(tuned_rf_class_model, new_data[factors], type = 'prob') 
  } else if(specified_model == "tuned_xgb_reg_model"){
    predictions <- predict(tuned_xgb_reg_model, new_data[factors])  
  } else if(specified_model == "tuned_xgb_class_model"){
    predictions <- predict(tuned_xgb_class_model, new_data[factors], type = 'prob') 
  }
  
  return(predictions)
}