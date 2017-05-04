
library(sqldf)

# sqldf has problems with "." so remove them
p51table51 = p51table5.1

p212fig131.1 = 
sqldf("
select (a.Reported+b.Reported)/2.0 mean
  from p51table51 a, p51table51 b
 where a.Taxpayer < b.Taxpayer
 order by a.Taxpayer
 ")

p212fig131.2 = 
sqldf("
select (a.Reported+b.Reported+c.Reported)/3.0 mean
  from p51table51 a, p51table51 b, p51table51 c
 where a.Taxpayer < b.Taxpayer
   and b.Taxpayer < c.Taxpayer
 order by a.Taxpayer
 ")

p213fig131.1 = 
sqldf("
select (a.Reported+b.Reported+c.Reported+d.Reported)/4.0 mean
  from p51table51 a, p51table51 b, p51table51 c, p51table51 d
 where a.Taxpayer < b.Taxpayer
   and b.Taxpayer < c.Taxpayer
   and c.Taxpayer < d.Taxpayer
 order by a.Taxpayer
 ")

p213fig131.2 = 
sqldf("
select (a.Reported+b.Reported+c.Reported+d.Reported+e.Reported)/5.0 mean
  from p51table51 a, p51table51 b, p51table51 c, p51table51 d, p51table51 e
 where a.Taxpayer < b.Taxpayer
   and b.Taxpayer < c.Taxpayer
   and c.Taxpayer < d.Taxpayer
   and d.Taxpayer < e.Taxpayer
 order by a.Taxpayer
 ")
 
par(mfrow=c(2,2))
hist(p212fig131.1$mean,ylim=c(0,10),ylab="FREQUENCIES",xlab="(28 samples of 2 out of 8)\nVar(y) = 221.03",main="",breaks=14,xlim=c(50,120))
hist(p212fig131.2$mean,ylim=c(0,10),ylab="FREQUENCIES",xlab="(56 samples of 3 out of 8)\nVar(y) = 122.79",main="",breaks=14,xlim=c(50,120))
hist(p213fig131.1$mean,ylim=c(0,20),ylab="FREQUENCIES",xlab="(70 samples of 4 out of 8)\nVar(y) = 73.68",main="",breaks=14,xlim=c(50,120))
hist(p213fig131.2$mean,ylim=c(0,10),ylab="FREQUENCIES",xlab="(56 samples of 5 out of 8)\nVar(y) = 44.21",main="",breaks=14,xlim=c(50,120))

