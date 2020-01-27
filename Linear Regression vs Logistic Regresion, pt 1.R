# 
# Title:    Linear Regression vs Logistic Regresion, pt 1
# Purpose:  Develop a linear regression using the Auto MPG data from UCI
# Author:   Billy Caughey
# Date:     2020.01.26 - Initial Build
# 

##### Libraries #####
library(tidyverse)
library(ggplot2)
library(lubridate)
library(MASS)

##### Bring in the data #####

uci <- "https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data"

df1 <- read.table(file = url(uci),
                  stringsAsFactors = F,
                  col.names = c("mpg","cylinders","displacement","horsepower",
                                "weight","acceleration","year","origin","car_name")) %>%
    mutate(year = 1900 + year,
           years_old = year(Sys.Date()) - year) %>%
    filter(horsepower != "?",
           cylinders %in% c(4,6,8)) %>%
    mutate(horsepower = as.numeric(horsepower),
           cylinders = factor(cylinders)) %>%
    select(-origin, -car_name, -year)
    

plot(df1 %>% filter(cylinders == "4") %>% select(-origin, -car_name))

mod1 <- lm(mpg ~ cylinders + displacement + horsepower + weight + acceleration + years_old,
           data = df1)
summary(mod1)


stepAIC(mod1, direction = "both", trace = T)

summary(lm(mpg ~ weight + years_old, data = df1))
