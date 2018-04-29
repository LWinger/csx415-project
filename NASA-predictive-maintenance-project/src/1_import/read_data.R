
setwd("~/Documents/GitHub/csx415-project/NASA-predictive-maintenance-project")


RUL.FD001 <- read.csv('./data/RUL_FD001.txt', header = FALSE, sep = ' ')
RUL.FD002 <- read.csv('./data/RUL_FD002.txt', header = FALSE, sep =  ' ')
RUL.FD003 <- read.csv('./data/RUL_FD003.txt', header = FALSE, sep = ' ')
RUL.FD004 <- read.csv('./data/RUL_FD004.txt', header = FALSE, sep = ' ')

test.FD001 <- read.csv('./data/test_FD001.txt', header = FALSE, sep = ' ')
test.FD002 <- read.csv('./data/test_FD002.txt', header = FALSE, sep = ' ')
test.FD003 <- read.csv('./data/test_FD003.txt', header = FALSE, sep = ' ')
test.FD004 <- read.csv('./data/test_FD004.txt', header = FALSE, sep = ' ')

train.FD001 <- read.csv('./data/train_FD001.txt', header = FALSE, sep = ' ')
train.FD002 <- read.csv('./data/train_FD002.txt', header = FALSE, sep = ' ')
train.FD003 <- read.csv('./data/train_FD003.txt', header = FALSE, sep = ' ')
train.FD004 <- read.csv('./data/train_FD004.txt', header = FALSE, sep = ' ')
