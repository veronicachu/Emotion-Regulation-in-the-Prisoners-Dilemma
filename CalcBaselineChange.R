
# load data ---------------------------------------------------------------

setwd("C:/Users/User/Documents/R")
basedata = read.csv("Base_AllRounds.csv")
taskdata = read.csv("Task_AllRounds.csv")


# remove unusable data ----------------------------------------------------

basedata2 <- basedata[(taskdata$usable==1),]
taskdata2 <- taskdata[(taskdata$usable==1),]


# calculate % baseline change ---------------------------------------------

change <- (taskdata2[,c(7:32)]-basedata2[,c(7:32)])/basedata2[,c(7:32)]
change <- change*100
info <- taskdata2[,c(1:3)]

data <- cbind(info,change)


# export data as csv ------------------------------------------------------

write.csv(data, file = "SplitStealData_AllRounds.csv")
