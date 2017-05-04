# p.117 table10.4 - without any SQL

p117table10.4 = merge(p51table5.1,p51table5.1,by=NULL)
p117table10.4 = p117table10.4[p117table10.4$Taxpayer.x <= p117table10.4$Taxpayer.y,]
p117table10.4 = within(p117table10.4, 
     {
       relFreq          = ifelse(Taxpayer.x==1,"4/81",ifelse(Taxpayer.x==Taxpayer.y,"1/81","2/81"))
       Freq             = ifelse(Taxpayer.x==1,4,ifelse(Taxpayer.x==Taxpayer.y,1,2))
       weightedMean     = round((1.0/8.0)*(1.0/2.0)*((Actual.x/(ifelse(Taxpayer.x==1,2.0,1.0)/9.0))+(Actual.y/(1.0/9.0))),1) 
       sampleMean       = (Actual.x+Actual.y)/2
       SampleUnits      = paste(Taxpayer.x,Taxpayer.y,sep=",")
     })
 p117table10.4[order(-p117table10.4$Freq,A$Taxpayer.x),-(1:6)]
