#
# David
# 12/02/2024
# Overall Appearance
#

library(gcookbook)
library(ggplot2)
library(gridExtra)

# ggtitle
ggplot(heightweight, aes(x = ageYear, y = heightIn)) +
  geom_point() +
  ggtitle('Age and Height:', 'From heightweight dataset')


# Task 1 + bonus
p1 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() + 
  ggtitle('Sepal Length and Sepal Width', 'Iris') +
  labs(x = 'Sepal Length',
       y = 'Sepal Width')

p2 <- ggplot(iris, aes(x = Sepal.Width, y = Petal.Length)) +
  geom_point() + 
  ggtitle('Sepal Width and Petal Length', 'Iris') +
  labs(x = 'Sepal Length',
       y = 'Sepal Width') +
  theme(plot.title = element_text(hjust = 0.5), 
        plot.subtitle = element_text(hjust = 0.5))

p3 <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Width)) +
  geom_point() + 
  ggtitle('Sepal Length and Petal Width', 'Iris') +
  labs(x = 'Sepal Length',
       y = 'Sepal Width') +
  theme(plot.title = element_text(hjust = 1),
        plot.subtitle = element_text(hjust = 1))

grid.arrange(p1, p2, p3, ncol = 3,
             top = 'Subplots')


# size, lineheight, family = 'Times', face = 'bold.italic', colour
p2 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() + 
  ggtitle('Sepal Length and Sepal Width', 'Iris') +
  labs(x = 'Sepal Length',
       y = 'Sepal Width') +
  theme(plot.title = element_text(hjust = 0.5,
                                  size = 16,
                                  lineheight = .9,
                                  family = 'Times',
                                  face = 'bold.italic',
                                  colour = 'red'),
        plot.subtitle = element_text(hjust = 0.5))

p1 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() + 
  ggtitle('Sepal Length and Sepal Width', 'Iris') +
  labs(x = 'Sepal Length',
       y = 'Sepal Width') +
  theme(axis.title.x = element_text(size = 16,
                                  lineheight = .9,
                                  family = 'Times',
                                  face = 'bold.italic',
                                  colour = 'red'),
        plot.subtitle = element_text(hjust = 0.5))

grid.arrange(p1, p2, ncol = 2, top = 'Title Font and Color')



# Playing with theme
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() + 
  ggtitle('Sepal Length and Sepal Width', 'Iris') +
  labs(x = 'Sepal Length',
       y = 'Sepal Width') +
  theme_classic()

# Task 2
p1 <- ggplot(heightweight, aes(x = ageYear, y = heightIn)) + 
  geom_point() +
  ggtitle('Age and Height of Schoolchildren', '11.5 to 17.5 years old')


p2 <- p1 + theme_minimal()

p3 <- p3 + theme_classic()

grid.arrange(p1, p2, p3, ncol = 3,
             top = 'Various Theme')

# economist
library(ggthemes)
p <- ggplot(heightweight, aes(x = ageYear, y = heightIn)) + 
  geom_point() +
  ggtitle('Age and Height of Schoolchildren', '11.5 to 17.5 years old')

p + theme_economist() +
  scale_color_economist()

# stata
p <- theme_stata() +
  scale_color_stata()

p + theme_wsj() +
  scale_colour_wsj('red_green')

# calc
p + theme_calc() +
  scale_color_calc()

# panel.grid.major
p + theme(panel.grid.major = element_line(color = 'red'),
          panel.grid.minor = element_line(color = 'red', 
                                          linetype = 'dashed',
                                          size = .2),
          panel.border = element_rect(color = 'blue', 
                                      fill = NA,
                                      size = 2))

#create own theme
myTheme <- theme(panel.grid.major = element_line(color = 'red'),
                 panel.grid.minor = element_line(color = 'red', 
                                                 linetype = 'dashed',
                                                 size = .2),
                 panel.border = element_rect(color = 'blue', 
                                             fill = NA,
                                             size = 2))

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point() +
  labs(x = 'Sepal Length',
       y = 'Sepal Width') +
  ggtitle('Sepal Length and Sepal Width') + 
  myTheme


# Hidding grid lines
hw_plot <- ggplot(heightweight, aes(x = ageYear, y = heightIn))+
  geom_point()

hw_plot + theme(panel.grid.major.x = element_blank(),
                panel.grid.minor.x = element_blank())

hw_plot + theme(panel.grid.major.y = element_blank(),
                panel.grid.minor.y = element_blank())


