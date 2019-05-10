# ---- Load packages ----
library(dplyr)
library(ggplot2)

# ---- Import Data ----
gapminder <- read.csv("gapminder.csv")

# ---- Explore Data ----
head(gapminder)
summary(gapminder)
nrow(gapminder)
names(gapminder)
str(gapminder)

# ---- Factors ----
class(gapminder$continent)

# Goal: What are the levels of continent?
levels(gapminder$continent)

# Goal: What would this column look like if it was treated as a number?
as.numeric(gapminder$continent) # This doesn't change the object unless you overwrite the existing column

# ---- Subsetting Data with {dplyr} ----
# select() : selects columns from a data frame
# Example: Output the column called pop
select(gapminder, pop)

# Goal: Output the columns called continent and lifeExp
select(gapminder, continent, lifeExp)

# filter() : filters rows from a data frame
# Example: Output the rows where lifeExp is greater than or equal to 80
filter(gapminder, lifeExp >= 80)

# Goal: Output the rows that correspond to data from 1997
filter(gapminder, year == 1997)

# Goal: Output the rows that correspond to data from Europe and Asia
filter(gapminder, continent %in% c("Europe", "Asia"))

# ---- Pipes ----
# Information is put into a pipe. When it "comes out" the other
# side, a function is applied to it

# Goal: Find the square root of the square root of 81
81 %>%
  sqrt() %>%
  sqrt()

# Goal: Output the rows that correspond to data from Europe and Asia
gapminder %>%
  filter(continent %in% c("Europe", "Asia"))

# Goal: Ouput the columns called year, country, and pop,
# but only include the rows corresponding to data collected since 2000
gapminder %>%
  filter(year > 2000) %>%
  select(year, country, pop)

# ---- Summarising Data with {dplyr} ----
# group_by() : splits your data into groups based on the variables you specify
# Example: Group by country
gapminder %>%
  group_by(country)

# summarise() : returns a value based on the instructions you give it
# Example: Find the maximum lifeExp
gapminder %>%
  summarise(max(lifeExp))

# Goal: What is the average population of each continent?
gapminder %>%
  group_by(continent) %>%
  summarise(mean(pop))

# This can be stored as a data frame
pop_averages <- gapminder %>%
  group_by(continent) %>%
  summarise(mean(pop))
pop_averages

# Goal: What is the average and sd of population of each continent?
gapminder %>%
  group_by(continent) %>%
  summarise(average = mean(pop),
            sdev = sd(pop))

# Goal: Prior to 1970, what is the average and minimum lifeExp for each continent, by year?
gapminder %>%
  filter(year < 1970) %>%
  group_by(continent, year) %>%
  summarise(average = mean(lifeExp),
            minimum = min(lifeExp))

# count() : counts occurences

# Goal: How many records of each continent?
gapminder %>%
  count(continent)

# n() : counts occurences in each group using summarise()

# Goal: How many records of each continent?
gapminder %>%
  group_by(continent) %>%
  summarise(mycount = n())

# n_distinct() : count unique values in each group using summarise()

# Goal: How many countries in each continent?
gapminder %>%
  group_by(continent) %>%
  summarise(unique = n_distinct(country))

# ---- Manipulating Data with {dplyr} ----
# mutate() : create a new column based on another column
# Example: Create a column called gdp with the gross domestic product
gapminder %>%
  mutate(gdp = gdpPercap * pop)

# To make this change permanent, overwrite the data frame
gapminder <- gapminder %>%
  mutate(gdp = gdpPercap * pop)

# Goal: How much has the annual gdpPercap changed in each country?
gapminder %>%
  group_by(country) %>%
  mutate(change_gdp = gdpPercap - lag(gdpPercap))

# ---- Capstone {dplyr} Exercise ----
# What was the change in population for each country between 2002 and 2007?
# Create a table called table1 with columns: country, continent, and pop_change
table1 <- gapminder %>%
  group_by(country) %>%
  mutate(pop_change = pop - lag(pop)) %>%
  filter(year == 2007) %>%
  select(country, continent, pop_change)
table1

# Using this information, calculate the average change in population in 2007, by continent.
table1 %>%
  group_by(continent) %>%
  summarise(mean(pop_change))

# ---- Visualizations in {ggplot2} ----
# Any visualization has three components:
# 1. a data set (What are you trying to look at?)
# 2. a coordinate system (The most common are x and y axes)
# 3. a geom (How do you want to visualize the data set on the coordinate system?)
# ggplot2 uses layers to build plots

