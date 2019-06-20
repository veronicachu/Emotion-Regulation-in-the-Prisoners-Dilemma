load("~/R/Working Data/RemovedOutliers_-10_auth(raw).RData")

# Calculate unitary (TPR + CO) --------------------------------------------

zTPR <- scale(TPRdata$tprvals.0)
zCO <- scale(COdata$covals.0)
unitary <- -zTPR + zCO

# Correlation -------------------------------------------------------------
library(Hmisc)

# correlation of TPR and CO
CT <- data.frame(TPRdata$tprvals.0,COdata$covals.0)
colnames(CT) <- c("TPR","CO")
plot(CT, main = "TPR vs. CO")
CTCorr <- rcorr(as.matrix(CT), type = c("pearson","spearman"))
CTCorr

# Multiple Regression -----------------------------------------------------

condition <- TPRdata$regulation
smile <- TPRdata$smile

auth <- TPRdata$authcombined
auth <- scale(auth)

Y <- cbind(TPRdata$tprvals.0,VCdata$vcvals.0,COdata$covals.0)
Y <- cbind(VCdata$vcvals.0,unitary)
fit <- lm(Y ~ condition + auth + condition*auth)
summary(fit) # show results
capture.output(summary(fit), file="Regression Auth.txt")
