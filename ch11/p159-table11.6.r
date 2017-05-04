# page 159 table 11.6

library(sqldf)

# sqldf has problems with "." so remove them
p31table32 = p31table3.2

p159table11.6 = sqldf(
  'select a.Taxpayer||" "||b.Taxpayer||" "||c.Taxpayer Sampled,
          round((a.Actual+b.Actual+c.Actual)/3.0,2) as sampleMean,
          round((5.0/9.0)*(a.Actual+b.Actual)/2+(4.0/9.0)*c.Actual,2) stratMean
     from p31table32 a,
          p31table32 b,
          p31table32 c
    where a.Taxpayer < b.Taxpayer
      and b.Taxpayer < c.Taxpayer
      and a.Taxpayer in (1,2,3,4)
      and b.Taxpayer in (2,3,4,5)
      and c.Taxpayer in (6,7,8,9)
    order by a.Taxpayer,b.Taxpayer,c.Taxpayer'
)
