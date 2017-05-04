# page 154 table 11.4

library(sqldf)

# sqldf has problems with "." so remove them
p31table32 = p31table3.2

p154table11.4 = sqldf(
  'select a.Taxpayer||" "||b.Taxpayer||" "||c.Taxpayer SampledTaxpayers,
          round((a.Actual+b.Actual+c.Actual)/3.0,2) as sampleMean
     from p31table32 a,
          p31table32 b,
          p31table32 c
    where a.Taxpayer < b.Taxpayer
      and b.Taxpayer < c.Taxpayer
    order by a.Taxpayer,b.Taxpayer,c.Taxpayer'
)
