load("~/R/Split-Steal Project/Working Data/RemovedOutliers_R1_auth(raw).RData")

# Group Data --------------------------------------------------------------

TPRdata.ctrl <- subset(TPRdata, TPRdata$regulation == "Control")
TPRdata.reg <- subset(TPRdata, TPRdata$regulation == "Regulation")
VCdata.ctrl <- subset(VCdata, VCdata$regulation == "Control")
VCdata.reg <- subset(VCdata, VCdata$regulation == "Regulation")
COdata.ctrl <- subset(COdata, COdata$regulation == "Control")
COdata.reg <- subset(COdata, COdata$regulation == "Regulation")

# Find means --------------------------------------------------------------

mTPRctrl <- mean(TPRdata.ctrl$tprvals.1)
mTPRreg <- mean(TPRdata.reg$tprvals.1)
mVCctrl <- mean(VCdata.ctrl$vcvals.1)
mVCreg <- mean(VCdata.reg$vcvals.1)
mCOctrl <- mean(COdata.ctrl$covals.1)
mCOreg <- mean(COdata.reg$covals.1)

# Create barplot ----------------------------------------------------------

# TPR, VC, CO
names <- c("No Regulation","Regulation")
meansmat <- matrix(c(mTPRctrl,mVCctrl,mCOctrl,mTPRreg,mVCreg,mCOreg),nrow = 3,ncol = 2)

barplot(meansmat, names.arg = names, main = "Challenge/Threat Measures", ylab = "", ylim = c(-15,22),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey.colors(3))
title(ylab = "% Baseline Change", cex.lab = 1.2, line = 2.5)
legend("topright", legend = c("TPR","VC","CO"), cex = 1.2, fill = grey.colors(3))

# Challenge/Threat Unitary
unidata.ctrl <- subset(unitaryR1, TPRdata$regulation == "Control")
unidata.reg <- subset(unitaryR1, TPRdata$regulation == "Regulation")
munictrl <- mean(unidata.ctrl)
munireg <- mean(unidata.reg)

barplot(matrix(c(munictrl,munireg)), names.arg = names, main = "Challenge/Threat Index", ylab = "", ylim = c(-.5,.5),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey(0.7))
title(ylab = "Index Value", cex.lab = 1.2, line = 2.5)



