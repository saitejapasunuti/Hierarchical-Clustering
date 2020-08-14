#######################heirarchical clustering ##################

#load data
input <- read.csv(file.choose())
input

#remove the x variable as it contains names
crime <- input[1:50,1:5]
View(crime)

normalized_data <-scale(crime[-1]) 
d <- dist(normalized_data,method = "euclidean")#distance matrix
fit <- hclust(d,method ="complete" )
?hclust
#heirarchical clustering analysis on a set of dissimilarities and methods for analyzing it.

plot(fit)
plot(fit,hang = -1)
groups <- cutree(fit,k=4)
rect.hclust(fit,k=4,border = "blue")

membership <- as.matrix(groups)

final <- data.frame(crime,membership)
View(final)
final1 <- final[,c(ncol(final),1:(ncol(final)-1))]
View(fianl1)

?ncol#returns no of columns from x

write.csv(fianl1,file = "D:/360digiTMG/unsupervised/mod 12 Hierarchical Clustering/crime data/crime_final.csv")#to save the file as csv file in the required location 
getwd()#to know the current working directory
