########### HIERARCHICAL CLUSTERING ##################

import pandas as pd
#pandas is used for data manipulation ,analysis and cleansing 
import numpy as np
#numpy is used for numerical calculations
import matplotlib.pyplot as plt
#it is used for data visualization purpose
crime=pd.read_csv("D://360digiTMG/unsupervised/mod 12 Hierarchical Clustering/crime data/crime_data.csv")
crime

def norm_func(i):
    x= (i-i.min())/(i.max()-i.min())
    return(x)
    
#normalised dataframe (considering with numerical  the data)
df_norm=norm_func(crime.iloc[:,1:5])    

from scipy.cluster.hierarchy import linkage 
import scipy.cluster.hierarchy as sch
#it is used for the creating dendrograms

type(df_norm)

z=linkage(df_norm,method="complete",metric="euclidean")

plt.figure(figsize=(15, 5));plt.title('Hierarchical Clustering Dendrogram');plt.xlabel('Index');plt.ylabel('Distance')

sch.dendrogram(
        z,
        leaf_rotation=0.,
        leaf_font_size=8.,
        )
plt.show()

from sklearn.cluster import AgglomerativeClustering

h_complete=AgglomerativeClustering(n_clusters=4, linkage="complete", affinity="euclidean").fit(df_norm)

clusters_labels=pd.Series(h_complete.labels_)
crime['clust']=clusters_labels# creating a  new column and assigning it to new column

crime=crime.iloc[:,[5,0,1,2,3,4]]
crime.head()

#getting aggregate mean of each cluster
crime.iloc[:,2:].groupby(crime.clust).mean()
#2nd cluster consists of less no of crime rate so cluster 2 is best

crime.to_csv('D://360digiTMG/unsupervised/mod 12 Hierarchical Clustering/crime data/crime_py.csv',encoding="utf-8")

import os
os.getcwd()

