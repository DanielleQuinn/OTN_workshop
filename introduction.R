# ---- Running Code ----
# On windows, Ctrl - Enter to run a line of code
# On Mac Cmd-Enter

# ---- R is a calculator ----
5 + 6
5 - 9
6 * 7
7/13
(4+5)/6

# ---- Conditional Operators ----
# Is 5 equal to 5?
5 == 5

# Is 5 equal to 6?
5 == 6

# Is 5 greater than 6?
5 > 6

# Is 5 greater than or equal to 6?
5 >= 6

# Is 5 not equal to 6?
!5 == 6

# Is 5 equal to 5 AND 7 greater than 6?
5 == 5 & 7 > 6

# Is 5 equal to 5 OR 7 greater than 10?
5 == 5 | 7 > 10

# ---- Functions ----
# Goal: Find the square root of 81
sqrt(81)

# Nesting functions
# Goal: Find the square root of the square root of 81
sqrt(sqrt(81))

# Functions require specific types of arguments
sqrt("a")

# ---- Packages ----
# Packages are collections of functions built by other users

# Step One: Download & install the package to your local library
install.packages("ggplot2") # one time use

# Step Two: Access the package's functions from the local library
library(ggplot2) # every time you start RStudio

# ---- Finding Help ----
# Option 1: Google
# Option 2: Cheat Sheet
# Option 3: Ask R
?mean  # asking about a specific function
??average # searching for a keyword

# ---- Objects ----
# Goal: Find and use the value of pi
pi
pi * 10

# Goal: Make an object called x that contains the value 15
x <- 15
x

# Goal: Make an object called y that contains the value of x plus 3
y <- x + 3
y

# Note: If you update x, y does not update automatically
x <- 150
x
y

# ---- Data Classes ----
# Numeric
mynumber <- 13
class(mynumber)

# Character
myword <- "hello"
class(myword)

# Logical
mytest <- TRUE
class(mytest)

# ---- Data Structures: Vectors ----
# Vector
# Goal: Put all integers between 1 and 10 into the object called myvector
myvector <- 1:10
myvector

# Goal: Apply a function to all elements in a vector
myvector + 30
sqrt(myvector)

# Is each element in myvector greater than 5?
myvector > 5

# Is 11 found in this vector?
11 %in% myvector

# Goal: How many elements are in the vector called myvector?
length(myvector)

# Goal: Create a vector called myseq that contains all odd numbers between 1 and 300.
myseq <- seq(from = 1, to = 300, by = 2)
myseq

# Goal: Create a vector called numbers that contains the numbers 1, 6, 3, 4, and 10
numbers <- c(1, 6, 3, 4, 10) # "c" means "combine" into a vector
numbers

# Goal: Create a vector called fruit that contains the words apple, orange, and kiwi
fruit <- c("apple", "orange", "kiwi")
fruit

# Goal: Create a vector called tests that contains TRUE and FALSE
tests <- c(TRUE, TRUE, TRUE, FALSE)
tests

# ---- Indexing ----
# Goal: What is the 10th element in myseq?
myseq[10]

# Goal: What are the 10th through 15th elements in myseq?
myseq[10:15]

# Goal: What are the 2nd, 4th, and 18th elements in myseq?
myseq[c(2, 4, 18)]

# ---- Characteristics of Vectors ----
# Vectors are "atomic": they can only contain one class of data
class(mynumbers) # numeric
class(myfruit) # character

# Implication: You can't mix characters and numbers
eggs <- c(3, 6, 10, "missing value", 12)
class(eggs)

# Goal: What is the average number of eggs?
mean(eggs)

# Converting vectors
neweggs <- as.numeric(eggs)
neweggs

# Goal: What is the average/minimum/maximum number of eggs?
mean(neweggs)
min(neweggs)
max(neweggs)

# ---- Dealing with NAs ----
# Missing values are represented by NA
mean(neweggs, na.rm = TRUE)
min(neweggs, na.rm = TRUE)
max(neweggs, na.rm = TRUE)

# ---- Data Structures: Data Frames ----
# Each column is a vector (atomic)

# Goal: Create a data frame with a column called "one" containing the values 1 to 5
# and a column called "two" containing the letters a to e. Call this data frame mydata
mydata <- data.frame(one = 1:5, two = c("a", "b", "c", "d", "e"))
mydata

# In standard R syntax, you can extract a column of a data frame as a vector using $
mydata$one
mydata$two

# ---- Importing Data ----
# Goal: Import a .txt file

## Step One: Tell R where to look
setwd("C:/Users/Danielle/Desktop/OTN_Workshop")

## Step Two: Load the data
gapminder <- read.delim("gapminder.txt")
gapminder
