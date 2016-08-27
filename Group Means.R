load("~/R/Working Data/RemovedOutliers_-10_auth(rounded).RData")

# Calculate unitary (TPR + CO) --------------------------------------------

unitary <- (-TPRdata$tprvals.0) + COdata$covals.0
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
