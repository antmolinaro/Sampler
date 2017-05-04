# Generate figure 5.1 on page 57

data.frame(table(p56table5.2$ymean))

p57figure5.1 = data.frame(table(p56table5.2$ymean))

plot(p57figure5.1$Freq~p57figure5.1$Var1,main="Sampling distribution of ybar", ylab="frequency", xlab="ybar",ylim=c(0,4))
lines(p57figure5.1$Freq~p57figure5.1$Var1,type="h")
