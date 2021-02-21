library(curatedMetagenomicData)
library(phyloseq)
library(ExperimentHub)
library(stringr)

#getting the dataset
Dataset <- curatedMetagenomicData("Dataset_name", dryrun = FALSE)
dataset2 <- mergeData(Dataset)
experimentData(dataset2)
Metadata <- pData(dataset2)
write.csv(JieZ, file = "Metadata_dataset name.csv", row.names = F)
Relative_Abundance_results <- exprs(dataset2)
write.csv(JieZ_results, file = "Relative Abundance file.csv", row.names = T)

#filtering healthy samples data
subdata <- read.csv("Relative Abundance file.csv", header = FALSE)
healthy <- read.csv("File with sample ids.csv", header = FALSE)


#healthy data
subdata3 <- read.csv("Realative Abundance file.csv", header = FALSE)
write.csv(subdata3[1], file = "Taxa availabe.csv", row.names = FALSE)#change name each time for different datasets

#Cgecking the ids for healthy samples agains relative abundacne data and add their information to an empty list
healthydata <- read.csv("Realative Abundance file.csv", header = FALSE) #change name each time for different datasets
for(f in 1:nrow(healthy)){
  for(e in 1:ncol(subdata)){
    g = healthy[f, 1]
    h = subdata[ , e]
    if(str_detect(h, g) == TRUE && !(h[1] %in% healthydata[1, ])){
      print("true")
      healthydata <- cbind(healthydata, h)
    }else{
      print("false")
    }
  }
}

write.csv(healthydata, file = "VatanenT_2016_healthy_Russia.csv", row.names = F) #change name
# two conditions used to prevent repetition 
