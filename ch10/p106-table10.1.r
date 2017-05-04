# page 106 table 10.1

A = merge(p51table5.1,p51table5.1,by=NULL)

p106table10.1 = within(A[order(A$Taxpayer.x),c("Taxpayer.x","Taxpayer.y","Actual.x","Actual.y")],{sampleMean = (Actual.x+Actual.y)/2} )

p106table10.1 = p106table10.1[,c(1,2,5)]

p106table10.1 = within(p106table10.1, {
                   TaxpayersSelected=paste(Taxpayer.x,Taxpayer.y,sep=",")
                 })[,c(4,3)]
