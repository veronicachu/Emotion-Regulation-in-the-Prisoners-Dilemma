load("~/R/Working Data/RemovedOutliers_-10_auth(HL).RData")


# Smile Conditions (Old vs. New) ------------------------------------------

# Mean before onset

hrvmeanBefore <- aggregate(HRVdata$`hrvvals.-10`,list(HRVdata$regulation,HRVdata$smile),mean)
tprmeanBefore <- aggregate(TPRdata$`tprvals.-10`,list(TPRdata$regulation,TPRdata$smile),mean)
vcmeanBefore <- aggregate(VCdata$`vcvals.-10`,list(VCdata$regulation,VCdata$smile),mean)
comeanBefore <- aggregate(COdata$`covals.-10`,list(COdata$regulation,COdata$smile),mean)

hrvmeanBefore_wide <- reshape(hrvmeanBefore,idvar = "Group.2", v.names = c("x"),
                              timevar = "Group.1",direction = "wide")
tprmeanBefore_wide <- reshape(tprmeanBefore,idvar = "Group.2", v.names = c("x"),
                              timevar = "Group.1",direction = "wide")
vcmeanBefore_wide <- reshape(vcmeanBefore,idvar = "Group.2", v.names = c("x"),
                             timevar = "Group.1",direction = "wide")
comeanBefore_wide <- reshape(comeanBefore,idvar = "Group.2", v.names = c("x"),
                             timevar = "Group.1",direction = "wide")

# Mean after onset

hrvmeanAfter <- aggregate(HRVdata$hrvvals.0,list(HRVdata$regulation,HRVdata$smile),mean)
tprmeanAfter <- aggregate(TPRdata$tprvals.0,list(TPRdata$regulation,TPRdata$smile),mean)
vcmeanAfter <- aggregate(VCdata$vcvals.0,list(VCdata$regulation,VCdata$smile),mean)
comeanAfter <- aggregate(COdata$covals.0,list(COdata$regulation,COdata$smile),mean)

hrvmeanAfter_wide <- reshape(hrvmeanAfter,idvar = "Group.2", v.names = c("x"),
                             timevar = "Group.1",direction = "wide")
tprmeanAfter_wide <- reshape(tprmeanAfter,idvar = "Group.2", v.names = c("x"),
                             timevar = "Group.1",direction = "wide")
vcmeanAfter_wide <- reshape(vcmeanAfter,idvar = "Group.2", v.names = c("x"),
                            timevar = "Group.1",direction = "wide")
comeanAfter_wide <- reshape(comeanAfter,idvar = "Group.2", v.names = c("x"),
                            timevar = "Group.1",direction = "wide")

# Mean (After onset - Before onset)

hrvdiff <- HRVdata$hrvvals.0 - HRVdata$`hrvvals.-10`
tprdiff <- TPRdata$tprvals.0 - TPRdata$`tprvals.-10`
vcdiff <- VCdata$vcvals.0 - VCdata$`vcvals.-10`
codiff <- COdata$covals.0 - COdata$`covals.-10`

meanhrvdiff <- aggregate(hrvdiff,list(HRVdata$regulation,HRVdata$smile),mean)
meantprdiff <- aggregate(tprdiff,list(TPRdata$regulation,TPRdata$smile),mean)
meanvcdiff <- aggregate(vcdiff,list(VCdata$regulation,VCdata$smile),mean)
meancodiff <- aggregate(codiff,list(COdata$regulation,COdata$smile),mean)

meanhrvdiff_wide <- reshape(meanhrvdiff,idvar = "Group.2", v.names = c("x"),
                            timevar = "Group.1",direction = "wide")
meantprdiff_wide <- reshape(meantprdiff,idvar = "Group.2", v.names = c("x"),
                            timevar = "Group.1",direction = "wide")
meanvcdiff_wide <- reshape(meanvcdiff,idvar = "Group.2", v.names = c("x"),
                           timevar = "Group.1",direction = "wide")
meancodiff_wide <- reshape(meancodiff,idvar = "Group.2", v.names = c("x"),
                           timevar = "Group.1",direction = "wide")


