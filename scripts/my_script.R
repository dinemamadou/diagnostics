library(ggfortify)
library(tidyverse)

mod1 <- lm(mpg ~ wt, data = mtcars)
summary(mod1)

mtcars %>%
  ggplot(., aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth()
#1 the regression line is linear in parameters, eyeball it.
#2 check the mean of the residual to make sure it's zero
mean(mod1$residuals)
summary(mod1)

#Homoskedasticity of residuals or equal variance. look for a blob to see whether HScity is a thing

autoplot(mod1, which = c(1, 3)) #plot 1 and plot 3 have been picked out from a total of 6 plots

#No autocorrelation of residuals
acf(mod1$residuals) #visual inspection
lmtest::dwtest(mod1) #lmtest is the package and dwtest is the function. ()

#6 normality of the residuals
autoplot(mod1, which = 2) #which picks out a plot
autoplot(mod1)

#this functions saves our data in a folder inside our project

write_csv(x = mtcars, path = "./data/my_data.csv")
