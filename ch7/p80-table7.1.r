# Create table 7.1 page 80

p80table7.1 = data.frame()
 
 for (k in 1:nrow(p56table5.2)) {
   lowerlimit = p56table5.2[k,3] - 23.5
   upperlimit = p56table5.2[k,3] + 24.5
   x = c(p56table5.2[k,3],lowerlimit,upperlimit,(lowerlimit<=mean(p56table5.2$ymean) & upperlimit>=mean(p56table5.2$ymean)))
   p80table7.1 = rbind(p80table7.1,x)
 }
 
 colnames(p80table7.1) = c("SampleMean","LowerLimit","UpperLimit","Coverage")

p80table7.1 = within(p80table7.1,{CoversTrueMean=ifelse(Coverage==0,"no","yes")})[,c(1,2,3,5)]
