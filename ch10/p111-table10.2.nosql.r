# p.111 table 10.2 - Without any sql

p111table10.2 = merge(p51table5.1,p51table5.1,by=NULL)
p111table10.2 = p111table10.2[p111table10.2$Taxpayer.x <= p111table10.2$Taxpayer.y,]
p111table10.2 = within(p111table10.2, 
     {
       relFreq          = ifelse(Taxpayer.x<Taxpayer.y,"2/64","1/64")
       Freq             = ifelse(Taxpayer.x<Taxpayer.y,2,1)
       sampleMean       = (Actual.x+Actual.y)/2
       SampledTaxpayers = paste(Taxpayer.x,Taxpayer.y,sep=",")
     })
 p111table10.2[order(-p111table10.2$Freq,p111table10.2$Taxpayer.x),-(1:6)]
  
