# Table 11.2 on page 140, without any SQL

p140table11.2 = merge(p51table5.1,p51table5.1,by=NULL)
p140table11.2 = p140table11.2[p140table11.2$Taxpayer.x < p140table11.2$Taxpayer.y,]

p140table11.2 = within(p140table11.2, 
    {
       samplevar       = ( (Actual.x-((Actual.x+Actual.y)/2))*(Actual.x-((Actual.x+Actual.y)/2)) 
                         + (Actual.y-((Actual.y+Actual.y)/2))*(Actual.y-((Actual.y+Actual.y)/2)))*2
       varyest         = round(((8.0/9.0)*(8.0/9.0)*(6.0/8.0)*(samplevar/2.0)),2)
       yest            = round((8.0/9.0)*((Actual.x+Actual.y)/2) + (1.0/9.0)*200.00,2)
       SampleMean      = (Actual.x+Actual.y)/2
       SampledTaxpayer = paste(Taxpayer.x,Taxpayer.y,sep=",")
    }) 
       
p140table11.2[order(p140table11.2$Taxpayer.x),-c(1:6)]
