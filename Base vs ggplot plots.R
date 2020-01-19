# 
# Title:    Base vs ggplot plots
# Purpose:  (Analytics Blog) comparing base scatter plot to ggplot scatter plot
# Author:   Billy Caughey
# Date:     2020.01.19 - Initial build
# 

##### Libraries #####

library(tidyverse)
library(ggplot2)

##### Bring in the data #####

data("faithful")

##### Base Plot #####
names(faithful)
with(faithful, plot(x = waiting, y = eruptions))
title("Eruption time vs Waiting Time")

##### ggplot - with a few options #####
faithful %>%
    ggplot(aes(x = waiting, y = eruptions)) +
    geom_point(alpha = 0.5, size = 2) +
    ggtitle("Eruption time vs Waiting Time") +
    labs(x = "Waiting Time",
         y = "Eruption Time") +
    theme_bw() +
    theme(axis.title.x = element_text(size = 14),
          axis.text.x = element_text(size = 12),
          axis.title.y = element_text(size = 14),
          axis.text.y = element_text(size = 12),
          plot.title = element_text(size = 20)) 