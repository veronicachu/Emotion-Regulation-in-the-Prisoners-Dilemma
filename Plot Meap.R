load("~/R/Working Data/RemovedOutliers_-10_all.RData")

# reshape data for plotting -----------------------------------------------

HRVdata <- reshape(HRVdata,idvar = "subject", v.names = c("hrvvals"),
                   timevar = "time",direction = "long")

TPRdata <- reshape(TPRdata,idvar = "subject", v.names = c("tprvals"),
                   timevar = "time",direction = "long")

VCdata <- reshape(VCdata,idvar = "subject", v.names = c("vcvals"),
                  timevar = "time",direction = "long")

COdata <- reshape(COdata,idvar = "subject", v.names = c("covals"),
                  timevar = "time",direction = "long")


# rename labels -----------------------------------------------------------

levels(HRVdata$auth.rating) <- c("High Rating","Low Rating")
levels(TPRdata$auth.rating) <- c("High Rating","Low Rating")
levels(VCdata$auth.rating) <- c("High Rating","Low Rating")
levels(COdata$auth.rating) <- c("High Rating","Low Rating")

# plot % baseline change data ---------------------------------------------
require(ggplot2)

hrv <- ggplot(data = HRVdata, aes(x = time, y = hrvvals, group = subject))
tpr <- ggplot(data = TPRdata, aes(x = time, y = tprvals, group = subject))
vc <- ggplot(data = VCdata, aes(x = time, y = vcvals, group = subject))
co <- ggplot(data = COdata, aes(x = time, y = covals, group = subject))

# scatter plot
tpr + geom_point() + facet_grid(regulation~smile) + labs(title = "Individual TPR Values", x = "Time (s)", y = "% Baseline Change") +
    ylim(-200,250)
vc + geom_point() + facet_grid(regulation~smile) + labs(title = "Individual VC Values", x = "Time (s)", y = "% Baseline Change") +
    ylim(-50,100)
co + geom_point() + facet_grid(regulation~smile) + labs(title = "Individual CO Values", x = "Time (s)", y = "% Baseline Change") +
    ylim(-380,300)

# line plot
tpr + geom_line() + facet_grid(regulation~smile) + labs(title = "Individual TPR Values", x = "Time (s)", y = "% Baseline Change")
vc + geom_line() + facet_grid(regulation~smile) + labs(title = "Individual VC Values", x = "Time (s)", y = "% Baseline Change")
co + geom_line() + facet_grid(regulation~smile) + labs(title = "Individual CO Values", x = "Time (s)", y = "% Baseline Change")

# mean line plot with smoothed CI
# Regulation vs. Old/New Smile
hrv + stat_smooth(aes(group = 1)) + stat_summary(aes(group = 1), geom = "point", fun.y = mean, size = 3) + facet_grid(
    regulation~smile) + labs(title = "Mean HRV", x = "Time (s)", y = "% Baseline Change")
tpr + stat_smooth(aes(group = 1)) + stat_summary(aes(group = 1), geom = "point", fun.y = mean, size = 3) + facet_grid(
    regulation~smile) + labs(title = "Mean TPR", x = "Time (s)", y = "% Baseline Change")
vc + stat_smooth(aes(group = 1)) + stat_summary(aes(group = 1), geom = "point", fun.y = mean, size = 3) + facet_grid(
    regulation~smile) + labs(title = "Mean VC", x = "Time (s)", y = "% Baseline Change")
co + stat_smooth(aes(group = 1)) + stat_summary(aes(group = 1), geom = "point", fun.y = mean, size = 3) + facet_grid(
    regulation~smile) + labs(title = "Mean CO", x = "Time (s)", y = "% Baseline Change")

# Regulation vs. Smile Rating
hrv + stat_smooth(aes(group = 1)) + stat_summary(aes(group = 1), geom = "point", fun.y = mean, size = 3) + facet_grid(
    regulation~auth.rating) + labs(title = "Mean HRV", x = "Time (s)", y = "% Baseline Change")
tpr + stat_smooth(aes(group = 1)) + stat_summary(aes(group = 1), geom = "point", fun.y = mean, size = 3) + facet_grid(
    regulation~auth.rating) + labs(title = "Mean TPR", x = "Time (s)", y = "% Baseline Change")
vc + stat_smooth(aes(group = 1)) + stat_summary(aes(group = 1), geom = "point", fun.y = mean, size = 3) + facet_grid(
    regulation~auth.rating) + labs(title = "Mean VC", x = "Time (s)", y = "% Baseline Change")
co + stat_smooth(aes(group = 1)) + stat_summary(aes(group = 1), geom = "point", fun.y = mean, size = 3) + facet_grid(
    regulation~auth.rating) + labs(title = "Mean CO", x = "Time (s)", y = "% Baseline Change")
