# table 12.6 page 204

library(sqldf)

# sqldf has problems with "." so remove them
p31table32 = p31table3.2

p204table12.6 = sqldf(
"select sampled SampledTaxpayers,S1,S2,y1,y2,
        case when y2 = '   ' then '('||ltrim(y1)||')' 
             when y1 = '   ' then '('||ltrim(y2)||')'
             else round((5.0/9.0)*y1 + (4.0/9.0)*y2,2) 
        end ypst 
  from (
select '  '||a.Taxpayer||' '||b.Taxpayer||' '||c.Taxpayer||'   ' sampled,
        '  '||case when c.Taxpayer <= 5 
             then a.Taxpayer||' '||b.Taxpayer||' '||c.Taxpayer||'  '
             when b.Taxpayer <= 5
             then a.Taxpayer||' '||b.Taxpayer||'  '
             when a.Taxpayer <= 5 then a.Taxpayer||'  '
             else ' '
        end S1,
        '  '||case when a.Taxpayer in (6,7,8,9) 
             then a.Taxpayer||' '||b.Taxpayer||' '||c.Taxpayer
             when b.Taxpayer in (6,7,8,9)
             then b.Taxpayer||' '||c.Taxpayer
             when c.Taxpayer in (6,7,8,9)
             then c.Taxpayer
             else ' '
        end S2,
        '  '||case when c.Taxpayer <= 5 
             then round((a.Actual+b.Actual+c.Actual)/3.0,2)
             when b.Taxpayer <= 5
             then round((a.Actual+b.Actual)/2.0,2)
             when a.Taxpayer <= 5 then a.Actual
             else ' '
        end y1,
        '  '||case when a.Taxpayer in (6,7,8,9) 
             then round((a.Actual+b.Actual+c.Actual)/3.0,2)
             when b.Taxpayer in (6,7,8,9)
             then round((b.Actual+c.Actual)/2.0,2)
             when c.Taxpayer in (6,7,8,9)
             then c.Actual
             else ' '
        end y2                
   from p31table32 a,
        p31table32 b,
        p31table32 c
  where a.Taxpayer < b.Taxpayer
    and b.Taxpayer < c.Taxpayer
  order by a.Taxpayer,b.Taxpayer,c.Taxpayer
  )"
)