# ---- Starting with ggplot() ----
# Initialize ggplot()
ggplot()

# 1. Specify a data set
ggplot(gapminder)

# 2. Specify a coordinate system
ggplot(gapminder, aes(x = year, y = pop))

# 3. Specify a geom
ggplot(gapminder, aes(x = year, y = pop)) +
  geom_point()

ggplot(gapminder) +
  geom_point(aes(x = year, y = pop))

# Goal: Create a scatterplot with year on the x axis and lifeExp on the y axis
ggplot(gapminder) +
  geom_point(aes(x = year, y = lifeExp))

# Goal: Create a boxplot with continent on the x axis and gdpPercap on the y axis
ggplot(gapminder) +
  geom_boxplot(aes(x = continent, y = gdpPercap))

# Goal: Create a histogram of lifeExp
ggplot(gapminder) +
  geom_histogram(aes(x = lifeExp))

# ---- Adding Colour ----
# Goal: Make points blue  
ggplot(gapminder) +
  geom_point(aes(x = year, y = pop), col = "blue")

# Goal: Make the color of each point based on continent
ggplot(gapminder) +
  geom_point(aes(x = year, y = pop, col = continent))

# Goal: Add a layer to this plot where each country is represented by a line
ggplot(gapminder) +
  geom_point(aes(x = year, y = pop, col = continent)) +
  geom_line(aes(x = year, y = pop, group = country, col = continent))

ggplot(gapminder, aes(x = year, y = lifeExp, col = continent)) +
  geom_point() +
  geom_line(aes(group = country))

# ---- ggplot() as an Object ----
# Store ggplot plots as an object
plot1 <- ggplot(gapminder, aes(x = year, y = lifeExp, col = continent))+
  geom_point()
plot1

# Add layers to existing plots
plot2 <- plot1 + geom_line(aes(group = country))
plot2 # show plot2

# ---- Facetting ----
# Goal: Add a layer to plot2 that creates a separate panel for each continent
plot2 + facet_wrap(~continent)

# Goal: Adjust the y-axis to fit the data in each panel
plot2 + facet_wrap(~continent, scales = "free_y")

# Goal: Arrange the panels as a single column
plot2 + facet_wrap(~continent, scales = "free_y", ncol = 1)

# ---- Aesthetics ----
# Goal: Change the x and y axis labels
plot2 +
  facet_wrap(~continent, scales = "free_y", ncol = 1) +
  ylab("Life Expectancy") +
  xlab("Year")

# Goal: Tidy up the background colours
plot2 +
  facet_wrap(~continent, scales = "free_y", ncol = 1) +
  ylab("Life Expectancy") +
  xlab("Year") +
  theme_bw()

# ---- Capstone {ggplot2} Exercise ----
# Reproduce the plot found here:
# https://github.com/DanielleQuinn/OTN_workshop/blob/master/GapMinderReport.pdf

# Tip: Make a list of what needs to be done and
# tackle one thing at a time.

# Here is a list of things you'll
# need to do; see how many you can accomplish
# and don't be afraid to consult resources!

# data preparation:
# (a) subset data to only include rows where year is 2007

# plotting:
# (a) boxplots with continent on x axis and life expectancy on y axis
# (b) x axis label is Continent
# (c) y axis label is Life Expectancy
# (d) theme is black and white
# (e1) add points
  # (e2) hmm.. why do my points line up over continent?
    ## hint: try geom_jitter()
# (f) colour points based on gdpPercap
# (g) make points triangles (r cookbook for help..!)
# (h) specificy that low values are red and high values are green
    ## hint: try using the terms "ggplot" "colour" and "gradient"!
# (i) name the legend GDP per Capita
    ## hint: add "name =" argument to step i!
# (j) store your final plot in an object called myfigure

# As you solve each piece, add an "x" next to it on the etherpad
# https://etherpad.net/p/2019-05-14-otn

# Solution:
myfigure <- gapminder %>% 
  filter(year == 2007) %>%
  ggplot() +
  geom_boxplot(aes(x = continent, y = lifeExp)) +
  geom_jitter(aes(x = continent, y = lifeExp, col = gdpPercap),
              shape = 17, width = 0.25) +
  scale_colour_gradient(low = "red", 
                        high = "green",
                        name = "GDP per Capita") +
  xlab("Continent") + ylab("Life Expectancy") +
  theme_bw(12)
myfigure

# Saving plots to your current working directory
ggsave("myfigure.png", myfigure)
