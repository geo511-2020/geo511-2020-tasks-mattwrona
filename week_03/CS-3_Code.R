library(ggplot2)
library(gapminder)
library(dplyr)

# Filter kuwait
gapminder_filter <- gapminder %>%
  filter(!country == "Kuwait")

# Plot 1

ggplot(gapminder_filter, aes(x = pop, y = gdpPercap, color = continent, size = pop / 100000)) +
  geom_point() +
  scale_y_continuous(trans = "sqrt") +
  facet_wrap(~year,nrow=1) +
  theme_bw() +
  labs(x = "Life Expectancy", y = "GDP per capita")

# Plot 2

gapminder_continent <- gapminder_filter %>%
  group_by(continent, year) %>%
  summarize(pop = sum(as.numeric(pop), 
                      gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop)))

ggplot(gapminder_continent, aes(x = year, y = gdpPercap)) +
  geom_line() +
  geom_point() +
  geom_line(data=gapminder_continent,aes(x = year , y = gdpPercapweighted , 
                                         color = "black")) +
  geom_point(data=gapminder_continent, aes(x = year , y = gdpPercapweighted , 
                                           color = "black", size = pop / 100000)) +
  facet_wrap(~year,nrow=1) +
  theme_bw() +
  labs(x = "Year", y = "GDP per capita")

#ggsave()


