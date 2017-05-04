# Create figure 3.1 on page 32, plot the counts first

# For readers not familiar with aggregate(), you can just use
# table() and then transpose or call cbind():
#   cbind(table(p31table3.2$Actual))
#

counts = aggregate(p31table3.2$Actual,by=list(p31table3.2$Actual),FUN=length)
colnames(counts) = c("Actual","freq")

ActualMedian = median(p31table3.2$Actual)
ActualMean = round(mean(p31table3.2$Actual),2)
plot(counts$freq~counts$Actual,main="Actual taxpayer income", ylab="frequency", xlab="Income",xlim=c(0,200),ylim=c(0,2),xaxt="n")
axis(1,at=seq(60,200,10),labels=seq(60,200,10))
lines(counts$freq~counts$Actual,type="h")
legend(135,1,c(paste("mean = ",ActualMean),paste("median = ",ActualMedian)))
