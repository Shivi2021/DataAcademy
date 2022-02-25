#Task1 

#Write an R program to create three vectors a, b, c with 5 #integers.
a <- c(1,2,3,4,5)
b <- c(6,7,8,9,10)
assign('c',c(11,12,13,14,15))

#Combine the three vectors to become a 3×5 matrix where each column represents a vector
#d <- matrix(c(a,b,c),nrow=3,ncol=5)
e <- rbind(a,b,c)

#Print the content of the matrix. 
print(e)

#Plot a graph and label correctly
point(e)


#Task2 

#Write a R program to create a Data frames which contain details of 5 employees
#and display the details. (Name, Age,Role and Length of service).

Name <-c('Jhon','Tom','Prajwal','Isha','Kate')
Age <-c(28,30,34,27,40)
Role <-c('Software Tester','Data Analyst','Software Engineer','System Analyst','Consultant')
Lengthofservice <-c(6,4,7,10,12)
Employee <- data.frame(Name,Age,Role,Lengthofservice)
Employee

#Import the GGPLOT 2 library and plot a graph using the qplot function. 
#X axis is the sequence of 1:20 and the y axis is the x ^ 2. 
#Label the graph appropriately. install.packages("ggplot2",dependencies = TRUE)

library(ggplot2)

x <- seq(1:20)
y <- x ^ 2

qplot(x,y)

#Task 4
#Create a simple bar plot of five subjects

df <- data.frame(subjects = c('Maths','Statistics','Science','Maths','Machine Learning','Data Science'))
df_base <- ggplot(data=df,aes(x=subjects))
df_base + geom_bar(stat = 'count',fill = 'orange')

#Task5
#Write a R program to take input from the user (name and age) and display the values.

name <- readline(prompt ="Enter your name : ")
ageofuser <- readline(prompt = "Enter your age : ")
#convert string to integer
ageofuser<-as.integer(ageofuser)
print(paste("Hi",name,", your age is ",ageofuser))

#Task6
#Write a R program to create a sequence of numbers from 20 to 50 
#and find the mean of numbers from 20 to 50 and sum of numbers.

numbers <- seq(20:50)
numbers
print(paste("Mean of above numbers is : ",mean(numbers)))
print(paste("Mean of above numbers is : ",sum(numbers)))

#Task7
#Write a R program to create a vector which contains 10 random integer values 
#between -50 and +50

numvector <- runif(10,-50,50)
numvector

