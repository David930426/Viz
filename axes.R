#
# David
# 2024/11/25
# Axes
#

library(ggplot2)
ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot() +
  labs(title = "Group VS Weight",
       caption = "By David, DV, THU, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))



ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot() +
  coord_flip()+
  labs(title = "Weight VS Group",
       caption = "By David, DV, THU, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))



library(ggplot2)
library(gridExtra)

p1 <- ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot() +
  labs(title = "Group VS Weight",
       caption = "By David, DV, THU, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

p2 <- ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot() +
  coord_flip()+ 
  labs(title = "Weight VS Group",
       caption = "By David, DV, THU, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))

grid.arrange(p1, p2, ncol = 2,
             top = 'Arrange two plots side by side')
