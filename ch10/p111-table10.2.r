# page 111 table 10.2

# As these tables are getting a bit bigger, creating the various sample configurations might
# be cleaner in sql

library(sqldf)

# sqldf has problems with "." so remove them
p51table51 = p51table5.1

p111table10.2 = sqldf(
  'select a.Taxpayer ||","||b.Taxpayer SampledTaxpayers, 
          (a.Actual+b.Actual)/2 as sampleMean,
          2 Freq,
          "2/64" relFreq 
     from p51table51 a join p51table51 b
    where a.Taxpayer < b.Taxpayer
  union all
  select  a.Taxpayer ||","||b.Taxpayer SampledTaxpayers, 
          (a.Actual+b.Actual)/2 as sampleMean,
          1 Freq,
          "1/64" relFreq 
     from p51table51 a join p51table51 b
    where a.Taxpayer = b.Taxpayer'
 )
