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
