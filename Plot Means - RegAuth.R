load("~/R/Working Data/RemovedOutliers_R1_auth(HL).RData")

# Group Data --------------------------------------------------------------

TPRdata.ctrlH <- subset(TPRdata, TPRdata$regulation == "Control" & TPRdata$auth.rating == "high")
TPRdata.ctrlL <- subset(TPRdata, TPRdata$regulation == "Control" & TPRdata$auth.rating == "low")
TPRdata.regH <- subset(TPRdata, TPRdata$regulation == "Regulation" & TPRdata$auth.rating == "high")
TPRdata.regL <- subset(TPRdata, TPRdata$regulation == "Regulation" & TPRdata$auth.rating == "low")

VCdata.ctrlH <- subset(VCdata, VCdata$regulation == "Control" & VCdata$auth.rating == "high")
VCdata.ctrlL <- subset(VCdata, VCdata$regulation == "Control" & VCdata$auth.rating == "low")
VCdata.regH <- subset(VCdata, VCdata$regulation == "Regulation" & VCdata$auth.rating == "high")
VCdata.regL <- subset(VCdata, VCdata$regulation == "Regulation" & VCdata$auth.rating == "low")

COdata.ctrlH <- subset(COdata, COdata$regulation == "Control" & COdata$auth.rating == "high")
COdata.ctrlL <- subset(COdata, COdata$regulation == "Control" & COdata$auth.rating == "low")
COdata.regH <- subset(COdata, COdata$regulation == "Regulation"& COdata$auth.rating == "high")
COdata.regL <- subset(COdata, COdata$regulation == "Regulation"& COdata$auth.rating == "low")

# Find means --------------------------------------------------------------

mTPRctrlH <- mean(TPRdata.ctrlH$tprvals.1)
mTPRctrlL <- mean(TPRdata.ctrlL$tprvals.1)
mTPRregH <- mean(TPRdata.regH$tprvals.1)
mTPRregL <- mean(TPRdata.regL$tprvals.1)

mVCctrlH <- mean(VCdata.ctrlH$vcvals.1)
mVCctrlL <- mean(VCdata.ctrlL$vcvals.1)
mVCregH <- mean(VCdata.regH$vcvals.1)
mVCregL <- mean(VCdata.regL$vcvals.1)

mCOctrlH <- mean(COdata.ctrlH$covals.1)
mCOctrlL <- mean(COdata.ctrlL$covals.1)
mCOregH <- mean(COdata.regH$covals.1)
mCOregL <- mean(COdata.regL$covals.1)

# Create barplot ----------------------------------------------------------

# TPR, VC, CO
names <- c("NR-Low","NR-High","R-Low","R-High")
meansmat <- matrix(c(mTPRctrlL,mVCctrlL,mCOctrlL,
                     mTPRctrlH,mVCctrlH,mCOctrlH,
                     mTPRregL,mVCregL,mCOregL,
                     mTPRregH,mVCregH,mCOregH),
                   nrow = 3,ncol = 4)

barplot(meansmat, names.arg = names, main = "Challenge/Threat Measures", ylab = "", ylim = c(-15,25),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey.colors(3))
title(ylab = "% Baseline Change", cex.lab = 1.2, line = 2.5)
legend("topright", legend = c("TPR","VC","CO"), cex = 1.2, fill = grey.colors(3))

# Challenge/Threat Unitary
unidata.ctrlH <- subset(unitaryR1, TPRdata$regulation == "Control" & TPRdata$auth.rating == "high")
unidata.ctrlL <- subset(unitaryR1, TPRdata$regulation == "Control" & TPRdata$auth.rating == "low")
unidata.regH <- subset(unitaryR1, TPRdata$regulation == "Regulation" & TPRdata$auth.rating == "high")
unidata.regL <- subset(unitaryR1, TPRdata$regulation == "Regulation" & TPRdata$auth.rating == "low")

munictrlH <- mean(unidata.ctrlH)
munictrlL <- mean(unidata.ctrlL)
muniregH <- mean(unidata.regH)
muniregL <- mean(unidata.regL)

barplot(matrix(c(munictrlL,munictrlH,muniregL,muniregH)), names.arg = names, main = "Challenge/Threat Index", ylab = "", ylim = c(-.5,.5),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey(0.6))
title(ylab = "Index Value", cex.lab = 1.2, line = 2.5)










