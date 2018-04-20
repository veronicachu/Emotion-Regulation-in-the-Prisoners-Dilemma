setwd("~/R")
data = read.csv("SplitStealData_-10_auth(HL).csv")
info <- data[,c(2:6)]

# create new dataframe with only HRV, TPR, PEP, and CO data ---------------
hrvals <- data$hr
HRdata <- cbind(info,hrvals)

tprvals <- data$tpr
TPRdata <- cbind(info,tprvals)

vcvals <- -(data$pep)
VCdata <- cbind(info,vcvals)

covals <- data$co
COdata <- cbind(info,covals)

# reshape data for analysis -----------------------------------------------
HRdata <- reshape(HRdata,idvar = "subject", v.names = c("hrvals"),
                   timevar = "time",direction = "wide")
HRdata <- HRdata[,1:8]
HRdata <- na.omit(HRdata)

TPRdata <- reshape(TPRdata,idvar = "subject", v.names = c("tprvals"),
                   timevar = "time",direction = "wide")
TPRdata <- TPRdata[,1:8]
TPRdata <- na.omit(TPRdata)

VCdata <- reshape(VCdata,idvar = "subject", v.names = c("vcvals"),
                  timevar = "time",direction = "wide")
VCdata <- VCdata[,1:8]
VCdata <- na.omit(VCdata)

COdata <- reshape(COdata,idvar = "subject", v.names = c("covals"),
                  timevar = "time",direction = "wide")
COdata <- COdata[,1:8]
COdata <- na.omit(COdata)

# winsorize data by each time point ---------------------------------------

library(robustHD)

for (i in 5:ncol(COdata)){
    HRdata[,i] <- winsorize(HRdata[,i])
    TPRdata[,i] <- winsorize(TPRdata[,i])
    VCdata[,i] <- winsorize(VCdata[,i])
    COdata[,i] <- winsorize(COdata[,i])
}

rm(data,info,covals,hrvals,i,tprvals,vcvals)

# remove outliers using 3 sd rule -----------------------------------------

t = 3

tprmean <- aggregate(TPRdata[,5],list(TPRdata$regulation,TPRdata$smile),mean)
tprsd <- aggregate(TPRdata[,5],list(TPRdata$regulation,TPRdata$smile),sd)
tprout1 <- tprmean$x - tprsd$x*t
tprout2 <- tprmean$x + tprsd$x*t

for (i in 1:4){
    tprrem <- ifelse(TPRdata$tprvals >= tprout1[i] & TPRdata$tprvals <= tprout2[i], FALSE, TRUE)
    remove <- which(tprrem,arr.ind = TRUE)
    TPRdata$tprvals[remove] <- NA
}

TPRdata <- na.omit(TPRdata)

vcmean <- aggregate(VCdata[,5],list(VCdata$regulation,VCdata$smile),mean)
vcsd <- aggregate(VCdata[,5],list(VCdata$regulation,VCdata$smile),sd)
vcout1 <- vcmean$x - vcsd$x*t
vcout2 <- vcmean$x + vcsd$x*t

for (i in 1:4){
    vcrem <- ifelse(VCdata$pepvals >= vcout1[i] & VCdata$vcvals <= vcout2[i], FALSE, TRUE)
    remove <- which(vcrem,arr.ind = TRUE)
    VCdata$vcvals[remove] <- NA
}

VCdata <- na.omit(VCdata)

comean <- aggregate(COdata[,5],list(COdata$regulation,COdata$smile),mean)
cosd <- aggregate(COdata[,5],list(COdata$regulation,COdata$smile),sd)
coout1 <- comean$x - cosd$x*t
coout2 <- comean$x + cosd$x*t

for (i in 1:4){
    corem <- ifelse(COdata$covals >= coout1[i] & COdata$covals <= coout2[i], FALSE, TRUE)
    remove <- which(corem,arr.ind = TRUE)
    COdata$covals[remove] <- NA
}

COdata <- na.omit(COdata)

# save outlier removed data- ----------------------------------------------







