library(ggplot2)
library(dplyr)
library(stats)


samples<-read.csv("M:/MEDIZIN/STCS/00_CDM/Queries/Samples_management/samplequalityApp/samplesQA/samplesbyorgan_22-03-2018.csv")
projout<-read.csv("M:/MEDIZIN/STCS/00_CDM/Queries/Samples_management/samplequalityApp/samplesQA/proj_out_22-03-2018.csv")


table(projout$assperiod,projout$sin,projout$soutproj)
xtabs(~assperiod+sin,projout)
