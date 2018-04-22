# NASA Predictive Maintenance Project

For this project, the Prognostics Center of Excellence at NASA’s Ames research center has curated a data set with sensor readings from a fleet of simulated aircraft gas turbofan engines and the Ninja Air Maintenance Operations team (*made up airline for this project*) would like to leverage this data to change their current turbofan engine maintenance strategy to a predictive maintenance one. Right now Ninja Air services its engines after a set number of flight cycles (one cycle = one take-off + one landing) depending on the engine type. The CF6-80E (for Airbus A330s), requires major maintenance approximately every 7,300 cycles and minor maintenance every 200-400 cycles (*taken from KLM statistics for this example*).


## Documents in this Repository

```
project
│   README.md
│   project-performance.Rmd
|   project-performance.html
|   FPS_NASA_predictive_maintenance.Rmd
|   FPS_NASA_predictive_maintenance.html
│
└───NASA-predictive-maintenance-project
│   │   TODO
|   |   README.md
│   │
│   └───cache
│   |   │   README.md
│   |   │   RUL.FD001.hash
|   |   |   RUL.FD001.RData
│   |   │   ...
|   |   
│   └───config
│   |   │   README.md
│   |   │   global.dcf
|   |   
│   └───data
│   |   │   README.md
│   |   │   RUL_FD001.txt
│   |   │   RUL_FD002.txt
│   |   │   RUL_FD003.txt
│   |   │   RUL_FD004.txt
│   |   │   test_FD001.txt
│   |   │   test_FD002.txt
│   |   │   test_FD003.txt
│   |   │   test_FD004.txt
│   |   │   train_FD001.txt
│   |   │   train_FD002.txt
│   |   │   train_FD003.txt
│   |   │   train_FD004.txt
|   |   
│   └───diagnostics
│   |   │   README.md
|   |   |   1.R
|   |   
│   └───docs
│   |   │   README.md
|   |   |   Damage Propagation Modeling.pdf
|   |   
│   └───graphs
│   |   │   README.md
|   |   
│   └───lib
│   |   │   README.md
|   |   |   globals.R
|   |   |   helpers.R
|   |   
│   └───logs
│   |   │   README.md
|   |  
│   └───munge
│   |   │   README.md
|   |   |   01-A.R
|   |   
│   └───profiling
│   |   │   README.md
|   |   |   1.R
|   |  
│   └───reports
│   |  │   README.md
|   |   
│   └───src
│   |   │   README.md
|   |   |   initial_analysis.R
|   |   |   eda.R
|   |   
│   └───tests
│   |   │   README.md
|   |   |   1.R
|       
```