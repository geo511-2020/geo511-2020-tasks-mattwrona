library(ggplot2)

data(iris)
iris$Petal.Length

petal_length_mean <- mean(iris$Petal.Length)
petal_length_mean

hist(iris$Petal.Length)