# Auth Rating Conditions (High vs. Low) -----------------------------------

# Mean before onset
hrvmeanBefore <- aggregate(HRVdata$`hrvvals.-10`,list(HRVdata$regulation, HRVdata$auth.rating),mean)
tprmeanBefore <- aggregate(TPRdata$`tprvals.-10`,list(TPRdata$regulation, TPRdata$auth.rating),mean)
vcmeanBefore <- aggregate(VCdata$`vcvals.-10`,list(VCdata$regulation, VCdata$auth.rating),mean)
comeanBefore <- aggregate(COdata$`covals.-10`,list(COdata$regulation, COdata$auth.rating),mean)

hrvmeanBefore_wide <- reshape(hrvmeanBefore,idvar = "Group.2", v.names = c("x"),
                              timevar = "Group.1",direction = "wide")
tprmeanBefore_wide <- reshape(tprmeanBefore,idvar = "Group.2", v.names = c("x"),
                              timevar = "Group.1",direction = "wide")
vcmeanBefore_wide <- reshape(vcmeanBefore,idvar = "Group.2", v.names = c("x"),
                             timevar = "Group.1",direction = "wide")
comeanBefore_wide <- reshape(comeanBefore,idvar = "Group.2", v.names = c("x"),
                             timevar = "Group.1",direction = "wide")

# Mean after onset
hrvmeanAfter <- aggregate(HRVdata$hrvvals.0,list(HRVdata$regulation, HRVdata$auth.rating),mean)
tprmeanAfter <- aggregate(TPRdata$tprvals.0,list(TPRdata$regulation, TPRdata$auth.rating),mean)
vcmeanAfter <- aggregate(VCdata$vcvals.0,list(VCdata$regulation, VCdata$auth.rating),mean)
comeanAfter <- aggregate(COdata$covals.0,list(COdata$regulation, COdata$auth.rating),mean)

hrvmeanAfter_wide <- reshape(hrvmeanAfter,idvar = "Group.2", v.names = c("x"),
                             timevar = "Group.1",direction = "wide")
tprmeanAfter_wide <- reshape(tprmeanAfter,idvar = "Group.2", v.names = c("x"),
                             timevar = "Group.1",direction = "wide")
vcmeanAfter_wide <- reshape(vcmeanAfter,idvar = "Group.2", v.names = c("x"),
                            timevar = "Group.1",direction = "wide")
comeanAfter_wide <- reshape(comeanAfter,idvar = "Group.2", v.names = c("x"),
                            timevar = "Group.1",direction = "wide")

# Mean (After onset - Before onset)
hrvdiff <- HRVdata$hrvvals.0 - HRVdata$`hrvvals.-10`
tprdiff <- TPRdata$tprvals.0 - TPRdata$`tprvals.-10`
vcdiff <- VCdata$vcvals.0 - VCdata$`vcvals.-10`
codiff <- COdata$covals.0 - COdata$`covals.-10`

meanhrvdiff <- aggregate(hrvdiff,list(HRVdata$regulation, HRVdata$auth.rating),mean)
meantprdiff <- aggregate(tprdiff,list(TPRdata$regulation, TPRdata$auth.rating),mean)
meanvcdiff <- aggregate(vcdiff,list(VCdata$regulation, VCdata$auth.rating),mean)
meancodiff <- aggregate(codiff,list(COdata$regulation, COdata$auth.rating),mean)

meanhrvdiff_wide <- reshape(meanhrvdiff,idvar = "Group.2", v.names = c("x"),
                            timevar = "Group.1",direction = "wide")
meantprdiff_wide <- reshape(meantprdiff,idvar = "Group.2", v.names = c("x"),
                            timevar = "Group.1",direction = "wide")
meanvcdiff_wide <- reshape(meanvcdiff,idvar = "Group.2", v.names = c("x"),
                           timevar = "Group.1",direction = "wide")
meancodiff_wide <- reshape(meancodiff,idvar = "Group.2", v.names = c("x"),
                           timevar = "Group.1",direction = "wide")


