# Has the model met the success criteria?

The basic linear and tree models for both classification and regression do not meet the success criteria outlined in the FPS.

The next steps are:
 - introduce some new features that are lag / window functions of the existing sensor data
 - try some other regression model techniques (XGBOOST, deep learning -> LSTM is a potential option)
 - try some other classification model techniques (XGBOOST)
 - two other questions that we have not tried to answer yet -> Is this engine behaving normally? (annomoly detection) and From these qualities of an engine, how does the risk of failure change over time? (survival analysis)
 