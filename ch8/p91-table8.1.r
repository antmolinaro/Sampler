# page 91 table 8.1

p91table8.1 = data.frame()

for (k in seq(-3.2,3.2,.1)) {
  x = c(k,round(pnorm(k),4))
  p91table8.1 = rbind(p91table8.1,x)
}

colnames(p91table8.1) = c("Z","Area")
