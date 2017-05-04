# page 192 table 12.4
# As these queries are growing, I'm contemplating rewriting in pure R, no SQL

library(sqldf)

# sqldf has problems with "." so remove them
p31table32 = p31table3.2

p192table12.4 = sqldf(
'select sampled TaxpayersSampled, sampleMean,ratioEst, 
        round(sampleMean+b*(popMean-reportedMean),2) regEst,
        round(sampleMean+1.096*(popMean-reportedMean),2) BregEst
   from (
 select sampled,sampleMean,popMean,reportedMean,
        round((sampleMean/reportedMean)*popMean,2) ratioEst,
        ((AActual-sampleMean)*(AReported-reportedMean) 
        +
        (BActual-sampleMean)*(BReported-reportedMean) 
        +
        (CActual-sampleMean)*(CReported-reportedMean))
        /((AReported-reportedMean)*(AReported-reportedMean) +
         (BReported-reportedMean)*(BReported-reportedMean) +
         (CReported-reportedMean)*(CReported-reportedMean)) b
   from ( 
 select a.Taxpayer||" "||b.Taxpayer||" "||c.Taxpayer sampled,
        A.Actual AActual, B.Actual BActual, C.Actual CActual,
        A.Reported AReported, B.Reported BReported, C.Reported CReported,
        round((a.Actual+b.Actual+c.Actual)/3.0,2) as sampleMean,
        round((a.Reported+b.Reported+c.Reported)/3.0,2) as reportedMean,
        round((select avg(Reported) from p31table32),2) popMean
   from p31table32 a,
        p31table32 b,
        p31table32 c
  where a.Taxpayer < b.Taxpayer
    and b.Taxpayer < c.Taxpayer
  order by a.Taxpayer,b.Taxpayer,c.Taxpayer
        ) tmp1
        ) tmp2'
)
