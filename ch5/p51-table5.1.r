# Create table 5.1 on page 51

p51table5.1=read.csv("https://raw.githubusercontent.com/antmolinaro/Sampler/master/ch5/p51-table5.1.csv", header=T)

# Additional statistics on p.51

sum(p51table5.1$Actual)
sum(p51table5.1$Reported)
mean(p51table5.1$Actual)
mean(p51table5.1$Reported)
var(p51table5.1$Actual)*(7/8)
var(p51table5.1$Reported)*(7/8)
var(p51table5.1$Actual)
var(p51table5.1$Reported)
