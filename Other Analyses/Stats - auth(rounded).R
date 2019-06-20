load("~/R/Working Data/RemovedOutliers_-10_auth(rounded).RData")


# Remove from analysis ----------------------------------------------------

TPRdata <- subset(TPRdata, TPRdata$authcombined > "3")
VCdata <- subset(VCdata, VCdata$authcombined > "3")
COdata <- subset(COdata, COdata$authcombined > "3")

# Calculate unitary (TPR + CO) --------------------------------------------

unitary <- (-TPRdata$tprvals.0) + COdata$covals.0

# ANOVA -------------------------------------------------------------------
condition <- TPRdata$regulation
smile <- TPRdata$smile
auth <- TPRdata$auth.rating

VCANOVA <- aov(VCdata$vcvals.0~condition*auth)
summary(VCANOVA)
capture.output(summary(VCANOVA), file="VC ANOVA - auth(rounded).txt")

uniANOVA <- aov(unitary~condition*auth)
summary(uniANOVA)
capture.output(summary(uniANOVA), file="Unitary ANOVA - auth(rounded).txt")

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
manovaResults <- manova(Y ~ condition*smile)
summary(manovaResults)
capture.output(summary(manovaResults), file="TPR-VC-CO MANOVA.txt")

# VC and unitary
manovaResults <- manova(Y ~ condition*auth)
summary(manovaResults)
capture.output(summary(manovaResults), file="VC-Unitary MANOVA - auth(rounded).txt")






