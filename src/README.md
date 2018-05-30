# Source Code for Analysis and Model Training

To run the code in this folder, you will first need to `setwd()` into the parent directory, i.e. `csx415-project`.


## 1_import

This directory holds the script required to read the raw data from the `csx415-project\data` directory. It is sourced directly in both the `3_eda.R`, the `4_models.R` and the `5_markdown.R` directories directly. The do not need to be pre-run by the user.


## 2_munge

This directory holds the scripts required to prepare the raw data into train and test sets ready for training. As noted in the `csx415-project\data\READ.ME` file, both the train and test sets are provided as multiple multivariate time series from the NASA dataset website. The data is for a fleet of engines, but different engines are in the train set (ones which have reached failure) and the test set (ones which have not yet reached failure and the objective is to predict when / if they will fail in the next 30 days). Thus the typical train - test split approaches are not used in this project. More detailed documentation on the data can be found in the `csx415-project\data\READ.ME`.

These scripts are sourced directly in both the `3_eda.R`, the `4_models.R` and the `5_markdown.R` directories directly. The do not need to be pre-run by the user.


## 3_EDA

This directory holds the script used to conduct Exploratory Data Analysis on the data to identify which features should be considered at the onset by the models.

The graphs generated by the script are saved as .png files in the `csx415-project\graphs` directory. The features which were identified as potentially having predictive power were: 

* sensor_measurement_2
* sensor_measurement_3
* sensor_measurement_4
* sensor_measurement_6
* sensor_measurement_7
* sensor_measurement_8
* sensor_measurement_9
* sensor_measurement_11
* sensor_measurement_12
* sensor_measurement_13
* sensor_measurement_14
* sensor_measurement_15
* sensor_measurement_17
* sensor_measurement_20
* sensor_measurement_21


## 4_models

This directory has the model training scripts for both regression and classification models using different algorithms:

* basic linear regression and logisitc classification
* decision tree regression and classification
* random forest regression and classification (parallelized on 3 cores and still takes ~3 min to train)
* extreme gradient boosting regression and classification (parallelized on 3 cores and still takes ~10 min to train)

These scripts are sourced directly in their associated performance evaluation R markdown file in the `5_markdown` directory.


## 5_markdown

This directory has the R markdown files used to directly call the model training scripts in the `4_models` directory and evaluate each model's performance against the formal project statement criteria for success. The knitted `.html` versions of these R markdown files are stored in the `csx415-project\reports` directory.