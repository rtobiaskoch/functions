#Header code####
#********************************************************************************
wd = "/Users/user/Desktop/R Directory"
wd2 = "/Biostats"
setwd(paste(wd,wd2, sep = ""))
#********************************************************************************
#Misc####
#Clearing data
rm(list=ls(all=T))
   graphic.off()
   
   
   
   # sort()
   # Intersect()
   # Union()
   # setdiff()
   # which() get indices where condition is satisfied
   # x[which(x=>2)]

     
   
#***************************************************************
#Arithmetic Functions####
#***************************************************************

x = c(1,5,3,6) #values
y = c(4,3,1,6) #frequency aka count of values
weighted.mean(x,y)
rm(x,y)


#***************************************************************
#                 Built in Datasets####
#***************************************************************
#find complete list of datasets using data()
#iris
#mtcars
#InsectSprays
#PlantGrowth
#ToothGrowth
#USArrests
#USAccDeaths

#***************************************************************
#Creating data####
#***************************************************************
x = "Hello"
y = "World"
   
#combines two object strings into one   
paste(x,y) 
#can combine named objects or character strings
paste(x,y,"!")

#making a sequence
seq(1,100, by = 5)

#sample of random number integers in a range
#can be used to pull rows in data.frame by the index
sample(c(1:100), replace = F)

#random numeric variables
runif(10, min = 0, max = 1)

#random normally distribution variables
rnorm(10, mean = 0, sd = 1)

#manual data
Nation = c("Australia", "Canada", "Belgium")
PCE = c(1032, 1093, 980)

#making it a Dataframe
dt = data.frame(Nation, PCE)

#Adding a column
dt$group = c("a", "a", "b")

#adding Ranked column
dt$Rank = order(dt$PCE)


#***************************************************************
#                       Reading Data ####
#***************************************************************
#read from html
library(rvest)
#data = read_html("url")
#page_table = html_table(html_nodes(data, "table"), fill = T)

#data = read.csv("")

#***************************************************************
#                       Matrix ####
#***************************************************************
my_mat =
   matrix(c(2343, 1232, 1254, 4000),
          nrow = 2,
          ncol = 2,)

rownames(my_mat) = c("tall", "short")
colnames(my_mat) = c("men", "women")

#***************************************************************
#              SORTING & ORDERING ####
#***************************************************************
#*
#by rows
dt2 = dt[order(dt$PCE, decreasing = T),]

sort(x)
rank(x)
order(x)

#***************************************************************************
#custom ORDER data by levels
#****************************************************************************

#sort by new custom order
dt = dt[order(mtcars$mpg
              ),
       ]
#calculating number of elements
length(mtcars$mpg)

#sort by mpg
newdata <- mtcars[order(mtcars$mpg),]

# sort by mpg and cyl
newdata <- mtcars[order(mtcars$mpg, mtcars$cyl),]

#sort by mpg (ascending) and cyl (descending)
newdata <- mtcars[order(mtcars$mpg, -mtcars$cyl),]

#Custom Order
#changing data to factor
iris$Species = as.factor(iris$Species)

#2 custom sort data by levels by making it an ordered factor
iris$Species = ordered(iris$Species, 
                       levels= c ("setosa", "versicolor",  "virginica")
) 


#Sorting by Columns
#you can achieve this by creating a vector of old column position
#to new ones

x <- iris[ , c(5, 1:4)]

#or you can do it by name
colnames(iris)

cname <- c("Species", "Sepal.Length", "Sepal.Width", "Petal.Length",
           "Petal.Width")

x = iris[ , cname]  

#you can also use this to subset your data

#***************************************************************
#                    Data Manipulation####
#***************************************************************

#make rownames a column
d = USArrests
d <- cbind(rownames(d), data.frame(d, row.names=NULL))

#rename column
#*****************************************************************
#names(data)[column number] =  paste("new name") #rename column

names(mtcars)[1] =  paste("new name")

#quickly sum categorical data using 
table(iris$Species)

#GROUPING DATA
#*****************************************************************
#break up continuous data into groups
iris$x = cut(iris$Sepal.Width, #call data
    breaks = c(0,2,3,4,5),  #define bins
    labels = c("g1", "g2", "g3","g4")) #name groups



#***************************************************************
#                    Subsetting Data ####
#***************************************************************
#data [ rows, columns]
#subset by 1 variable
#subset(dataframe, column == x)
subset(mtcars, cyl ==4)

#subset by 2+ variables
subset(mtcars, cyl %in% c(4,5),
       select = c("mpg", "cyl", "disp", "hp")
       )

#***************************************************************
#                    Transposing Data ####
#***************************************************************
x = mtcars
y = t(mtcars)


#***************************************************************
               #Descriptive Statistics####
#***************************************************************

#quick frequency data
table(iris$Species)

#summaryBy(DepVar ~ GroupingVar, 
#         data=dataFrame, 
#          FUN=summaryMeasure no parenthesis)

library(doBy)
summaryBy(mpg ~ cyl, 
          data=mtcars, 
          FUN= c(length, mean, median, sd, IQR))



#***************************************************************
#                    Plotting                         ####
#***************************************************************

#plot hist
hist(mtcars$mpg, breaks = 10)

#plotting density curve 
plot(density(mtcars))

#scatterplot 1 var
plot(mtcars$mpg)


#scatterplot 2 var
plot(mtcars$mpg, mtcars$cyl, col = "cadetblue4")

#adding second var
par(new = T)
plot(mtcars$mpg, mtcars$disp,col = "lightpink3")

#barplot
x = table(iris$Species)
barplot(x)

#plotting a boxplot
#syntax boxplot(y ~ x)
boxplot(mtcars$mpg ~ mtcars$cyl)

#***************************************************************
#                    LOOPING                        ####
#***************************************************************

#SAPPLY


#     FOR LOOPS
nht = scale(iris$Petal.Length)
x = c(3, 2.58, 1.96, 1.65, 0)  #value to be looped
y = c(-1.65, -1.96, -2.58, -3) #value to be looped

a = rep(NA, 5) #storing variable
b = rep(NA, 4) #storing variable

for(i in 1:5 ) {
   a[i] <- nrow(subset(nht, nht > x[i])) / nrow(nht)
}

for(i in 1:4 ) {
   b[i] <- nrow(subset(nht, nht < y[i])) / nrow(nht)
}

print(c(a,b))

#***************************************************************
#                    APPLY                        ####
#***************************************************************
x = subset(ToothGrowth, supp = "VC")
y = subset(ToothGrowth, supp = "OJ")
z = c(x,y)

x = spread(ToothGrowth, supp)
apply(z,1, mean)
sapply()

#***************************************************************
#                    STATS                       ####
#***************************************************************

#WORKING WITH ZSCORES

#what would a student need to score to be in the 90th percentile
# if mean is 100 and sd is 15?
qnorm(.90, 100, 15)
#answer 119.2233

#the reverse of this is pnorm. What percentile is a score of 119.2233?
pnorm(119.2233, 100, 15)
#answer is 90, so 90th percentile

#NOTE: if you only input your x, it will provide your z score which is essentially
#the same as the test score value

#***************************************************************
#                    OUTLIER                       ####
#***************************************************************
outwtR = subset(wt, wt > mean(wt)+3*sd(wt))
outwtL = subset(wt, wt < mean(wt) - 3*sd(wt))







