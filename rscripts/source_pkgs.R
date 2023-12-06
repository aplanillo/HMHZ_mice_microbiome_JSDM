# Source file for R libraries used in the project


####--------------------------------------------####
## PACKAGES
####--------------------------------------------####

mylibraries <- c("dplyr", "ggplot2",
                 "phyloseq", "magrittr")

for (i in 1:length(mylibraries)) {
  if(mylibraries[i] %in% rownames(installed.packages()) == FALSE) {install.packages(mylibraries[i])}
}
lapply(mylibraries, require, character.only = TRUE)
