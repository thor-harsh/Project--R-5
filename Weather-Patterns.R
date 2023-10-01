getwd()
setwd(".\\Weather Data")

Chicago<-read.csv("Chicago-F.csv",row.names = 1)
NewYork<-read.csv("NewYork-F.csv",row.names = 1)
Houston<-read.csv("Houston-F.csv",row.names = 1)
SanFrancisco<-read.csv("SanFrancisco-F.csv",row.names = 1)
Chicago
NewYork
Houston
SanFrancisco


#these are dataframes:
is.data.frame(Chicago)


#lets convert to matrices:
Chicago<-as.matrix(Chicago)
NewYork<-as.matrix(NewYork)
Houston<-as.matrix(Houston)
SanFrancisco<-as.matrix(SanFrancisco)

#check
is.matrix(Chicago)


#Lets put them into a list
Weather<-list(Chicago=Chicago,NewYork=NewYork,Houston=Houston,SanFrancisco=SanFrancisco)
Weather


Weather[[3]]
Weather[3]
Weather$Houston


#Using apply function
Chicago
?apply()
apply(Chicago,1,mean)

#check
mean(Chicago['DaysWithPrecip',])

#analyze one city:
Chicago
apply(Chicago,1,max)
apply(Chicago,1,min)

#For practice
apply(Chicago,1,mean)
apply(NewYork,1,mean)
apply(Houston,1,mean)
apply(SanFrancisco,1,mean)

#(nearly) deliverable 1:there is a faster way


#Recreating the apply function with loops(advanced topic)
#find the mean for every row:
#1.via loops
output<-NULL #preparing an empty vector
for(i in 1:5)
{
  output[i]<-mean(Chicago[i,])
}

names(output)<-rownames(Chicago)
output

#via apply function

apply(Chicago,1,mean)


#via lapply function
?lapply()
Chicago
t(Chicago)
Weather
mynewlist<-lapply(Weather,t)
mynewlist

#example 2
Chicago
rbind(Chicago,NewRow=1:12)
lapply(Weather,rbind,NewRow=1:12)

#example 3
?rowMeans()
rowMeans(Chicago) # same as apply(Chicago,1,mean)

lapply(Weather,rowMeans)

#(nearly) deliverable 1: even better,but will improve further


lapply(Weather,colMeans)  # same as apply(Weather,2,mean)

rowSums(Chicago) # same as apply(Weather,1,sum)
colSums(Chicago) # same as apply(Weather,2,sum)

lapply(Weather,rowSums)
lapply(Weather,colSums)


#Combine lapply with the [ ] operator
Weather[[1]][1,1]
lapply(Weather,"[",1,1)
NewYork[1,1]
Houston[1,1]
SanFrancisco[1,1]

lapply(Weather,"[",,3)

#Adding your own functions
lapply(Weather,rowMeans)
lapply(Weather,function(x) x[1,])
lapply(Weather,function(x) x[5,])
lapply(Weather,function(x) x[,12])
Weather
lapply(Weather,function(x) x[1,]-x[2,])
lapply(Weather,function(z) round((z[1,]-z[2,])/z[2,],2))
#Deliv2: temp fluctautions: will improve
lapply(Weather,function(y) round((y[4]/y[5]),2))


#Using sapply
?sapply()

#AvgHigh_F for July
lapply(Weather,"[",1,7)
sapply(Weather,"[",1,7)
#AvgHigh_F for 4th Quarter
lapply(Weather,"[",1,10:12)
sapply(Weather,"[",1,10:12)
lapply(Weather,rowMeans)
round(sapply(Weather,rowMeans),2) # Deliverable  1 Awesome

lapply(Weather,function(z) round((z[1,]-z[2,])/z[2,],2))
sapply(Weather,function(z) round((z[1,]-z[2,])/z[2,],2)) # Deliverable 2:Awesome

sapply(Weather,rowMeans,simplify = FALSE)


#Nesting apply functions
Weather
lapply(Weather,rowMeans)
?rowMeans
Chicago
apply(Chicago,1,max)
#apply across whole list:
lapply(Weather,apply,1,max) #preferred
lapply(Weather,function(X) apply(X,1,max))

#tide up:
sapply(Weather,apply,1,min)
sapply(Weather,apply,1,max)


#which.max
?which.max()
names(which.max(Chicago[1,]))
#lapply(Weather,function(x) apply(x,1,names(which.max(x[1,])))
apply(Chicago,1,names(which.max(Chicago[1,])))


#we will apply- to iterate over rows of the matrix
#we will lapply or sapply to iterate over components of the list


apply(Chicago,1,function(X) names(which.max(X)))
lapply(Weather,function(Y) apply(Y,1,function(X) names(which.max(X))))
sapply(Weather,function(Y) apply(Y,1,function(X) names(which.max(X))))
      
       