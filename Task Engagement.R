
# t test ------------------------------------------------------------------

meanVC.ctrl = mean(VCdata.ctrl$vcvals.1)
meanHR.ctrl = mean(HRdata.ctrl$hrvals.1)
meanVC.reg = mean(VCdata.reg$vcvals.1)
meanHR.reg = mean(HRdata.reg$hrvals.1)
plotmeans <- matrix(c(meanVC.ctrl,meanHR.ctrl,meanVC.reg,meanHR.reg),ncol = 2,nrow = 2)

names <- c("No Regulation", "Regulation")
barplot(plotmeans, names.arg = names, main = "Task Engagement", ylab = "", ylim = c(0,12),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey.colors(2))
title(ylab = "% Baseline Change", cex.lab = 1.2, line = 2.5)
legend("topright", legend = c("VC","HR"), cex = 1, fill = grey.colors(2), inset = .05, bty = "n", y.intersp = 1.5)


# correlation -------------------------------------------------------------

# correlation of VC and HR
EG <- data.frame(VCdata$vcvals.0,HRdata$hrvals.0)
colnames(EG) <- c("VC","HR")
plot(EG, main = "VC vs. HR")
EGCorr <- rcorr(as.matrix(EG), type = c("pearson","spearman"))
EGCorr

# correlation of Smile Auth and Engagement index
zVC <- scale(VCdata$vcvals.0)
zHR <- scale(HRdata$hrvals.0)
unitary <- -zVC + zHR

auth <- TPRdata$authcombined
engagement <- data.frame(auth,unitary)
colnames(engagement) <- c("Smile Auth", "Engagement Index")
plot(engagement, main = "Smile Authenticity vs. Engagement Index")
engCorr <- rcorr(as.matrix(engagement), type = c("pearson","spearman"))
engCorr

engagement <- data.frame(VCdata$subject,VCdata$regulation,VCdata$authcombined,VCdata$vcvals.0,HRdata$hrvals.0)
rmloweng <- subset(engagement,engagement$VCdata.vcvals.0 > 0 | engagement$HRdata.hrvals.0 >0)
colnames(rmloweng) <- c("Subject","Regulation","authcombined","VC","CO")





