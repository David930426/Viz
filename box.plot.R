#
# David
# 2024/10/21
# Draw Box Plot
#


plot(ToothGrowth$supp, ToothGrowth$len)

# Formula syntax
boxplot(len ~ supp, data = ToothGrowth)

# Put interaction of two variables on x-axis
boxplot(len ~ supp + dose, data = ToothGrowth)

library(ggplot2)

ggplot(ToothGrowth, aes(x  = supp, y = len)) +
  geom_boxplot()

# Use suppp, dose for x axis
ggplot(ToothGrowth, aes(x  = interaction(supp, dose), y = len)) + 
  labs(title = "Boxplot With Ggplot",
       x = "Supp",
       y = "Len",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_boxplot()
