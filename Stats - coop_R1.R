load("~/R/Working Data/RemovedOutliers_R1_coopR2-R3.RData")


# Task Engagement ---------------------------------------------------------

# one sample t-test to check above 0
VCdata.ctrl <- subset(VCdata, VCdata$regulation == "Control")
VCdata.reg <- subset(VCdata, VCdata$regulation == "Regulation")
HRdata.ctrl <- subset(HRdata, HRdata$regulation == "Control")
HRdata.reg <- subset(HRdata, HRdata$regulation == "Regulation")

t.test(VCdata.ctrl$vcvals.1)
t.test(HRdata.ctrl$hrvals.1)

t.test(VCdata.reg$vcvals.1)
t.test(HRdata.reg$hrvals.1)

# Challenge/Threat Index --------------------------------------------------

# calculate unitary index
zTPR <- scale(TPRdata$tprvals.1)
zCO <- scale(COdata$covals.1)
unitaryR1 <- -zTPR + zCO

# correlation of TPR and CO
library(Hmisc)
coop <- TPRdata$coop

corr <- data.frame(coop,unitaryR1)
colnames(corr) <- c("Coop","Unitary")
plot(corr, main = "Coop vs. Unitary")
CTCorr <- rcorr(as.matrix(corr), type = c("pearson","spearman"))
CTCorr





















