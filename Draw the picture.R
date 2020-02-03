#
# Title:    Draw the picture
# Purpose:  (Blog Post) Showing the need for visuals
# Authors:  Billy Caughey
# Date:     2020.01.20 - Initial Build
# 

##### Libraries #####

library(tidyverse)
library(ggpubr)

##### Build a table #####

data("iris")

##### Summary Statistics #####

iris.summary <- iris %>%
    group_by(Species) %>%
    summarize(sepal.length.mean = mean(Sepal.Length, na.rm = T),
              sepal.length.sd = sd(Sepal.Length, na.rm = T),
              sepal.width.mean = mean(Sepal.Width, na.rm = T),
              sepal.width.sd = sd(Sepal.Width, na.rm = T),
              petal.length.mean = mean(Petal.Length, na.rm = T),
              petal.length.sd = sd(Petal.Length, na.rm = T),
              petal.width.mean = mean(Petal.Width, na.rm = T),
              petal.width.sd = sd(Petal.Width, na.rm = T)) %>%
    t()

iris.summary

##### visuals ##### 

sl <- iris %>%
    ggplot(aes(x = Sepal.Length, color = Species)) +
    geom_density(size = 2) +
    xlab("Sepal Length")+
    theme_bw() +
    theme(axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          axis.title.y = element_blank(),
          axis.text.x = element_text(size = 16),
          axis.title.x = element_text(size = 20),
          legend.title = element_blank(),
          legend.text = element_text(size = 14)) 


sw <- iris %>%
    ggplot(aes(x = Sepal.Width, color = Species)) +
    geom_density(size = 2) +
    xlab("Sepal Width")+
    theme_bw() +
    theme(axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          axis.title.y = element_blank(),
          axis.text.x = element_text(size = 16),
          axis.title.x = element_text(size = 20),
          legend.title = element_blank(),
          legend.text = element_text(size = 14))

pl <- iris %>%
    ggplot(aes(x = Petal.Length, color = Species)) +
    geom_density(size = 2) +
    xlab("Petal Length")+
    theme_bw() +
    theme(axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          axis.title.y = element_blank(),
          axis.text.x = element_text(size = 16),
          axis.title.x = element_text(size = 20),
          legend.title = element_blank(),
          legend.text = element_text(size = 14)) 


pw <- iris %>%
    ggplot(aes(x = Petal.Width, color = Species)) +
    geom_density(size = 2) +
    xlab("Petal Width")+
    theme_bw() +
    theme(axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          axis.title.y = element_blank(),
          axis.text.x = element_text(size = 16),
          axis.title.x = element_text(size = 20),
          legend.title = element_blank(),
          legend.text = element_text(size = 14))

ggarrange(sl, sw, pl, pw, ncol = 2, nrow = 2, common.legend = TRUE, legend = "bottom")