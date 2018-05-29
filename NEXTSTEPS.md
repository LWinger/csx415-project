# Has the model met the success criteria?

The basic linear and tree models for both classification and regression do not meet the success criteria outlined in the FPS.

The next steps are:
 - introduce some new features that are lag / window functions of the existing sensor data
 - try some other regression model techniques (XGBOOST, deep learning -> LSTM is a potential option) [partially done]
 - try some other classification model techniques (XGBOOST) [done]
 - make predictions for the 100 test engines only once (ie based on the final reading predict RUL and if it will fail in next 30 days) [done]
 - try a asymetric cost function in the model performance evaluation that penalizes false negatives more than false positives
 - two other questions that we have not tried to answer yet -> Is this engine behaving normally? (annomoly detection) and from these qualities of an engine, how does the risk of failure change over time? (survival analysis)
 