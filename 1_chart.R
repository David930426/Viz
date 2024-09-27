#
# David
# Practice bar chart
#

library(gcookbook)
library(ggplot2)

ggplot(pg_mean, aes(x=group, y=weight)) + 
  geom_col()