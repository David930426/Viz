#
# David
# Practice bar chart
#
#640 x 480

library(gcookbook)
library(ggplot2)

gggeom_col()ggplot(pg_mean, aes(x = group, y = weight)) +
  geom_point()

ggplot(pg_mean, aes (x="", y = weight, fill = group)) +
  geom_col() +
  coord_polar(theta="y")

ggplot(pg_mean, aes(x = group, y = weight, fill = group)) + 
  geom_col() +
  labs(title = "Bar chart", 
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() +
  labs(title = "Line chart", 
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

ggplot(diamonds, aes(x = carat)) +
  geom_histogram() +
  labs(title = "Histogram chart", 
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

ggplot(diamonds, aes(x = carat)) +
  geom_bar() +
  labs(title = "Bar chart", 
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

df <- read.csv('Accidents.csv')

ggplot(df, aes(x = Year, y = Death)) +
  geom_col() +
  labs(title = "Accidents: Death", 
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

dt <- read.csv('David_Jakarta_temperature_and_humidity.csv')

ggplot(dt, aes(x = factor(Month), y = Temperature)) +
  geom_col() +
  labs(title = "Jakarta Temperature 2023", 
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

ggplot(dt, aes(x = factor(Month), y = Humidity)) +
  geom_col() +
  labs(title = "Jakarta Humidity 2023", 
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))
