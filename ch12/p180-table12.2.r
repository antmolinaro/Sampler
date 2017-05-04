# page 180 table 12.2 - similar to table 12.1, but use all 9 taxpayers

library(sqldf)

# sqldf has problems with "." so remove them
p31table32 = p31table3.2

tmp122 = sqldf(
'select sampled,sampleMean,AActual,BActual,CActual,AAuxiliary,CAuxiliary,
        round((AAuxiliary+BActual+CAuxiliary)/3.0,2) auxMean
  from (
select a.Taxpayer||" "||b.Taxpayer||" "||c.Taxpayer sampled,
        round((a.Actual+b.Actual+c.Actual)/3.0,2) as sampleMean,
        a.Actual AActual,b.Actual BActual,c.Actual CActual,
        case when a.Taxpayer = 1 then a.Actual+15 else a.Actual end AAuxiliary,
        case when c.Taxpayer = 9 then c.Actual-15 else c.Actual end CAuxiliary
   from p31table32 a,
        p31table32 b,
        p31table32 c
  where a.Taxpayer < b.Taxpayer
    and b.Taxpayer < c.Taxpayer
  order by a.Taxpayer,b.Taxpayer,c.Taxpayer
        ) tmp'
)
  
# find median

tmp122withmedian = cbind(tmp122, apply(tmp122[,3:5],1,median))

colnames(tmp122withmedian) = c("sampledTaxpayers","sampleMean","AActual","BActual","CActual","AAuxiliary","CAuxiliary","auxMean","sampleMedian")

p180table12.2 = sqldf(
'select sampledTaxpayers,sampleMean,sampleMedian,
        round((1.0/6.0*min(min(AActual,BActual),CActual)) +
              (4.0/6.0*sampleMedian) +
              (1.0/6.0*max(max(AActual,BActual),CActual)),2) weightedMean,
        auxMean
   from tmp122withmedian'
)
