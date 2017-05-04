# page 178 table 12.1

library(sqldf)

# sqldf has problems with "." so remove them
p51table51 = p51table5.1

tmp = sqldf(
'select a.Taxpayer||" "||b.Taxpayer||" "||c.Taxpayer sampled,
        round((a.Actual+b.Actual+c.Actual)/3.0,2) as sampleMean,
        a.Actual/1.0 AActual,b.Actual/1.0 BActual,c.Actual/1.0 CActual
   from p51table51 a,
        p51table51 b,
        p51table51 c
  where a.Taxpayer < b.Taxpayer
    and b.Taxpayer < c.Taxpayer
  order by a.Taxpayer,b.Taxpayer,c.Taxpayer'
)
  
# find median - so nice to see R and SQL playing nicely together...

tmpwithmedian = cbind(tmp, apply(tmp[,3:5],1,median))

colnames(tmpwithmedian) = c("sampled","sampleMean","AActual","BActual","CActual","sampleMedian")

p178table12.1 = sqldf(
'select sampled,sampleMean,sampleMedian,
        round((1.0/6.0*min(min(AActual,BActual),CActual)) +
              (4.0/6.0*sampleMedian) +
              (1.0/6.0*max(max(AActual,BActual),CActual)),2) weightedMean
   from tmpwithmedian'
)
