load("~/R/Working Data/RemovedOutliers_R1-R4_auth(HL).RData")


# Smile Conditions (Old vs. New) ------------------------------------------

# HRV Means
hrvmeanR1 <- aggregate(HRVdata$hrvvals.1,list(HRVdata$regulation,HRVdata$smile),mean)
hrvmeanR2 <- aggregate(HRVdata$hrvvals.2,list(HRVdata$regulation,HRVdata$smile),mean)
hrvmeanR3 <- aggregate(HRVdata$hrvvals.3,list(HRVdata$regulation,HRVdata$smile),mean)
hrvmeanR4 <- aggregate(HRVdata$hrvvals.4,list(HRVdata$regulation,HRVdata$smile),mean)

hrvmeanR1_wide <- reshape(hrvmeanR1,idvar = "Group.2", v.names = c("x"),
                              timevar = "Group.1",direction = "wide")
hrvmeanR2_wide <- reshape(hrvmeanR2,idvar = "Group.2", v.names = c("x"),
                          timevar = "Group.1",direction = "wide")
hrvmeanR3_wide <- reshape(hrvmeanR3,idvar = "Group.2", v.names = c("x"),
                          timevar = "Group.1",direction = "wide")
hrvmeanR4_wide <- reshape(hrvmeanR4,idvar = "Group.2", v.names = c("x"),
                          timevar = "Group.1",direction = "wide")

# TPR Means
tprmeanR1 <- aggregate(TPRdata$tprvals.1,list(TPRdata$regulation,TPRdata$smile),mean)
tprmeanR2 <- aggregate(TPRdata$tprvals.2,list(TPRdata$regulation,TPRdata$smile),mean)
tprmeanR3 <- aggregate(TPRdata$tprvals.3,list(TPRdata$regulation,TPRdata$smile),mean)
tprmeanR4 <- aggregate(TPRdata$tprvals.4,list(TPRdata$regulation,TPRdata$smile),mean)

tprmeanR1_wide <- reshape(tprmeanR1,idvar = "Group.2", v.names = c("x"),
                              timevar = "Group.1",direction = "wide")
tprmeanR2_wide <- reshape(tprmeanR2,idvar = "Group.2", v.names = c("x"),
                          timevar = "Group.1",direction = "wide")
tprmeanR3_wide <- reshape(tprmeanR3,idvar = "Group.2", v.names = c("x"),
                          timevar = "Group.1",direction = "wide")
tprmeanR4_wide <- reshape(tprmeanR4,idvar = "Group.2", v.names = c("x"),
                          timevar = "Group.1",direction = "wide")

# VC Means
vcmeanR1 <- aggregate(VCdata$vcvals.1,list(VCdata$regulation,VCdata$smile),mean)
vcmeanR2 <- aggregate(VCdata$vcvals.2,list(VCdata$regulation,VCdata$smile),mean)
vcmeanR3 <- aggregate(VCdata$vcvals.3,list(VCdata$regulation,VCdata$smile),mean)
vcmeanR4 <- aggregate(VCdata$vcvals.4,list(VCdata$regulation,VCdata$smile),mean)

vcmeanR1_wide <- reshape(vcmeanR1,idvar = "Group.2", v.names = c("x"),
                             timevar = "Group.1",direction = "wide")
vcmeanR2_wide <- reshape(vcmeanR2,idvar = "Group.2", v.names = c("x"),
                         timevar = "Group.1",direction = "wide")
vcmeanR3_wide <- reshape(vcmeanR3,idvar = "Group.2", v.names = c("x"),
                         timevar = "Group.1",direction = "wide")
vcmeanR4_wide <- reshape(vcmeanR4,idvar = "Group.2", v.names = c("x"),
                         timevar = "Group.1",direction = "wide")

# CO Means
comeanR1 <- aggregate(COdata$covals.1,list(COdata$regulation,COdata$smile),mean)
comeanR2 <- aggregate(COdata$covals.2,list(COdata$regulation,COdata$smile),mean)
comeanR3 <- aggregate(COdata$covals.3,list(COdata$regulation,COdata$smile),mean)
comeanR4 <- aggregate(COdata$covals.4,list(COdata$regulation,COdata$smile),mean)

comeanR1_wide <- reshape(comeanR1,idvar = "Group.2", v.names = c("x"),
                             timevar = "Group.1",direction = "wide")
comeanR2_wide <- reshape(comeanR2,idvar = "Group.2", v.names = c("x"),
                         timevar = "Group.1",direction = "wide")
comeanR3_wide <- reshape(comeanR3,idvar = "Group.2", v.names = c("x"),
                         timevar = "Group.1",direction = "wide")
comeanR4_wide <- reshape(comeanR4,idvar = "Group.2", v.names = c("x"),
                         timevar = "Group.1",direction = "wide")


