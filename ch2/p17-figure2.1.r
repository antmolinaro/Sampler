# Create figure 2.1 on page 17

p17figure2.1 = read.csv("https://raw.githubusercontent.com/antmolinaro/Sampler/master/ch2/p17-figure2.1.csv")
plot(p17figure2.1$Deaths~p17figure2.1$Year,ylim=c(0,50),type="l",ylab="Deaths",xlab="Year",xaxt="n")
axis(1,at=seq(1930,1970,5),labels=seq(1930,1970,5))
