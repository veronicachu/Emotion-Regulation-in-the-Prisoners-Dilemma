load("~/R/Split-Steal Project/Working Data/RemovedOutliers_R1_auth(cluster).RData")


# Task Engagement ---------------------------------------------------------

# one sample t-test to check above 0
VCdata.ctrl <- subset(VCdata, VCdata$regulation == "Control")
VCdata.reg <- subset(VCdata, VCdata$regulation == "Regulation")
HRdata.ctrl <- subset(HRdata, HRdata$regulation == "Control")
HRdata.reg <- subset(HRdata, HRdata$regulation == "Regulation")

t.test(VCdata.ctrl$vcvals.1)
t.test(VCdata.reg$vcvals.1)
t.test(HRdata.ctrl$hrvals.1)
t.test(HRdata.reg$hrvals.1)

# subset regulation x smile
VCdata.ctrlamused <- subset(VCdata, VCdata$regulation == "Control" & VCdata$cluster == 2)
HRdata.ctrlamused <- subset(HRdata, HRdata$regulation == "Control" & HRdata$cluster == 2)

VCdata.ctrlpolite <- subset(VCdata, VCdata$regulation == "Control" & VCdata$cluster == 1)
HRdata.ctrlpolite <- subset(HRdata, HRdata$regulation == "Control" & HRdata$cluster == 1)

VCdata.regamused <- subset(VCdata, VCdata$regulation == "Regulation" & VCdata$cluster == 2)
HRdata.regamused <- subset(HRdata, HRdata$regulation == "Regulation" & HRdata$cluster == 2)

VCdata.regpolite <- subset(VCdata, VCdata$regulation == "Regulation" & VCdata$cluster == 1)
HRdata.regpolite <- subset(HRdata, HRdata$regulation == "Regulation" & HRdata$cluster == 1)

# run t-test
t.test(VCdata.ctrlamused$vcvals.1)
t.test(HRdata.ctrlamused$hrvals.1)

t.test(VCdata.ctrlpolite$vcvals.1)
t.test(HRdata.ctrlpolite$hrvals.1)

t.test(VCdata.regamused$vcvals.1)
t.test(HRdata.regamused$hrvals.1)

t.test(VCdata.regpolite$vcvals.1)
t.test(HRdata.regpolite$hrvals.1)


# MANOVA ------------------------------------------------------------------
condition <- TPRdata$regulation
auth <- TPRdata$auth.rating
cluster <- TPRdata$cluster
#gender <- TPRdata$gender

# Round 1
Y <- cbind(TPRdata$tprvals.1,VCdata$vcvals.1,COdata$covals.1)
manovaResults_R1 <- manova(Y ~ condition*cluster)
summary(manovaResults_R1)
capture.output(summary(manovaResults_R1), file="MANOVA Reg vs Cluster_Round 1.txt")

# library(car)
# manovaResults_R1 <- Manova(lm(Y ~ condition*cluster + condition + cluster),type = "III")
# capture.output(print(manovaResults_R1), file="MANOVA Reg vs Cluster_Round 1.txt")

# Round #
# Y <- cbind(TPRdata$tprvals.4,VCdata$vcvals.4,COdata$covals.4)
# manovaResults_R1 <- manova(Y ~ condition*cluster)
# summary(manovaResults_R1)
# capture.output(summary(manovaResults_R1), file="MANOVA Reg vs Cluster_Round 4.txt")


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

# t-test -- reg only
unidata.ctrl <- subset(unitaryR1, TPRdata$regulation == "Control")
unidata.reg <- subset(unitaryR1, TPRdata$regulation == "Regulation")
t.test(unidata.ctrl,unidata.reg)

# anova -- reg vs. cluster
condition <- TPRdata$regulation
cluster <- TPRdata$cluster
anovaUnidata <- aov(unitaryR1 ~ condition*cluster)
summary(anovaUnidata)













