load("~/R/Working Data/RemovedOutliers_R1-R4_auth(cluster).RData")

# Calculate unitary (TPR + CO) --------------------------------------------

zTPR <- scale(TPRdata$tprvals.0)
zCO <- scale(COdata$covals.0)
unitary <- -zTPR + zCO

info <- TPRdata[,1:4]
unitary <- cbind(info,unitary)

# Calculate Mean ----------------------------------------------------------

# Regulation vs. Smile
VCmean <- aggregate(VCdata$vcvals.0,list(VCdata$regulation,VCdata$smile),mean)
unimean <- aggregate(unitary$unitary,list(unitary$regulation,unitary$smile),mean)

# Regulation vs. Auth (H/L)
VCmean <- aggregate(VCdata$vcvals.0,list(VCdata$regulation,VCdata$auth.rating),mean)
unimean <- aggregate(unitary$unitary,list(unitary$regulation,unitary$auth.rating),mean)

# Regulation vs. Auth (raw)
VCmean <- aggregate(VCdata$vcvals.0,list(VCdata$regulation,VCdata$authcombined),mean)
unimean <- aggregate(unitary$unitary,list(unitary$regulation,unitary$authcombined),mean)

# Regulation vs. Auth (cluster)
TPRmean <- aggregate(TPRdata$tprvals.1,list(TPRdata$regulation,TPRdata$cluster),mean)
VCmean <- aggregate(VCdata$vcvals.1,list(VCdata$regulation,VCdata$cluster),mean)
COmean <- aggregate(COdata$covals.1,list(COdata$regulation,COdata$cluster),mean)
