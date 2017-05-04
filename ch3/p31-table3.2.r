# Create table 3.2 on page 31

p31table3.2 = read.csv("https://raw.githubusercontent.com/antmolinaro/Sampler/master/ch3/p31-table3.2.csv",header=TRUE)

# Corresponding calls in R for totals, means, population and sample variances.
# Note that the R function var() computes the sample variance so we must multiply
# by (n-1)/n to get the population variance - this becomes obvious to the readers
# if they look at exercise 3.2.3 on page 35

sum(p31table3.2$Actual)
sum(p31table3.2$Reported)
mean(p31table3.2$Actual)
mean(p31table3.2$Reported)
var(p31table3.2$Actual)
var(p31table3.2$Actual)*8/9
var(p31table3.2$Reported)
var(p31table3.2$Reported)*8/9
