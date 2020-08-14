input <- read.csv(file.choose())
input
#input <- readWorksheet(loadWorkbook("D:\\360digiTMG\\unsupervised\\mod 12 Hierarchical Clustering\\Ex Universities_Clustering\\Universities_Clustering.xlsx"),sheet=1)
mydata <- input[1:25,2:7]
# Load data as mydata
mydata

normalized_data <- scale(mydata[,1:6]) #excluding the university name columnbefore normalizing
d <- dist(normalized_data, method = "euclidean") # distance matrix
fit <- hclust(d, method="complete")
?hclust
plot(fit) # display dendrogram
plot(fit, hang=-1)
groups <- cutree(fit, k=3) # cut tree into 3 clusters

?cutree
rect.hclust(fit, k=3, border="red")
?rect.hclust

membership<-as.matrix(groups)

final <- data.frame(mydata, membership)

final1 <- final[,c(ncol(final),1:(ncol(final)-1))]

?write.xlsx

write.csv(final1, file="final.csv")

getwd()
