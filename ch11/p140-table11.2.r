# page 140 table 11.2

library(sqldf)
# remove "." to make sqldf happy
p51table51 = p51table5.1

p140table11.2 = sqldf(
   'select tmp.*, round(((8.0/9.0)*(8.0/9.0)*(6.0/8.0)*(samplevar/2.0)),2) varyest 
     from ( 
       select a.Taxpayer||","||b.Taxpayer SampledTaxpayers,
              (a.Actual+b.Actual)/2 as sampleMean,
              round((8.0/9.0)*((a.Actual+b.Actual)/2) + (1.0/9.0)*200.00,2) yest,
              ((a.Actual-((a.Actual+b.Actual)/2))*(a.Actual-((a.Actual+b.Actual)/2)) + 
              (b.Actual-((b.Actual+b.Actual)/2))*(b.Actual-((b.Actual+b.Actual)/2)))*2 samplevar
         from p51table51 a join p51table51 b
        where a.Taxpayer < b.Taxpayer
       ) tmp'
)
