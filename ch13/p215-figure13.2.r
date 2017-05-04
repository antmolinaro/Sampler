# p.215 figure 13.2

plot(y~x,pch=19,ylim=c(0,600))
x=1:12
y=(589.4/x)-73.7
plot(y~x,pch=19,ylim=c(0,600),xlim=c(0,15),ylab="Variance of the mean",xlab="Sample size")
curve((589.4/x)-73.7,from=1,to=12,add=TRUE)
x=1:8
y=515.8/x
par(new=TRUE)
plot(y~x,pch=19,xaxt="n",yaxt="n",xlab="",ylab="")
curve(515.8/x,from=1,to=12,add=TRUE)
arrows(4.5,200,3,185,length=.1,angle=60)
arrows(6.5,200,4,90,length=.1,angle=45)
text(4.5,230,"Variance\n with replacement")
text(7,225,"Variance\n without replacement")
