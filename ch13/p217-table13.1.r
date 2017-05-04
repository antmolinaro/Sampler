# page 217 table 13.1

library(sqldf)

# sqldf has problems with "." so remove them
p51table51 = p51table5.1

p217table13.1 = sqldf("
select a.Taxpayer||' '||b.Taxpayer||' '||c.Taxpayer||' '||d.Taxpayer SampledTaxpayers,
       (a.Actual+b.Actual+c.Actual+d.Actual)/4.0 sampleMean
  from p51table51 a, p51table51 b, p51table51 c, p51table51 d
 where a.Taxpayer < b.Taxpayer
   and b.Taxpayer < c.Taxpayer
   and c.Taxpayer < d.Taxpayer
 order by a.Taxpayer
 ")

#
# I've been leaving them out because the totals are easy to get once the table is created:
#
# > sum(p217table13.1$sampleMean)
# [1] 6405
# > mean(p217table13.1$sampleMean)
# [1] 91.5
# > var(p217table13.1$sampleMean)
# [1] 74.74638
#
