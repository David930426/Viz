##mutate()
# David
# 2024/11/04
# Data Manipulation
#

# %>% means from

library(dplyr)
library(ggplot2)

score <- read.csv('student_scores.csv')

# Do a filter and select
score %>%
  filter(English > 60 & Math > 70 & class_year == 2) %>%
  select(English, Math)

# Calculate average and add column
score_avg <- score %>%
  mutate(avg = (English + Math + Science) / 3)

# Calculate group average
score_avg %>%
  group_by(class_year) %>%
  summarize(avg_English = mean(English),
            avg_Math = mean(Math))


kg <- mtcars %>%
  select(mpg, hp, wt, cyl) %>%
  mutate(wt_kg = wt * 0.453592 * 1000) %>%
  group_by(cyl) %>%
  summarize(avg_mpg = mean(mpg),
            avg_hp = mean(hp),
            avg_wt_kg = mean(wt_kg))
  

# Add some point in the boxplot
ggplot(ToothGrowth, aes(x = interaction(supp, dose), y = len)) +
  geom_boxplot() +
  geom_jitter() +
  labs(title = 'Tooth Growth',
       x = 'Supp and Dose',
       y = 'Length',
       caption = 'By David, Data Visualization couse, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust = 0.5, size = 20))


# Add color in boxplot, the data must be in factor type
ToothGrowth$dose <- as.factor(ToothGrowth$dose)

ggplot(ToothGrowth, aes(x = dose, y = len, fill = dose)) +
  geom_boxplot() +
  labs(title = 'Tooth Growth',
       x = 'Dose',
       y = 'Length',
       caption = 'By David, Data Visualization couse, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust = 0.5, size = 20))


# Task 1
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = 'Iris',
       x = 'Species',
       y = 'Sepal Length',
       caption = 'By David, Data Visualization couse, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust = 0.5, size = 20))


# Use different color and notch = true to make different shape
library(viridis)
ggplot(ToothGrowth, aes(x = dose, y = len, fill = dose)) +
  scale_fill_viridis(discrete = TRUE, alpha = 0.6) +
  geom_boxplot(notch = TRUE) +
  labs(title = 'Tooth Growth',
       x = 'Dose',
       y = 'Length',
       caption = 'By David, Data Visualization couse, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

# Add mean to the boxplot with stat summary
ggplot(ToothGrowth, aes(x = dose, y = len, fill = dose)) +
  scale_fill_viridis(discrete = TRUE, alpha = 0.6) +
  geom_boxplot(notch = TRUE) +
  stat_summary(fun.y = "mean", geom = "point", shape = 15, size = 5, fill = "white")+
  labs(title = 'Tooth Growth',
       x = 'Dose',
       y = 'Length',
       caption = 'By David, Data Visualization couse, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust = 0.5, size = 20))


# Task 2
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  scale_fill_viridis(discrete = TRUE, alpha = 0.6) +
  geom_boxplot(notch = TRUE) +
  stat_summary(fun.y = "mean", geom = "point", shape = 15, size = 5, fill = "white")+
  labs(title = 'Iris',
       x = 'Species',
       y = 'Sepal Length',
       caption = 'By David, Data Visualization couse, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust = 0.5, size = 20))


# Change the position of the legend
ggplot(ToothGrowth, aes(x = dose, y = len, fill = dose)) +
  geom_boxplot() +
  labs(title = 'Tooth Growth',
       x = 'Dose',
       y = 'Length',
       caption = 'By David, Data Visualization couse, Tunghai University, 2024') +
  scale_fill_discrete(name = "Dose") +
  theme(plot.title = element_text(hjust = 0.5, size = 20), legend.position = "bottom")


# Task 3
mtcars$cyl <- as.factor(mtcars$cyl)

ggplot(mtcars, aes(x = cyl, y = mpg, fill = cyl)) +
  geom_boxplot() +
  labs(title = 'Engine and Mileage',
       x = '# of cylinder',
       y = 'MPG',
       caption = 'By David, Data Visualization couse, Tunghai University, 2024') +
  scale_fill_discrete(name = "# of cylinder") +
  theme(plot.title = element_text(hjust = 0.5, size = 20), legend.position = "bottom")


# Violin plot and flip
library(gcookbook)
ggplot(heightweight, aes(x = sex, y = heightIn)) + 
  geom_violin() +
  coord_flip() +
  labs(title = 'Height',
       x = 'Gender',
       y = 'Height(Inch)',
       caption = 'By David, Data Visualization couse, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust = 0.5, size = 20))


# Dotplot
# dose == 0.5, len > 10
library(dplyr)
ToothGrowth %>%
  filter(dose == 0.5 & len > 10) %>%
  ggplot(aes(x = len)) +
  geom_dotplot() +
  labs(title = 'Tooth Growth',
       x = 'Dose',
       y = 'Length',
       caption = 'By David, Data Visualization couse, Tunghai University, 2024') +
  scale_fill_discrete(name = "Dose") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))



# Task 4
countries %>% 
  filter(Year == 2009 & healthexp > 2000) %>%
  ggplot(aes(x = infmortality)) + 
  geom_dotplot() +
  labs(title = 'Infant Motality (Year == 2009 & healthexp > 2000)',
       x = 'Infant Motality',
       y = 'Count',
       caption = 'By David, Data Visualization couse, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust = 0.5, size = 14))


# Different color
countries %>% 
  filter(Year == 2009 & healthexp > 2000) %>%
  mutate(infmortality = as.factor(infmortality)) %>%
  ggplot(aes(x = infmortality, fill = infmortality)) + 
  geom_dotplot() +
  labs(title = 'Infant Motality (Year == 2009 & healthexp > 2000)',
       x = 'Infant Motality',
       y = 'Count',
       caption = 'By David, Data Visualization couse, Tunghai University, 2024') +
  theme(plot.title = element_text(hjust = 0.5, size = 14), legend.position = "bottom")


# Annotation
ggplot(faithful, aes(x = eruptions, y = waiting)) +
  geom_point()

ggplot(faithful, aes(x = eruptions, y = waiting)) +
  geom_point() +
  annotate("text", x = 2.3, y = 73, label = "Group 1", 
           family = "serif", fontface = "italic", colour = "darkred", size = 3) +
  annotate("text", x = 4.5, y = 93, label = "Group 2", 
           family = "serif", fontface = "italic", colour = "darkred", size = 3)


# Add group column
# Group 1: eruption < 3
# Group 2: eruption > 3

my_faithful <- faithful

# Method 1
my_faithful$group <- ifelse(my_faithful$eruptions > 3, 2, 1)

# Method 2
library(dplyr)
my_faithful <- my_faithful %>%
  mutate(group = ifelse(eruptions > 3, 2, 1))

# Important to change to as.factor
my_faithful$group <- as.factor(my_faithful$group)

ggplot(my_faithful, aes(x = eruptions, y = waiting, color = group)) +
  geom_point() +
  labs(color = 'Group', 
       x = "Eruptions", 
       y = "Waiting",
       title = "Faithful: Eruption waiting",
       caption = "By David, Data Vizualization Course, Tunghai University, 2024") +
  #scale_color_discrete(name = 'Group') +
  annotate("text", x = 2.3, y = 73, label = "Group 1") +
  annotate("text", x = 4.5, y = 93, label = "Group 2")+
  theme(plot.title = element_text(hjust = 0.5, size = 14))


#
# Group 1 : waiting < 65, Group 2 : otherwise
#

my_faithful <- faithful

library(dplyr)
my_faithful <- my_faithful %>%
  mutate(group = ifelse(waiting < 65, 1, 2))

my_faithful$group <- as.factor(my_faithful$group)

ggplot(my_faithful, aes(x = eruptions, y = waiting, color = group)) +
  geom_point() +
  labs(color = 'Group', 
       x = "Eruptions", 
       y = "Waiting",
       title = "Faithful: Eruption waiting",
       caption = "By David, Data Vizualization Course, Tunghai University, 2024") +
  #scale_color_discrete(name = 'Group') +
  annotate("text", x = 2.3, y = 75, label = "Group 1") +
  annotate("text", x = 4.5, y = 65, label = "Group 2")+
  theme(plot.title = element_text(hjust = 0.5, size = 14))


#
# Group 1 : waiting < 75 and eruption < 4, Group 2 : otherwise
#

my_faithful <- faithful

library(dplyr)
my_faithful <- my_faithful %>%
  mutate(group = ifelse(waiting < 75 & eruptions < 4, 1, 2))

my_faithful$group <- as.factor(my_faithful$group)

ggplot(my_faithful, aes(x = eruptions, y = waiting, color = group)) +
  geom_point() +
  labs(color = 'Group', 
       x = "Eruptions", 
       y = "Waiting",
       title = "Faithful: Eruption waiting",
       caption = "By David, Data Vizualization Course, Tunghai University, 2024") +
  #scale_color_discrete(name = 'Group') +
  annotate("text", x = 2.3, y = 75, label = "Group 1") +
  annotate("text", x = 4.5, y = 65, label = "Group 2") +
  theme(plot.title = element_text(hjust = 0.5, size = 14))





# geom_text

ggplot(mtcars, aes(wt, mpg, label = rownames(mtcars))) +
  geom_point() +
  geom_text()

# geom_label

ggplot(mtcars, aes(wt, mpg, label = rownames(mtcars))) +
  geom_point() +
  geom_label()

# using ggrepel
library(ggrepel)
ggplot(mtcars, aes(wt, mpg, label = rownames(mtcars))) +
  geom_point() +
  geom_text_repel(aes(label = rownames(mtcars)), size = 3.5) +
  labs(title = "Weight and Mileage",
       x = 'Wieght',
       y = "Mileage",
       caption = "By David, Data Vizualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 14))


# Task 1 11/11/2024
library(ggrepel)
ggplot(mtcars, aes(wt, mpg, label = rownames(mtcars))) +
  geom_point() +
  geom_label_repel(aes(label = rownames(mtcars)), size = 3.5) +
  labs(title = "Weight and Mileage",
       x = 'Weight',
       y = "Mileage",
       caption = "By David, Data Vizualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 14))



# Mathematical expression
# A normal curve

ggplot(data.frame(x = c(-3,3)), aes(x = x)) +
  stat_function(fun = dnorm, color = "blue", fill = "red", geom = "polygon", alpha = 0.5) +
  annotate("text", x = 2, y = 0.3, parse = TRUE,
           label = "frac(1,sqrt(2 * pi)) * e ^ {-x^2 / 2}")+
  labs(title = "Normal Distribution",
       x = 'X',
       y = "Y",
       caption = "By David, Data Vizualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 14))


# Task 2: sin and cos
ggplot(data.frame(x = c(-3,3)), aes(x = x)) +
  stat_function(fun = sin, color = "blue") +
  stat_function(fun = cos, color = "red") +
  labs(title = "Sin and Cos",
       x = 'X',
       y = "Y",
       caption = "By David, DV, THU, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 14))


# Adding Lines
library(gcookbook)
ggplot(heightweight, aes(x = ageYear, y = heightIn, colour = sex)) +
  geom_point() +
  geom_hline(yintercept = 60) +
  geom_vline(xintercept = 14) +
  geom_abline(intercept = 37.4, slope = 1.75) +
  labs(title = "Age and Height",
       x = 'Age (Year)',
       y = "Height (Inch)",
       caption = " By David, DV, THU, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 14))


# Adding arrows and line segments

library(dplyr)
library(gcookbook)
ggplot(filter(climate, Source == "Berkeley"), aes(x = Year, y = Anomaly10y)) +
  geom_line() +
  annotate("segment", x = 1950, xend = 1980, y = -.25, yend = -.25) +
  annotate("segment", x = 1850, xend = 1820, y = -.8, yend = -.95,
           colour = 'blue', size = 2, arrow = arrow()) +
  annotate('segment', x = 1950, xend = 1980, y = -.25, yend = -.25,
           arrow = arrow(ends = "both", angle = 90, length = unit(.2,"cm"))) +
  labs(title = "Year and Anomaly",
       caption = " By David, DV, THU, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))


# Adding a shaded rectangle

library(gcookbook)
ggplot(filter(climate, Source == "Berkeley"), aes(x = Year, y = Anomaly10y)) +
  geom_line() +
  annotate("rect", xmin = 1950, xmax = 1980, ymin = -1, ymax = 1,
           alpha = .1, fill = "blue") +
  labs(title = "Year and Anomaly",
       caption = " By David, DV, THU, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))


# Highlight an item
library(dplyr)
pg_mod <- PlantGrowth %>%
  mutate(h1 = recode(group, "ctrl" = "yes", "trt1" = 'no', 'trt2' = 'no'))

ggplot(pg_mod, aes(x = group, y = weight, fill = h1)) +
  geom_boxplot() +
  scale_fill_manual(values = c("#FFDDCC", "grey85"), guide = FALSE) +
  labs(title = "Group and Weight",
       x = 'Group',
       y = 'Weight',
       caption = " By David, DV, THU, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))


# Adding error bars
library(gcookbook)
library(dplyr)

ce_mod <- cabbage_exp %>%
  filter(Cultivar == "c39")

ggplot(ce_mod, aes(x = Date, y = Weight)) +
  geom_col(fill = "white", colour = "black") +
  geom_errorbar(aes(ymin = Weight - se, ymax = Weight + se), width = .2) +
  labs(title = "Date and Weight",
       caption = " By David, DV, THU, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))


# Adding annotations to individual facets

# create the base plot
mpg_plot <- ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_grid(. ~ drv)

# a data frame with labels for each facet
f_labels <- data.frame(drv = c("4", "f", "r"), label = c("4wd", "Front", "Rear"))

mpg_plot +
  geom_text(x = 6, y = 40, aes(label = label), data = f_labels) +
  labs(title = "Engine and Highway Mileage",
       x = "Engine displacement",
       y = 'Highway mileage',
       caption = " By David, DV, THU, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))


# Task 3 : iris

iris_plot <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  facet_grid(. ~ Species)

f_labels <- data.frame(drv = c("setosa", "versicolor", "virginica"), 
                       label = c("Setosa", "Versicolor", "Virginica"))

iris_plot +
  geom_text(x = 6, y = 40, aes(label = label), data = f_labels) +
  labs(title = "Iris",
       x = "Sepal length",
       y = 'Sepal width',
       caption = " By David, DV, THU, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))












