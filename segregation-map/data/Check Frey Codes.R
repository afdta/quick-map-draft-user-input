freyseg <- read.csv("~/Projects/quick-map/segregation-map/data/FreySegregationMap.csv", stringsAsFactors=FALSE)
library(metromonitor)
mp <- metropops(TRUE, "2013")[c("CBSA_Code","CBSA_Title")]
names(mp)[2] <- "CBSA_Title_Standard"

mergeTest <- merge(freyseg, mp, by="CBSA_Code")

sum(mergeTest$CBSA_Title == mergeTest$CBSA_Title_Standard) #all good
