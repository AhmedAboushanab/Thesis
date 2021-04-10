library(tidyverse)
library(reshape)

#Reading data and subdividing it to level_taxa
data = read.csv("YeZ_2018_healthy_China4.csv")
head(data)
#check if you have the right range
#-1 from the number of rows in the file
data[3:8, 1]  
data2 = data[3:8, ]
head(data2)
data3 = data.frame(t(data2))
write.csv(data3, file = "China4_level2.csv") #change
data4 = read.csv("China4_level2.csv") #change

#remove the study names from the sample names using replace function in excel 
#and save the file
#plotting different taxa for a single country
data4 = read.csv("China1_level2.csv") #change
meltdata <- melt(data4)
ggplot(meltdata) + 
  geom_boxplot(mapping = aes(x = variable, y = value, fill = variable)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_discrete(name="Taxa Level 2") +
  labs(x = "L2 Taxa", y = "Relative Abundance") +
  ggtitle("L2 Taxa in China") +
  theme(plot.title = element_text(hjust = 0.5))

#Plotting the samples as stacked-bar plots
ggplot(meltdata, aes(x = meltdata$sample, y = value, fill = variable)) + 
  geom_bar(stat = "identity") + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_discrete(name="Taxa Level 2") +
  labs(x = "Sample", y = "Relative Abundance") +
  ggtitle("China's samples") +
  theme(plot.title = element_text(hjust = 0.5))