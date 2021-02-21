#convert sra files to fastq files
system(paste('cd /home/ahmedadel/Data/sra'))
system(paste('ls *.sra > file-sra.tsv'))
sri<-data.frame(read.delim("file-sra.tsv"))
for(f in 1:nrow(sri)) {
  g = sri[f, 1]
  cmd = paste("fastq-dump --split-3", g)
  cat(cmd,"\n")#print the current command
  system(cmd) # invoke command
}

#move fastq files from data/sra to Output folder
system(paste('mv *.fastq /home/ahmedadel/Output'))

#production of list of first list of files
system(paste('cd /home/ahmedadel/Output'))
system(paste('ls *.fastq > file-id.tsv'))
system(paste('ls -d "$PWD"/*_1.fastq > listF.tsv'))
system(paste('ls -d "$PWD"/*_2.fastq > listR.tsv'))

#production of sample-id file
library(stringr)
File_names <-data.frame(read.delim('file-id.tsv', header = F))
names_list = list()
for(f in 1:nrow(File_names)){
  g = File_names[f, 1]
  if(str_detect(g, "_1.fastq") == TRUE) {
    new = gsub("_1.fastq", "", g) #removes a pattern from file name 
    names_list = append(names_list, new)
  }else if(str_detect(g, "_2.fastq") == TRUE) {
    new = gsub("_2.fastq", "", g)
  } else {
    break
  }
}
print(names_list)
#write(unlist(names_list), file = 'sample-id', sep = '\n')
write('sample-id', file = 'sample-id.tsv', sep = '\n')
write(unlist(names_list), file = 'sample-id.tsv', append = T)

#Prpduction of Forward_final_paths.tsv and Reverse_final_paths.tsv
#Forward
write('forward-absolute-filepath', file = 'Forward_paths_list.tsv', sep = '\n')
cmd <- paste('cat Forward_paths_list.tsv listF.tsv > Forward_final_paths.tsv')
system(cmd)
#Reverse
write('reverse-absolute-filepath', file = 'Reverse_paths_list.tsv', sep = '\n')
cmd <- paste('cat Reverse_paths_list.tsv listR.tsv > Reverse_final_paths.tsv')
system(cmd)

#Filemanifest 
system(paste('paste sample-id.tsv Forward_final_paths.tsv Reverse_final_paths.tsv > manifest.tsv'))

