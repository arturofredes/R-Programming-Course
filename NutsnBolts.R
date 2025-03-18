x<-1 #assign
print(x) #explicit printing
x #auto-printing

y<-1:20#creating sequences
y

1/0 #Inf is a number
0/0 # Nan
1L #Integers

## Creating Vectors with c() operator
x <- c(0.5, 0.6) ## numeric
x
x <- c(TRUE, FALSE) ## logical
x
x <- c(T, F) ## logical
x
x <- c("a", "b", "c") ## character
x
x <- 9:29 ## integer
x
x <- c(1+0i, 2+4i) ## complex
x

#initialize vector
x <- vector("numeric", length = 10)
x


## Coercion will change so element so the vector is of the same type
y <- c(1,"a")
class(y)

## Explicit coercion
x <- 0:6
class(x)
as.numeric(x)
as.logical(x) #0 is false an everything bigger is true
as.character(x)

x <- c("a", "b", "c")
as.numeric(x)
as.logical(x)
as.complex(x)

## Lists can contain objects of different classes
x <- list(1, "a", TRUE, 1 + 4i)
x
x <- vector("list", length = 5) #can also be initialized
x


##Matrices
#Matrices are vectors with a dimension attribute. The dimension attribute is itself an integer vector
#of length 2 (number of rows, number of columns)
m <- matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes(m)

#Matrices are constructed column-wise
m <- matrix(1:6, nrow = 2, ncol = 3)
m

# can be created by binding vectors
x <- 1:3
y <- 10:12
cbind(x, y) #column
rbind(x, y) #row

#Factors
#They are like integer vectors but with labels (Male, Female) vs (1,2)

x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)

# See the underlying representation of factor
attr(x,"levels")
unclass(x)
#factors will be automatically created for you when you read a dataset in using a function like read.table()

#order of the levels of a factor can be set using the levels argument to factor()
#otherwise alphabetical order
x <- factor(c("yes", "yes", "no", "yes", "no"),levels = c("yes", "no"))
x

#Missing Values
## Create a vector with NAs in it
x <- c(1, 2, NA, 10, 3)
## Return a logical vector indicating which elements are NA
is.na(x)
## Return a logical vector indicating which elements are NaN
is.nan(x)
## Now create a vector with both NA and NaN values
x <- c(1, 2, NaN, NA, 4)
is.na(x) #Nan is NA
is.nan(x) #NA is not NaN


##DATAFRAMES
x <- data.frame(foo = 1:4, bar = c(TRUE, TRUE, FALSE, FALSE))
x


##NAMES
x <- 1:3
names(x)
names(x) <- c("New York", "Seattle", "Los Angeles")
x
names(x)
#lists can also have names
x <- list("Los Angeles" = 1, Boston = 2, London = 3)
x
names(x)
# we can give names to columns and rows of matrices
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m


##READING TABLES
data <- read.table(file = "example.txt",
                   header = FALSE,
                   sep = " ",
                   colClasses = c("integer", "character", "integer"),
                   nrows = 3,
                   comment.char = "#",
                   skip = 0)

data 
#optimizing reading time

#1. If there are no comments set comment.char = ""
data <- read.table(file = "example.txt",
                   header = FALSE,
                   sep = " ",
                   colClasses = c("integer", "character", "integer"),
                   nrows = 3,
                   comment.char = "",
                   skip = 0)
data 
#2. specify classes. If there are a lot of columns, you can extract the classes the following way
initial <- read.table("example.txt", nrows = 1) #read some rows
classes <- sapply(initial, class) #call class and save them
tabAll <- read.table("example.txt", colClasses = classes)
tabAll
# Calculate RAM usage

##TEXTUAL FORMATS
# Create a data frame
y <- data.frame(a = 1, b = "a")
# We can use dput to save an R object
dput(y)
# Send 'dput' output to a file
dput(y, file = "y.R")
# Read in 'dput' output from a file
new.y <- dget("y.R")
# Verify that the new object is identical to the original
print(new.y)

