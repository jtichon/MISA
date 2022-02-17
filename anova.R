# Enter Data
Amber <- c(60.6, 52.2, 57.1, 64.2, 51.2, 48.9, 52.9, 57.0, 
           60.2, 64.1, 50.6, 53.3, 60.7)
Eric <- c(59.0, 55.4, 56.3, 58.9, 59.9, 48.3, 41.3, 57.0,
          49.3, 41.1, 53.3, 51.7)
Junyi <- c(51.6, 55.8, 62.5, 55.3, 64.1, 48.9, 62.6, 53.5, 
           58.2, 55.1, 67.1, 59.4, 60.7, 60.1, 54.6)

# Summary Statistics
mean(Amber)
var(Amber)
mean(Eric)
var(Eric)
mean(Junyi)
var(Junyi)

# Fit ANOVA
scores<- c(Amber, Eric, Junyi)
name <- c(rep("Amber", 13), rep("Eric", 12), rep("Junyi", 15) )
bridge <- data.frame(scores, name)
bridge.anova<- aov(scores~name, data = bridge)
summary(bridge.anova)

# Data Visualization
library(tidyverse)
g <- ggplot(bridge, aes(x = name, y = scores, col = name))
g + geom_boxplot() +
  ggtitle("Side-by-side Boxplots of Bridge Scores")