# page 150 table 11.3

library(sqldf)

oddTaxpayers=p31table3.2[c(1,3,5,7,9),]
evenTaxpayers=p31table3.2[c(2,4,6,8),]

p150table11.3odd = sqldf(
  'select a.Taxpayer||","||b.Taxpayer||","||c.Taxpayer Sampled,
          round((a.Actual+b.Actual+c.Actual)/3.0,2) as sampleMean,
          round((10.0/9.0)*((a.Actual+b.Actual+c.Actual)/3.0),2) msEst,
          round((a.Actual+b.Actual+c.Actual)/3.0,2) as mspEst
     from oddTaxpayers a,
          oddTaxpayers b,
          oddTaxpayers c
    where a.Taxpayer < b.Taxpayer
      and b.Taxpayer < c.Taxpayer
    order by a.Taxpayer,b.Taxpayer,c.Taxpayer'
)

p150table11.3even = sqldf(
  'select a.Taxpayer||","||b.Taxpayer||","||c.Taxpayer Sampled,
          round((a.Actual+b.Actual+c.Actual)/3.0,2) as sampleMean,
          round((10.0/9.0)*(a.Actual+b.Actual+c.Actual)/3.0,2) msEst,
          round((a.Actual+b.Actual+c.Actual)/3.0,2) as mspEst
     from evenTaxpayers a,
          evenTaxpayers b,
          evenTaxpayers c
    where a.Taxpayer < b.Taxpayer
      and b.Taxpayer < c.Taxpayer
    order by a.Taxpayer,b.Taxpayer,c.Taxpayer'
)
