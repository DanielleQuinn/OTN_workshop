# ---- Load packages ----

# ---- Import Data ----

# ---- Explore Data ----

# ---- Factors ----

# Goal: What are the levels of continent?

# Goal: What would this column look like if it was treated as a number?

# ---- Subsetting Data with {dplyr} ----
# select() : selects columns from a data frame

# Goal: Output the columns called continent and lifeExp

# filter() : filters rows from a data frame

# Goal: Output the rows that correspond to data from 1997

# Goal: Output the rows that correspond to data from Europe and Asia

# Goal: Ouput the columns called year, country, and pop,
# but only include the rows corresponding to data collected since 2000

# ---- Summarising Data with {dplyr} ----
# group_by() : splits your data into groups based on the variables you specify

# summarise() : returns a value based on the instructions you give it

# Goal: What is the average population of each continent?

# Goal: What is the average and sd of population of each continent?

# Goal: Prior to 1970, what is the average and minimum lifeExp for each continent, by year?

# count() : counts occurences

# Goal: How many records of each continent?

# n() : counts occurences in each group using summarise()

# Goal: How many records of each continent?

# n_distinct() : count unique values in each group using summarise()

# Goal: How many countries in each continent?

# ---- Manipulating Data with {dplyr} ----
# mutate() : create a new column based on another column

# Goal: How much has the annual gdpPercap changed in each country?

# ---- Capstone {dplyr} Exercise ----
# What was the change in population for each country between 2002 and 2007?
# Create a table called table1 with columns: country, continent, and pop_change

# Using this information, calculate the average change in population in 2007, by continent.

# ---- Visualizations in {ggplot2} ----
# Any visualization has three components:
# 1. a data set (What are you trying to look at?)
# 2. a coordinate system (The most common are x and y axes)
# 3. a geom (How do you want to visualize the data set on the coordinate system?)
# ggplot2 uses layers to build plots

# ---- Starting with ggplot() ----
# Initialize ggplot()

# 1. Specify a data set

# 2. Specify a coordinate system

# 3. Specify a geom

# Goal: Create a scatterplot with year on the x axis and lifeExp on the y axis

# Goal: Create a boxplot with continent on the x axis and gdpPercap on the y axis

# Goal: Create a histogram of lifeExp

# ---- Adding Colour ----
# Goal: Make points blue  

# Goal: Make the color of each point based on continent

# Goal: Add a layer to this plot where each country is represented by a line

# ---- ggplot() as an Object ----
# Store ggplot plots as an object

# Add layers to existing plots

# ---- Facetting ----
# Goal: Add a layer to plot2 that creates a separate panel for each continent

# Goal: Adjust the y-axis to fit the data in each panel

# Goal: Arrange the panels as a single column

# ---- Aesthetics ----
# Goal: Change the x and y axis labels

# Goal: Tidy up the background colours

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
# (e) add points
# (f) colour points based on gdpPercap
# (g) make points triangles (r cookbook for help..!)
# (h) specificy that low values are red and high values are green
# (i) name the legend GDP per Capita
# (j) store your final plot in an object called myfigure

# As you solve each piece, add an "x" next to it on the etherpad
# https://etherpad.net/p/2019-05-14-otn

# Saving plots to your current working directory
