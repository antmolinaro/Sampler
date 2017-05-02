# Create figure 1.1 on page 7

# Step 1: Find the median order of induction for each month.
#         Since we don't need the day of the month, only work with data from columns 2 through 13


p6table1.1 = read.csv("https://raw.githubusercontent.com/antmolinaro/Sampler/master/ch1/p6-table1.1.csv",header=TRUE)

p6table1.1[,2:13]

# Step 2: use the sapply() function to find the median for each month

sapply(p6table1.1[,2:13],median)

# Step 3: use the plot function with customized x axis, see R documentation for details

plot(sapply(p6table1.1[,2:13],median),ylim=c(50,300),xlim=c(1,12),ylab="Median Order of Induction",xlab="Month",xaxt="n",pch="M")
axis(1,at=seq(1,12),cols)

