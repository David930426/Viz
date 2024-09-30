#
# David
# Practice bar chart
#

library(gcookbook)
library(ggplot2)

ggplot(pg_mean, aes(x = group, y = weight, fill = group)) + 
  geom_col() +
  labs(title = "Bar chart", 
       caption = "By David, Data visualization course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() +
  labs(title = "Line chart", 
       caption = "By David, Data visualization course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

ggplot(pg_mean, aes(x=group, y=weight)) +
  geom_point()

ggplot(pg_mean, aes (x="", y=weight, fill=group)) +
  geom_col() +
  coord_polar(theta="y")

#640 x 480
