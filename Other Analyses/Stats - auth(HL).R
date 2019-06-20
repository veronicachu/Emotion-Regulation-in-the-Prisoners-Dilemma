load("~/R/Working Data/RemovedOutliers_-10_auth(HL).RData")

# Calculate unitary (TPR + CO) --------------------------------------------

zTPR <- scale(TPRdata$tprvals.0)
zCO <- scale(COdata$covals.0)
unitary <- -zTPR + zCO

# one sample t-test -------------------------------------------------------

# check above baseline
VCdata.ctrl <- subset(VCdata, VCdata$regulation == "Control")
VCdata.reg <- subset(VCdata, VCdata$regulation == "Regulation")
HRdata.ctrl <- subset(HRdata, HRdata$regulation == "Control")
HRdata.reg <- subset(HRdata, HRdata$regulation == "Regulation")

t.test(VCdata.ctrl$vcvals.0)
t.test(VCdata.reg$vcvals.0)

t.test(HRdata.ctrl$hrvals.0)
t.test(HRdata.reg$hrvals.0)

# ANOVA -------------------------------------------------------------------
condition <- TPRdata$regulation
smile <- TPRdata$smile
auth <- TPRdata$auth.rating

VCANOVA <- aov(VCdata$vcvals.0~condition*auth)
summary(VCANOVA)
capture.output(summary(VCANOVA), file="VC ANOVA - auth.txt")

uniANOVA <- aov(unitaryR1~condition*auth)
summary(uniANOVA)
capture.output(summary(uniANOVA), file="Unitary ANOVA - auth.txt")

# Effect Sizes ------------------------------------------------------------
library(lsr)

effectTPRANOVA <- etaSquared(TPRANOVA)
capture.output(effectTPRANOVA, file = "TPR Effect Size (10 sec).txt")

effectVCANOVA <- etaSquared(VCANOVA)
capture.output(effectVCANOVA, file = "VC Effect Size (5 sec).txt")

effectCOANOVA <- etaSquared(COANOVA)
capture.output(effectCOANOVA, file = "CO Effect Size (10 sec).txt")

# MANOVA ------------------------------------------------------------------
condition <- TPRdata$regulation
smile <- TPRdata$smile
auth <- TPRdata$auth.rating

# TPR, VC, and CO
Y <- cbind(TPRdata$tprvals.0,VCdata$vcvals.0,COdata$covals.0)
manovaResults <- manova(Y ~ condition*auth)
summary(manovaResults)
capture.output(summary(manovaResults), file="TPR-VC-CO MANOVA.txt")

# VC and unitary
manovaResults <- manova(Y ~ condition*auth)
summary(manovaResults)
capture.output(summary(manovaResults), file="VC-Unitary MANOVA - auth.txt")






