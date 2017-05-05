# Table 11.6 on page 159 without any SQL

p159table11.6 = merge(p31table3.2,merge(p31table3.2,p31table3.2,by=NULL),by=NULL)

p159table11.6 = p159table11.6[p159table11.6$Taxpayer < p159table11.6$Taxpayer.x & p159table11.6$Taxpayer.x < p159table11.6$Taxpayer.y,]
p159table11.6 = p159table11.6[(p159table11.6$Taxpayer %in% c(1,2,3,4)) & (p159table11.6$Taxpayer.x %in% c(2,3,4,5)) & (p159table11.6$Taxpayer.y %in% c(6,7,8,9)),]

p159table11.6 = within(p159table11.6,
        {
           stratMean  = round((5.0/9.0)*(Actual+Actual.x)/2+(4.0/9.0)*Actual.y,2)
           sampleMean = round((Actual+Actual.x+Actual.y)/3.0,2)
           Sampled    = paste(Taxpayer,Taxpayer.x,Taxpayer.y,sep=" ")
        })

p159table11.6 = p159table11.6[order(p159table11.6$Taxpayer,p159table11.6$Taxpayer.x),-c(1:9)]
