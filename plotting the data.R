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
  geom_boxplot(mapping = aes(x = factor(Country, levels = c("Italy", "Netherlands", "Canada", "Sweden",
                                                            "China", "Denmark", "Egypt", "Finland", "USA",
                                                            "Russia", "Madagascar"))
                                        , y = k__Bacteria.p__Bacteroidetes, fill = Country)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_discrete(name="Country") +
  labs(x = "Country" , y = "Bacteroidetes Relative Abundance") +
  ggtitle("Bacteroidetes Relative Abundance between countries") +
  theme(plot.title = element_text(hjust = 0.5))

ggplot(data) +
  geom_boxplot(mapping = aes(x = factor(Country, levels = c("Italy", "Netherlands", "Canada", "Sweden",
                                                            "China", "Denmark", "Egypt", "Finland", "USA",
                                                            "Russia", "Madagascar"))
                             , y = k__Bacteria.p__Firmicutes, fill = Country)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_discrete(name="Country") +
  labs(x = "Country" , y = "Firmicutes Relative Abundance") +
  ggtitle("Firmicutes Relative Abundance between countries") +
  theme(plot.title = element_text(hjust = 0.5))

ggplot(data) +
  geom_boxplot(mapping = aes(x = factor(Country, levels = c("Italy", "Netherlands", "Canada", "Sweden",
                                                            "China", "Denmark", "Egypt", "Finland", "USA",
                                                            "Russia", "Madagascar"))
                             , y = k__Bacteria.p__Actinobacteria, fill = Country)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_discrete(name="Country") +
  labs(x = "Country" , y = "Actinobacteria Relative Abundance") +
  ggtitle("Actinobacteria Relative Abundance between countries") +
  theme(plot.title = element_text(hjust = 0.5))

ggplot(data) +
  geom_boxplot(mapping = aes(x = factor(Country, levels = c("Italy", "Netherlands", "Canada", "Sweden",
                                                            "China", "Denmark", "Egypt", "Finland", "USA",
                                                            "Russia", "Madagascar"))
                             , y = k__Archaea.p__Euryarchaeota, fill = Country)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_discrete(name="Country") +
  labs(x = "Country" , y = "Euryarchaeota Relative Abundance") +
  ggtitle("Euryarchaeota Relative Abundance between countries") +
  theme(plot.title = element_text(hjust = 0.5))

ggplot(data) +
  geom_boxplot(mapping = aes(x = factor(Country, levels = c("Italy", "Netherlands", "Canada", "Sweden",
                                                            "China", "Denmark", "Egypt", "Finland", "USA",
                                                            "Russia", "Madagascar"))
                             , y = k__Bacteria.p__Verrucomicrobia, fill = Country)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_discrete(name="Country") +
  labs(x = "Country" , y = "Verrucomicrobia Relative Abundance") +
  ggtitle("Verrucomicrobia Relative Abundance between countries") +
  theme(plot.title = element_text(hjust = 0.5))

ggplot(data) +
  geom_boxplot(mapping = aes(x = factor(Country, levels = c("Italy", "Netherlands", "Canada", "Sweden",
                                                            "China", "Denmark", "Egypt", "Finland", "USA",
                                                            "Russia", "Madagascar"))
                             , y = k__Bacteria.p__Proteobacteria, fill = Country)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_discrete(name="Country") +
  labs(x = "Country" , y = "Proteobacteria Relative Abundance") +
  ggtitle("Proteobacteria Relative Abundance between countries") +
  theme(plot.title = element_text(hjust = 0.5))

ggplot(data) +
  geom_boxplot(mapping = aes(x = factor(Country, levels = c("Italy", "Netherlands", "Canada", "Sweden",
                                                            "China", "Denmark", "Egypt", "Finland", "USA",
                                                            "Russia", "Madagascar"))
                             , y = k__Viruses.p__Viruses_noname, fill = Country)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_discrete(name="Country") +
  labs(x = "Country" , y = "Viruses_noname Relative Abundance") +
  ggtitle("Viruses_noname Relative Abundance between countries") +
  theme(plot.title = element_text(hjust = 0.5))

#plotting all countries together in one figure
data2 = data[ , 2:9]
data3 = melt(data2)
ggplot(data3) + 
  geom_boxplot(mapping = aes(x = variable, y = value, fill= variable)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_discrete(name="Taxa Level 2") +
  labs(X = "Level 2 Taxa" , y = "Relative Abundance") +
  ggtitle("Countrieses Relative Abundance of Level 2 Taxa") +
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~ Country)

