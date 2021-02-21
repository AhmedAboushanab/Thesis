library(curatedMetagenomicData)
library(phyloseq)
library(ExperimentHub)
library(stringr)

#getting the dataset
Dataset <- curatedMetagenomicData("PasolliE_2018.metaphlan_bugs_list.stool", dryrun = FALSE)
dataset2 <- mergeData(Dataset)
experimentData(dataset2)
JieZ <- pData(dataset2)
write.csv(JieZ, file = "PasolliE_2018_dataset.csv", row.names = F)
JieZ_results <- exprs(dataset2)
write.csv(JieZ_results, file = "PasolliE_2018_relative abundance_dataset.csv", row.names = T)

#filtering healthy samples data
subdata <- read.csv("VatanenT_2016_relative abundance_dataset.csv", header = FALSE)
healthy <- read.csv("Backhed.csv", header = FALSE)

#modifying column names in subdata
#subdata2 <- list()
#for(e in 1:ncol(subdata)){
#  h = subdata[1 , e]
#  if(str_detect(h, "AsnicarF_2017.metaphlan_bugs_list.stool:") == TRUE){
#    new = gsub("AsnicarF_2017.metaphlan_bugs_list.stool:", "", h) #removes a pattern from file name 
#    subdata2 = append(subdata2, new)
#  }else{
#    print("FALSE")
#  }
#}

#print(subdata2)
#head(subdata)

#healthy data ISA
subdata3 <- read.csv("VatanenT_2016_relative abundance_dataset.csv", header = FALSE)
write.csv(subdata3[1], file = "VatanenT_2016.csv", row.names = FALSE)#change name

healthydata <- read.csv("VatanenT_2016.csv", header = FALSE) #change name
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
