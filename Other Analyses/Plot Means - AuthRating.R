load("~/R/Working Data/MeanAuth(HighLow)_-10.RData")


# Plot Values Immediately After Onset -------------------------------------

names <- c("Control","Regulation")

barplot(as.matrix(hrvmeanAfter_wide[2:1,2:3]), names.arg = names, main = "HRV", ylab = "", ylim = c(-40,70),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey.colors(2))
title(ylab = "% Baseline Change", cex.lab = 1.2, line = 2.5)
legend("topright", legend = c("Low Rating","High Rating"), cex = 1.2, fill = grey.colors(2))

barplot(as.matrix(tprmeanAfter_wide[2:1,2:3]), names.arg = names, main = "TPR", ylab = "", ylim = c(-15,10),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey.colors(2))
title(ylab = "% Baseline Change", cex.lab = 1.2, line = 2.5)
legend("topright", legend = c("Low Rating","High Rating"), cex = 1.2, fill = grey.colors(2))

barplot(as.matrix(vcmeanAfter_wide[2:1,2:3]), names.arg = names, main = "VC", ylab = "", ylim = c(-5,15),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey.colors(2))
title(ylab = "% Baseline Change", cex.lab = 1.2, line = 2.5)
legend("topright", legend = c("Low Rating","High Rating"), cex = 1.2, fill = grey.colors(2))

barplot(as.matrix(comeanAfter_wide[2:1,2:3]), names.arg = names, main = "CO", ylab = "", ylim = c(0,20),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey.colors(2))
title(ylab = "% Baseline Change", cex.lab = 1.2, line = 2.5)
legend("topright", legend = c("Low Rating","High Rating"), cex = 1.2, fill = grey.colors(2))

# Plot (After onset - Before onset) ---------------------------------------

barplot(as.matrix(meanhrvdiff_wide[2:1,2:3]), names.arg = names, main = "HRV", ylab = "", ylim = c(-30,120),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey.colors(2))
title(ylab = "?? (After Onset - Before Onset)", cex.lab = 1.2, line = 2.5)
legend("topright", legend = c("Low Rating","High Rating"), cex = 1.2, fill = grey.colors(2))

barplot(as.matrix(meantprdiff_wide[2:1,2:3]), names.arg = names, main = "TPR", ylab = "", ylim = c(-5,5),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey.colors(2))
title(ylab = "?? (After Onset - Before Onset)", cex.lab = 1.2, line = 2.5)
legend("topright", legend = c("Low Rating","High Rating"), cex = 1.2, fill = grey.colors(2))

barplot(as.matrix(meanvcdiff_wide[2:1,2:3]), names.arg = names, main = "VC", ylab = "", ylim = c(-5,5),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey.colors(2))
title(ylab = "?? (After Onset - Before Onset)", cex.lab = 1.2, line = 2.5)
legend("topright", legend = c("Low Rating","High Rating"), cex = 1.2, fill = grey.colors(2))

barplot(as.matrix(meancodiff_wide[2:1,2:3]), names.arg = names, main = "CO", ylab = "", ylim = c(0,10),
        cex.names = 1.2, cex.main = 1.2, beside = TRUE, col = grey.colors(2))
title(ylab = "?? (After Onset - Before Onset)", cex.lab = 1.2, line = 2.5)
legend("topright", legend = c("Low Rating","High Rating"), cex = 1.2, fill = grey.colors(2))

# Create difference table -------------------------------------------------

table <- data.frame(meantprdiff[,1:2],
                    round(tprmeanBefore[,3], digits = 2), round(tprmeanAfter[,3], digits = 2), round(meantprdiff[,3], digits = 2),
                    round(vcmeanBefore[,3], digits = 2), round(vcmeanAfter[,3], digits = 2), round(meanvcdiff[,3], digits = 2),
                    round(comeanBefore[,3], digits = 2), round(comeanAfter[,3], digits = 2), round(meancodiff[,3], digits = 2))
colnames(table) <-c("Regulation", "Auth Rating",
                    "TPR before onset","TPR after onset","TPR difference",
                    "VC before onset","VC after onset","VC difference",
                    "CO before onset","CO after onset","CO difference")

library(gridExtra)
grid.table(table)
dev.off()
