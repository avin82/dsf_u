getwd()

setwd('~/dsf_u')

reddit <- read.csv('reddit.csv')

head(reddit, 2)

str(reddit)

table(reddit$employment.status)

summary(reddit)

levels(reddit$age.range)

library(ggplot2)
qplot(data = reddit, x = age.range)

reddit$age.range <- factor(reddit$age.range, levels = c('Under 18', '18-24', '25-34', '35-44', '45-54', '55-64', '65 of Above'), ordered = T)

qplot(data = reddit, x = age.range)

qplot(data = reddit, x = income.range)
