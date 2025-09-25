
library(readxl)
library(tidyverse)

bikesData <- read_excel("bikes.xlsx")
head(bikesData)

arrange(select(bikesData, model, price), desc(price))

filter(select(bikesData, model, price), price > mean(bikesData$price))


