#' Tuned xgboost regression model
#'
#' A tuned model that is ready to make predictions for how many cycles remain before Turbofan engine failure (ie. the Remaining Useful Life, RUL).
#'
#' @docType data
#'
#' @usage predict(tuned_reg_class_model, new_data)
#'
#' @format An object of class \code{"cross"}; see \code{\link[qtl]{read.cross}}.
#'
#' @examples
#' factors <- c('sensor_measurement_2','sensor_measurement_3', 'sensor_measurement_4', 'sensor_measurement_6',
#' 'sensor_measurement_7', 'sensor_measurement_8','sensor_measurement_9', 'sensor_measurement_11','sensor_measurement_12',
#' 'sensor_measurement_13','sensor_measurement_14','sensor_measurement_15', 'sensor_measurement_17',
#' 'sensor_measurement_20','sensor_measurement_21')
#' tuned_xgb_reg_predictions <- predict(tuned_xgb_reg_model, test.FD001[factors])

"tuned_reg_reg_model.rds"