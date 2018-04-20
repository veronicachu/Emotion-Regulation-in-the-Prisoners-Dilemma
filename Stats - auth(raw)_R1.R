load("~/R/Split-Steal Project/Working Data/RemovedOutliers_R1_auth(raw).RData")


# Multiple Regression -----------------------------------------------------

condition <- TPRdata$regulation
auth <- TPRdata$authcombined
auth <- scale(auth)

Y <- cbind(TPRdata$tprvals.1,VCdata$vcvals.1,COdata$covals.1)
# Y <- cbind(HRdata$hrvals.1)
fitR1 <- lm(Y ~ condition + auth + condition*auth)
summary(fitR1) # show results
capture.output(summary(fitR1), file="Regression Auth R1.txt")


# Challenge/Threat Index --------------------------------------------------

# correlation of TPR and CO
library(Hmisc)
corr <- data.frame(TPRdata$tprvals.1,COdata$covals.1)
colnames(corr) <- c("TPR","CO")
plot(corr, main = "TPR vs. CO")
CTCorr <- rcorr(as.matrix(corr), type = c("pearson","spearman"))
CTCorr

# calculate unitary index
zTPR <- scale(TPRdata$tprvals.1)
zCO <- scale(COdata$covals.1)
unitaryR1 <- -zTPR + zCO





