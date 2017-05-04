# page 125 table 10.5

# BW shows the calculation of the relative frequency on page 125.  Check with him
# if he still wants it shown (it would have to be cast to a string to be stored in a df)

library(sqldf)
# remove "." to make sqldf happy
p51table51 = p51table5.1

p125table105 = 
sqldf(
  'select a.Taxpayer||","||b.Taxpayer SampledTaxpayers, 
          round(
          (1.0/8.0)*(1.0/2.0)*(a.Actual/(cast(a.Reported as float)/(select sum(Reported) from p51table51)) 
          + b.Actual/(cast(b.Reported as float)/(select sum(Reported) from p51table51))),1) sumReported,
          round(2.0*(cast(a.Reported as float)/(select sum(Reported) from p51table51))*(cast(b.Reported as float)/(select sum(Reported) from p51table51)),3) relFreq
     from p51table51 a join p51table51 b
    where a.Taxpayer < b.Taxpayer
  union all
  select a.Taxpayer||","||b.Taxpayer SampledTaxpayers, 
         round(
          (1.0/8.0)*(1.0/2.0)*(a.Actual/(cast(a.Reported as float)/(select sum(Reported) from p51table51)) 
          + b.Actual/(cast(b.Reported as float)/(select sum(Reported) from p51table51))),1) sumReported,
          round((cast(a.Reported as float)/(select sum(Reported) from p51table51))*(cast(b.Reported as float)/(select sum(Reported) from p51table51)),3) relFreq
     from p51table51 a join p51table51 b
    where a.Taxpayer = b.Taxpayer'
 )