#We can use dump() to save several objects
# Create objects
x <- "foo"
y <- data.frame(a = 1L, b = "a")
# Dump multiple objects to a file
dump(c("x", "y"), file = "data.R")
# Remove the objects from the environment
rm(x, y)
## Restore the objects from the file using source()
source("data.R")
## Inspect the restored objects
str(y)
print(x)

##Connections
# Open a URL connection for reading
con <- url("https://www.jhu.edu", "r")
# Read the web page
x <- readLines(con)
# Print out the first few lines
head(x)



##SUBSETTING VECTORS
# Create a vector
x <- c("a", "b", "c", "c", "d", "a")

# Extract single elements
x[1]  # First element
x[2]  # Second element

# Extract multiple elements
x[1:4]          # First four elements
x[c(1, 3, 4)]   # Elements at positions 1, 3, and 4

# Subset using logical indexing
u <- x > "a"    # Logical vector
x[u]            # Elements where u is TRUE

# Compact subsetting with a logical expression
x[x > "a"]      # Elements lexicographically after "a"


##SUBSETTING MATRICES
# Create a matrix
x <- matrix(1:6, nrow = 2, ncol = 3)
x

# Access specific elements
x[1, 2]  # Element in the 1st row and 2nd column
x[2, 1]  # Element in the 2nd row and 1st column

# Access entire rows or columns
x[1, ]   # Extract the first row
x[, 2]   # Extract the second column


##SUBSETTING LISTS
# Create a list
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x

# Extract elements using [[
x[[1]]        # Extract the first element
x[["bar"]]    # Extract the element named "bar"

# Extract elements using $
x$bar         # Equivalent to x[["bar"]]

# Computed index with [[
name <- "foo"
x[[name]]     # Extract the element named "foo" using a variable

# Using $ with a non-existent name
x$name        # Returns NULL because "name" is not an element of the list

# Accessing existing elements by name using $
x$foo         # Extracts the element named "foo"

# Extract multiple elements from the list
x[c(1, 3)]  # Extract the 1st and 3rd elements


# Create a nested list
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))

# Get the 3rd element of the 1st element
x[[c(1, 3)]]
# Equivalent to:
x[[1]][[3]]

# Get the 1st element of the 2nd element
x[[c(2, 1)]]


##Partial Matching
# Create a list
x <- list(aardvark = 1:5)

# Extract element using the $ operator
x$a  # Matches the element with partial matching (returns 1:5)

# Extract element using [[ without partial matching
x[["a"]]  # Returns NULL because "a" is not an exact name in the list

# Extract element using [[ with partial matching
x[["a", exact = FALSE]]  # Matches "aardvark" and returns 1:5


##REMOVING NA VALUES
# Create vectors
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")

# Identify missing values in `x`
bad <- is.na(x)
print(bad)      # Logical vector indicating NA positions
x[!bad]         # Subset of `x` without missing values

# Identify complete cases across `x` and `y`
good <- complete.cases(x, y)
print(good)     # Logical vector indicating complete cases

# Subset `x` and `y` using complete cases
x[good]         # Subset of `x` with no missing values
y[good]         # Subset of `y` with no missing values


##VECTORIZED OPERATIONS
# Create two vectors
x <- 1:4
y <- 6:9

# Vectorized addition
z <- x + y
print(z)  # [1] 7 9 11 13

# Logical comparisons
print(x > 2)   
print(x >= 2)   
print(x < 3)    
print(y == 8)   

# Other vectorized operations
print(x - y)  
print(x * y) 
print(x / y)   


##MATRICES
# Create two matrices
x <- matrix(1:4, 2, 2)
y <- matrix(rep(10, 4), 2, 2)

# Element-wise multiplication
x * y

# Element-wise division
x / y

# True matrix multiplication
x %*% y





