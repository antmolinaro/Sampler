# table 11.4 on page 154 wihout any SQL

p154table11.4 = merge(p31table3.2,merge(p31table3.2,p31table3.2,by=NULL),by=NULL)
p154table11.4 = p154table11.4[p154table11.4$Taxpayer < p154table11.4$Taxpayer.x & p154table11.4$Taxpayer.x < p154table11.4$Taxpayer.y,]

p154table11.4 = within(p154table11.4,
    {
       SampleMean       = round((Actual+Actual.x+Actual.y)/3.0,2) 
       SampledTaxpayers = paste(Taxpayer,Taxpayer.x,Taxpayer.y,sep=",")
    })

p154table11.4[order(p154table11.4$Taxpayer,p154table11.4$Taxpayer.x),-c(1:9)]
