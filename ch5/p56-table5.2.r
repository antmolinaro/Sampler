# Generate table 5.2 on page 56
# Additional measures on the bottom of the page are easy enough to add

p56table5.2 = data.frame()

for (k in 1:nrow(t(combn(8,2)))) {
   a = t(combn(8,2))[k,1]
   b = t(combn(8,2))[k,2]
   m = mean(p51table5.1[c(a,b),]$Actual)
   v = var(p51table5.1[c(a,b),]$Actual)*1/2
   s = var(p51table5.1[c(a,b),]$Actual)
   x = c(t(combn(8,2))[k,],m,v,s)
   p56table5.2 = rbind(p56table5.2, x)
}

colnames(p56table5.2) = c("unit1","unit2","ymean","yvar","ys")

# This can be done more efficiently without looping since the data comes from
# the first 8 rows of table3.2 on page 31
#
# A = merge(p31table3.2[1:8,],p31table3.2[1:8,],by=NULL)
# B = within(A[A$Taxpayer.x < A$Taxpayer.y,], 
#    {
#        ymean=(Actual.x+Actual.y)/2
#        yvar=((Actual.x-ymean)^2 + (Actual.y-ymean)^2)/2
#        ys = yvar*2
#     }
#     )[,c("Taxpayer.x","Taxpayer.y","ymean","yvar","ys")]
# 
# rownames(B) = NULL 
# B[order(B$Taxpayer.x),]
# 
