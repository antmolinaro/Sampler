# page 108 figure 10.1

p108figure10.1 = aggregate(p106table10.1$sampleMean,by=list(p106table10.1$sampleMean),FUN=length)

colnames(p108figure10.1) = c("sampleMean","cnt")

plot(cnt~sampleMean,p108figure10.1)

lines(cnt~sampleMean,p108figure10.1,type='h')
