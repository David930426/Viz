#
# David
# Practice bar chart
#
#640 x 480

library(tidyr)
library(magrittr)
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



accidents <- read.csv('Accidents.csv')

accidents_longer <- accidents %>% pivot_longer(cols = c('Death','Injured'),
                                               names_to = "Type",
                                               values_to = 'Count')

ggplot(accidents_longer, aes(x = as.factor(Year), y = Count, fill = Type)) +
  labs(title = "Traffic Accidents", 
       x = "Year",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_bar(position = 'dodge', stat = 'identity')




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


climate <- read.csv('David_Jakarta_temperature_and_humidity.csv')

climate_longer <- climate %>% pivot_longer(cols = c('Temperature', 'Humidity'),
                                           names_to = 'Type',
                                           values_to = 'Count')
ggplot(climate_longer, aes(x = as.factor(Month), y = Count, fill = Type)) +
  labs(title = "Jakarta Temperature and Humidity 2023", 
       x = "Year",
       y = "Numbers",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_bar(position = 'dodge', stat = 'identity')


library(datasets)
View(iris)
library(dplyr)

heightweight %>%
  select(ageYear, heightIn)

ggplot(heightweight, aes(x = ageYear, y = heightIn, color = sex)) +
  labs(title = "Age and Height by Gender", 
       x = "Age(Year)",
       y = "Height(Inch)",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_point()




main_gate <- read.csv('David_Vehicle_data_main_gate.csv')

main_gate_longer <- main_gate %>% pivot_longer(cols = c('Car', 'Motorcycle', 'Sum'),
                                     names_to = 'Vehicle',
                                     values_to = 'Count')
ggplot(main_gate_longer, aes(x = as.factor(Day), y = Count, fill = Vehicle)) +
  labs(title = "Tunghai University Vehicle Main Gate 2020", 
       x = "Day",
       y = "Numbers",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_bar(position = 'dodge', stat = 'identity')


second_gate <- read.csv('David_Vehicle_data_second_gate.csv')

second_gate_longer <- second_gate %>% pivot_longer(cols = c('Car', 'Motorcycle', 'Sum'),
                                               names_to = 'Vehicle',
                                               values_to = 'Count')
ggplot(second_gate_longer, aes(x = as.factor(Day), y = Count, fill = Vehicle)) +
  labs(title = "Tunghai University Vehicle Second Gate 2020", 
       x = "Day",
       y = "Numbers",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_bar(position = 'dodge', stat = 'identity')

all_gate <- read.csv('David_Vehicle_all_data.csv')

all_gate_longer <- all_gate %>% pivot_longer(cols = c('Car', 'Motorcycle', 'Sum'),
                                               names_to = 'Vehicle',
                                               values_to = 'Count')
ggplot(all_gate_longer, aes(x = as.factor(Day), y = Count, fill = Vehicle)) +
  labs(title = "All Vehicle enter Tunghai University 2020", 
       x = "Day",
       y = "Numbers",
       caption = "By David, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20)) +
  geom_bar(position = 'dodge', stat = 'identity')

