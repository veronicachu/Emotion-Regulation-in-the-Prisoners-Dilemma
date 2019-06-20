load("~/R/Split-Steal Project/Working Data/RemovedOutliers_R1_auth(cluster).RData")

# Group Data --------------------------------------------------------------

TPRdata.ctrl1 <- subset(TPRdata, TPRdata$regulation == "Control" & TPRdata$cluster == "1")
TPRdata.ctrl2 <- subset(TPRdata, TPRdata$regulation == "Control" & TPRdata$cluster == "2")
TPRdata.reg1 <- subset(TPRdata, TPRdata$regulation == "Regulation" & TPRdata$cluster == "1")
TPRdata.reg2 <- subset(TPRdata, TPRdata$regulation == "Regulation" & TPRdata$cluster == "2")

VCdata.ctrl1 <- subset(VCdata, TPRdata$regulation == "Control" & TPRdata$cluster == "1")
VCdata.ctrl2 <- subset(VCdata, TPRdata$regulation == "Control" & TPRdata$cluster == "2")
VCdata.reg1 <- subset(VCdata, TPRdata$regulation == "Regulation" & TPRdata$cluster == "1")
VCdata.reg2 <- subset(VCdata, TPRdata$regulation == "Regulation" & TPRdata$cluster == "2")

COdata.ctrl1 <- subset(COdata, TPRdata$regulation == "Control" & TPRdata$cluster == "1")
COdata.ctrl2 <- subset(COdata, TPRdata$regulation == "Control" & TPRdata$cluster == "2")
COdata.reg1 <- subset(COdata, TPRdata$regulation == "Regulation" & TPRdata$cluster == "1")
COdata.reg2 <- subset(COdata, TPRdata$regulation == "Regulation" & TPRdata$cluster == "2")

# Find means --------------------------------------------------------------

mTPRctrl1 <- mean(TPRdata.ctrl1$tprvals.1)
mTPRctrl2 <- mean(TPRdata.ctrl2$tprvals.1)
mTPRreg1 <- mean(TPRdata.reg1$tprvals.1)
mTPRreg2 <- mean(TPRdata.reg2$tprvals.1)

mVCctrl1 <- mean(VCdata.ctrl1$vcvals.1)
mVCctrl2 <- mean(VCdata.ctrl2$vcvals.1)
mVCreg1 <- mean(VCdata.reg1$vcvals.1)
mVCreg2 <- mean(VCdata.reg2$vcvals.1)

mCOctrl1 <- mean(COdata.ctrl1$covals.1)
mCOctrl2 <- mean(COdata.ctrl2$covals.1)
mCOreg1 <- mean(COdata.reg1$covals.1)
mCOreg2 <- mean(COdata.reg2$covals.1)

# Create barplot ----------------------------------------------------------

# TPR, VC, CO
names <- c("No Reg-Polite","No Reg-Amused","Reg-Polite","Reg-Amused")
meansmat <- matrix(c(mTPRctrl1,mVCctrl1,mCOctrl1,
                     mTPRctrl2,mVCctrl2,mCOctrl2,
                     mTPRreg1,mVCreg1,mCOreg1,
                     mTPRreg2,mVCreg2,mCOreg2),
                   nrow = 3,ncol = 4)

barplot(meansmat, names.arg = names, main = "Challenge/Threat Measures", ylab = "", ylim = c(-15,25),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey.colors(3))
title(ylab = "% Baseline Change", cex.lab = 1.2, line = 2.5)
legend("topright", legend = c("TPR","VC","CO"), cex = 1.2, fill = grey.colors(3))

# Challenge/Threat Unitary
unidata.ctrl1 <- subset(unitaryR1, TPRdata$regulation == "Control" & TPRdata$cluster == "1")
unidata.ctrl2 <- subset(unitaryR1, TPRdata$regulation == "Control" & TPRdata$cluster == "2")
unidata.reg1 <- subset(unitaryR1, TPRdata$regulation == "Regulation" & TPRdata$cluster == "1")
unidata.reg2 <- subset(unitaryR1, TPRdata$regulation == "Regulation" & TPRdata$cluster == "2")

munictrl1 <- mean(unidata.ctrl1)
munictrl2 <- mean(unidata.ctrl2)
munireg1 <- mean(unidata.reg1)
munireg2 <- mean(unidata.reg2)

barplot(matrix(c(munictrl1,munictrl2,munireg1,munireg2)), names.arg = names, main = "Challenge/Threat Index", ylab = "", ylim = c(-1,1),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey(0.7))
title(ylab = "Index Value", cex.lab = 1.2, line = 2.5)





# unidata.ctrl <- subset(unitaryR1, TPRdata$regulation == "Control")
# unidata.reg <- subset(unitaryR1, TPRdata$regulation == "Regulation")
# munictrl <- mean(unidata.ctrl)
# munireg <- mean(unidata.reg)
# barplot(matrix(c(munictrl,munireg)), names.arg = names, main = "Challenge/Threat Index", ylab = "", ylim = c(-1,1),
#         cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey(0.7))
# title(ylab = "Index Value", cex.lab = 1.2, line = 2.5)














