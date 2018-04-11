library(ggplot2)
library(dplyr)
library(stats)
library(gmodels)

#install.packages("gmodels")

samples<-read.csv("./data/samplesbyorgan_22-03-2018.csv")
projout<-read.csv("./data/proj_out_22-03-2018.csv")


table(projout$assperiod,projout$sin,projout$soutproj)
xtabs(~assperiod+sin,projout)

CrossTable(projout$assperiod,projout$sin, prop.chisq = F, dnn=c("Assessment Period","Type of sample"))

length(unique(projout$sidloc))

a<-projout[duplicated(projout[,"sid"]),]
aa <- samples%>%
  select(patid,soasid,sid,sinali,sinst) %>%
   arrange(sid,patid)


a<-projout[duplicated(aa[,"sid"]),]


d3 <- samples%>% 
  group_by(assperiod,sin) %>% 
  summarise(sinstock=sum(sinst), sinharvested=sum(sinali) ) %>% 
  mutate(perc=count/sum(sinharvested)*100)

