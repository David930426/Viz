#
# David
# 2024/10/21
# Practice density chart
#

library(ggplot2)

ggplot(faithful, aes(x = waiting)) + 
  labs(title = "Density Chart",
       x = "Waiting",
       y = "Density",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_density(fill = "blue", alpha = .2) +
  xlim(35, 105)



ggplot(faithful, aes(x = waiting, y = after_stat(density))) + 
  labs(title = "Density Chart",
       x = "Waiting",
       y = "Density",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_histogram(fill = "cornsilk", colour = "grey60", size = .2) +
  geom_density(fill = "blue", alpha = .2) +
  xlim(35, 105)


stock <- read.csv("Stocks.csv")

ggplot(stock, aes(x = Price, y = after_stat(density))) + 
  labs(title = "Stock Price: Histogram and Density Chart",
       x = "Price",
       y = "Density",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_histogram(fill = "cornsilk", colour = "grey60", size = .2) +
  geom_density()

ggplot(stock, aes(x = Price)) + 
  labs(title = "Stock Price with Key Price Range",
    x = "Price",
    y = "Density",
    caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_density(fill = "Lightblue", alpha = 0.6) +
  geom_vline(xintercept = c(80, 100, 120), linetype = "dashed", color = "red", size= 1)


library(tidyverse)
library(MASS)             # Load the package



birthwt$smoke <- recode_factor(birthwt$smoke, '0' = 'Non Smoking', '1' = 'Smoking')


ggplot(birthwt, aes(x = bwt, colour = smoke)) + 
  labs(title = "Birth Weight: Smoking vs Non-Smoking",
       x = "Birth Weight",
       y = "Density",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_density()

ggplot(birthwt, aes(x = bwt, fill = smoke)) + 
  labs(title = "Birth Weight: Smoking vs Non-Smoking",
       x = "Birth Weight",
       y = "Density",
       fill = "Smoking Status",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_density(position = "identity", alpha = .3)



