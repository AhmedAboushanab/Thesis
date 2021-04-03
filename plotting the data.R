library(tidyverse)
library(reshape)

#Read and fileter data
data = read.csv("Total_L2.csv")
China = filter(data, Country == "China")
Egypt = filter(data, Country == "Egypt")

#Subdividing the data
China_2 = China[ , 2:8]
Egypt_2 = Egypt[ , 2:8]

#Comparing between countries for the same taxa level
ggplot(data) +
  geom_boxplot(mapping = aes(x = Country, y = k__Bacteria.p__Bacteroidetes))
ggplot(data) +
  geom_boxplot(mapping = aes(x = Country, y = k__Bacteria.p__Proteobacteria))

#Melting the data for different countries to manipulate different columns together 
meltChina_2 <- melt(China_2)
meltEgypt_2 <- melt(Egypt_2)

#plotting different taxa for a single country
ggplot(meltChina_2) + 
  geom_boxplot(mapping = aes(x = variable, y = value))

ggplot(meltEgypt_2) + 
  geom_boxplot(mapping = aes(x = variable, y = value))
#plotting all countries together in one figure
data2 = data[ , 2:9]
data3 = melt(data2)
ggplot(data3) + 
  geom_boxplot(mapping = aes(x = variable, y = value, color= variable)) + facet_wrap(~ Country)

#Plotting the samples as stacked-bar plots
China3 = China[ ,1:8]
meltChina3 = melt(China3)

Egypt3 = Egypt[ ,1:8]
meltEgypt3 = melt(Egypt3)

ggplot(meltEgypt3, aes(x = Sample, y = value, fill = variable)) + 
  geom_bar(stat = "identity") + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_discrete(name="Taxa Level 2") +
  labs(x = "Sample", y = "Relative Abundance") +
  ggtitle("Egypt's samples") +
  theme(plot.title = element_text(hjust = 0.5))

ggplot(meltChina3, aes(x = Sample, y = value, fill = variable)) + 
  geom_bar(stat = "identity") + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_discrete(name="Taxa Level 2") +
  labs(x = "Sample", y = "Relative Abundance") +
  ggtitle("China's samples") +
  theme(plot.title = element_text(hjust = 0.5))
