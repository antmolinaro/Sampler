# page 117 table 10.4

library(sqldf)
# remove "." to make sqldf happy
p51table51 = p51table5.1

p117table10.4 = sqldf(
  'select a.Taxpayer||","||b.Taxpayer SampleUnits, 
          (a.Actual+b.Actual)/2 as sampleMean,
          round((1.0/8.0)*(1.0/2.0)*((a.Actual/((case when a.Taxpayer=1 then 2.0 else 1.0 end)/9.0))+(b.Actual/(1.0/9.0))),1) weightedMean,
          case when a.Taxpayer = 1 then 4 else 2 end Freq,
          case when a.Taxpayer = 1 then "4/81" else "2/81" end relFreq 
     from p51table51 a join p51table51 b
    where a.Taxpayer < b.Taxpayer
    union all
   select a.Taxpayer||","||b.Taxpayer SampleUnits, 
          (a.Actual+b.Actual)/2 as sampleMean,
          round((1.0/8.0)*(1.0/2.0)*((a.Actual/((case when a.Taxpayer=1 then 2.0 else 1.0 end)/9.0))+(b.Actual/(1.0/9.0))),1) weightedMean,
          case when a.Taxpayer = 1 then 4 else 1 end Freq,
          case when a.Taxpayer = 1 then "4/81" else "1/81" end relFreq 
     from p51table51 a join p51table51 b
    where a.Taxpayer = b.Taxpayer'
 )
