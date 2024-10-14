#
# David
# Histogram
#

library(ggplot2)

ggplot(faithful, aes(x = waiting)) +
  labs(title = "Old Faithful Geyser",
       x = "Waiting",
       y = "Count",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_histogram(binwidth = 5, fill = "white", colour = "black")


ggplot(faithful, aes(x = waiting)) +
  labs(title = "Old Faithful Geyser",
       x = "Waiting",
       y = "Count",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_histogram(binwidth = 10, fill = "white", colour = "black")

ggplot(faithful, aes(x = waiting)) +
  labs(title = "Old Faithful Geyser",
       x = "Waiting",
       y = "Count",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_histogram(binwidth = 3, fill = "white", colour = "black")


binsize <- diff(range(faithful$waiting)) / 15

ggplot(faithful, aes(x = waiting)) +
  labs(title = "Old Faithful Geyser",
       x = "Waiting",
       y = "Count",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_histogram(binwidth = binsize, fill = "white", colour = "black")


library(MASS)

ggplot(birthwt, aes(x = bwt)) + 
  labs(title = "Birth Weight",
      x = "Birth Weight",
      y = "Count",
      caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_histogram(fill = "white", colour = "black") +
  facet_grid(smoke ~ .)

ggplot(birthwt, aes(x = bwt)) + 
  labs(title = "Birth Weight",
       x = "Birth Weight",
       y = "Count",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_histogram(fill = "white", colour = "black") +
  facet_grid(. ~ smoke)

library(tidyverse)

birthwt$smoke <- recode_factor(birthwt$smoke, '0' = 'No Smoke', '1' = 'Smoke')

ggplot(birthwt, aes(x = bwt)) + 
  labs(title = "Birth Weight",
       x = "Birth Weight",
       y = "Count",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_histogram(fill = "white", colour = "black") +
  facet_grid(. ~ smoke)


ggplot(birthwt, aes(x = bwt, fill = smoke)) +
  labs(title = "Birth Weight",
       x = "Birth Weight",
       y = "Count",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_histogram(position = "identity", alpha = 0.4)

