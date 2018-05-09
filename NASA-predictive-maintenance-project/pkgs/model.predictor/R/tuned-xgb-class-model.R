#' Tuned xgboost classification model
#'
#' A tuned model that is ready to make predictions to classify whether or not a Turbofan engine will fail within the next 30 cycles.
#'
#' @docType data
#'
#' @usage predict(tuned_xgb_class_model, new_data)
#'
#' @format An object of class \code{"cross"}; see \code{\link[qtl]{read.cross}}.
#'
#' @examples
#' factors <- c('sensor_measurement_2','sensor_measurement_3', 'sensor_measurement_4', 'sensor_measurement_6',
#' 'sensor_measurement_7', 'sensor_measurement_8','sensor_measurement_9', 'sensor_measurement_11','sensor_measurement_12',
#' 'sensor_measurement_13','sensor_measurement_14','sensor_measurement_15', 'sensor_measurement_17',
#' 'sensor_measurement_20','sensor_measurement_21')
#' tuned_xgb_class_predictions <- predict(tuned_xgb_class_model, test.FD001[factors], type = 'prob')

"tuned_xgb_class_model.rds"