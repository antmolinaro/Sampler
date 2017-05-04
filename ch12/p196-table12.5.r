# page 196 table 12.5

library(sqldf)

# sqldf has problems with "." so remove them
p31table32 = p31table3.2

p196table12.5 = sqldf(
 'select sampled SampledTaxpayers,sampleMean,
        round((sampleMean/reportedMean)*popMean,2) ratioEst,
        largesampleMean,
        round((largesampleMean/reportedMean)*popMean,2) largeratioEst
   from ( 
 select a.Taxpayer||" "||b.Taxpayer||" "||c.Taxpayer sampled,
        round((a.Actual+b.Actual+c.Actual)/3.0,2) as sampleMean,
        round((a.Reported+b.Reported+c.Reported)/3.0,2) as reportedMean,
        round((select avg(Reported) from p31table32),2) popMean,
        round(((a.Actual+30)+(b.Actual+30)+(c.Actual+30))/3.0,2) as largesampleMean
   from p31table32 a,
        p31table32 b,
        p31table32 c
  where a.Taxpayer < b.Taxpayer
    and b.Taxpayer < c.Taxpayer
  order by a.Taxpayer,b.Taxpayer,c.Taxpayer
        ) tmp1'
)
