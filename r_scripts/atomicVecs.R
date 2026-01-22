# this is a  document describing vecotrs in r
# 22nd jan 2026
# Jackson D'Elia


#-----------------------------------------------------------------------
#START OF SCRIPT

x <- 5
print(x)
x

plant_height_and_this_and_that <- 3 #snake case
plantHeightThisThat <- 4 #camel case
plant.height <- 2 #not preferred, evil

. #reserved for temporary variable


# 1D atomic vector:
z <- c(3.2, 5, 5, 6)
print(z)
typeof(z)


z <- c(c(3.2,3),c(3,5))
z
is.numeric(z)
is.character(z)

#character strings
t <- "perch"
print(t)

t <- c("perch", "bass", "trout")
print(t)

t[1]
t[3]

typeof(t)
is.numeric(t)


#logical / Boolean
z <- c(TRUE, FALSE, TRUE)
print(z)

is.logical(z)
typeof(z)

#can also be writen as T or F rather than TRUE or FALSE
c(T,F)

mean(z) #percent of TRUES, since booleans are 1s and 0s

# vector properties
z <- c(1.1, 1.2, 3, 4)

#type of asks what something is
#is asks a t/f statement
#as changes the value to a different type of variable

t <- as.character(z)
print(z)
typeof(z)

length(z) #how long is the variable string?

#random number gen
z <- runif(5)
names(z)
print(z)

names(z) <- c("A", "B", "C", "D", "E") #adds names
print(z)
mean(z)

names(z) <- NULL
names (z)


#special data types
z <- c(3.2, 3, 3, NA)
print(z)
typeof(z)
length(z)
typeof(z[3])
typeof(z[4])


sum(z) #NA stops the sum
sum(z, na.rm=T) #says to ingore the NA values


z <- 0/0
z
z <- 1/0
z

#vectorization
z <- c(10, 20, 30)
z + 1
z/3
z
y <- c(1, 2, 3)

z+y


# recycling

x <- c(1, 2)
z+x
#vectors of different lengths will loop through at different tempos

z+x
