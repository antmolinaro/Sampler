# page 92 figure 8.3 

cord.x = c(-3,seq(-3,1,0.01),1)
cord.y = c(0,dnorm(seq(-3,1,0.01)),0)
curve(dnorm(x,0,1), xlim=c(-3,3), main='Standard Normal',ylim=c(0,.8),ylab="f(Z)",xlab="Z")
polygon(cord.x,cord.y,col="red")