# Auth Rating Conditions (High vs. Low) -----------------------------------

# HRV Means
hrvmeanR1 <- aggregate(HRVdata$hrvvals.1,list(HRVdata$regulation, HRVdata$auth.rating),mean)
hrvmeanR2 <- aggregate(HRVdata$hrvvals.2,list(HRVdata$regulation, HRVdata$auth.rating),mean)
hrvmeanR3 <- aggregate(HRVdata$hrvvals.3,list(HRVdata$regulation, HRVdata$auth.rating),mean)
hrvmeanR4 <- aggregate(HRVdata$hrvvals.4,list(HRVdata$regulation, HRVdata$auth.rating),mean)

hrvmeanR1_wide <- reshape(hrvmeanR1,idvar = "Group.2", v.names = c("x"),
                             timevar = "Group.1",direction = "wide")
hrvmeanR2_wide <- reshape(hrvmeanR2,idvar = "Group.2", v.names = c("x"),
                          timevar = "Group.1",direction = "wide")
hrvmeanR3_wide <- reshape(hrvmeanR3,idvar = "Group.2", v.names = c("x"),
                          timevar = "Group.1",direction = "wide")
hrvmeanR4_wide <- reshape(hrvmeanR4,idvar = "Group.2", v.names = c("x"),
                          timevar = "Group.1",direction = "wide")

# TPR Means
tprmeanR1 <- aggregate(TPRdata$tprvals.1,list(TPRdata$regulation, TPRdata$auth.rating),mean)
tprmeanR2 <- aggregate(TPRdata$tprvals.2,list(TPRdata$regulation, TPRdata$auth.rating),mean)
tprmeanR3 <- aggregate(TPRdata$tprvals.3,list(TPRdata$regulation, TPRdata$auth.rating),mean)
tprmeanR4 <- aggregate(TPRdata$tprvals.4,list(TPRdata$regulation, TPRdata$auth.rating),mean)

tprmeanR1_wide <- reshape(tprmeanR1,idvar = "Group.2", v.names = c("x"),
                             timevar = "Group.1",direction = "wide")
tprmeanR2_wide <- reshape(tprmeanR2,idvar = "Group.2", v.names = c("x"),
                          timevar = "Group.1",direction = "wide")
tprmeanR3_wide <- reshape(tprmeanR3,idvar = "Group.2", v.names = c("x"),
                          timevar = "Group.1",direction = "wide")
tprmeanR4_wide <- reshape(tprmeanR4,idvar = "Group.2", v.names = c("x"),
                          timevar = "Group.1",direction = "wide")

# VC Means
vcmeanR1 <- aggregate(VCdata$vcvals.1,list(VCdata$regulation, VCdata$auth.rating),mean)
vcmeanR2 <- aggregate(VCdata$vcvals.2,list(VCdata$regulation, VCdata$auth.rating),mean)
vcmeanR3 <- aggregate(VCdata$vcvals.3,list(VCdata$regulation, VCdata$auth.rating),mean)
vcmeanR4 <- aggregate(VCdata$vcvals.4,list(VCdata$regulation, VCdata$auth.rating),mean)

vcmeanR1_wide <- reshape(vcmeanR1,idvar = "Group.2", v.names = c("x"),
                            timevar = "Group.1",direction = "wide")
vcmeanR2_wide <- reshape(vcmeanR2,idvar = "Group.2", v.names = c("x"),
                         timevar = "Group.1",direction = "wide")
vcmeanR3_wide <- reshape(vcmeanR3,idvar = "Group.2", v.names = c("x"),
                         timevar = "Group.1",direction = "wide")
vcmeanR4_wide <- reshape(vcmeanR4,idvar = "Group.2", v.names = c("x"),
                         timevar = "Group.1",direction = "wide")

# CO Means
comeanR1 <- aggregate(COdata$covals.1,list(COdata$regulation, COdata$auth.rating),mean)
comeanR2 <- aggregate(COdata$covals.2,list(COdata$regulation, COdata$auth.rating),mean)
comeanR3 <- aggregate(COdata$covals.3,list(COdata$regulation, COdata$auth.rating),mean)
comeanR4 <- aggregate(COdata$covals.4,list(COdata$regulation, COdata$auth.rating),mean)

comeanR1_wide <- reshape(comeanR1,idvar = "Group.2", v.names = c("x"),
                            timevar = "Group.1",direction = "wide")
comeanR2_wide <- reshape(comeanR2,idvar = "Group.2", v.names = c("x"),
                         timevar = "Group.1",direction = "wide")
comeanR3_wide <- reshape(comeanR3,idvar = "Group.2", v.names = c("x"),
                         timevar = "Group.1",direction = "wide")
comeanR4_wide <- reshape(comeanR4,idvar = "Group.2", v.names = c("x"),
                         timevar = "Group.1",direction = "wide")



