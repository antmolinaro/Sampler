# page 187 figure 12.2 - see page 186 & 189 for data

par(mfrow=c(3,2))

plot(p31table3.2$Actual~p31table3.2$Reported,xlim=c(0,200),ylim=c(0,200),pch=19,ylab="Actual",xlab="Reported")
plot(200-p31table3.2$Actual~p31table3.2$Reported,xlim=c(0,200),ylim=c(0,200),pch=19,ylab="Actual",xlab="Reported")

x = c(50,85,105,110,120,135,145,150,200)
y = c(100,85,60,120,110,75,105,125,185)
plot(x,y,ylim=c(0,200),pch=19)

x = c(50,85,105,110,120,135,145,150,200)
y = c(100,115,140,80,90,125,95,75,15)
plot(x,y,ylim=c(0,200),pch=19)

x = c(50,85,105,110,120,135,145,150,200)
y = c(100,85,60,120,110,75,105,125,85)
plot(x,y,ylim=c(0,200),pch=19)

x = c(80,88,100,120,140,152,160)
y = c(180,100,60,20,60,100,180)
plot(x,y,xlim=c(0,250),pch=19)
lines(x,y)
 
# p.186
# x = c(-2,-1,0,1,2)
# y = c(4,1,0,1,4)
# plot(y~x,xlim=c(-4,4),ylim=c(0,6),col="blue",pch=19)
# curve(x^2,from=-4,to=4,add=TRUE)
