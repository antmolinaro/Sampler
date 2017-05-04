# page 218 table 13.2
 
library(sqldf)

# sqldf has problems with "." so remove them
p51table51 = p51table5.1

p218table13.2 = sqldf("
select a.Taxpayer||' '||b.Taxpayer||' '||c.Taxpayer||' '||d.Taxpayer||' '||e.Taxpayer SampledTaxpayers,
       (a.Actual+b.Actual+c.Actual+d.Actual+e.Actual)/5.0 sampleMean
  from p51table51 a, p51table51 b, p51table51 c, p51table51 d, p51table51 e
 where a.Taxpayer < b.Taxpayer
   and b.Taxpayer < c.Taxpayer
   and c.Taxpayer < d.Taxpayer
   and d.Taxpayer < e.Taxpayer
 order by a.Taxpayer
 ")
