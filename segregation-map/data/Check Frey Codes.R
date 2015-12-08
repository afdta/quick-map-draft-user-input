freyseg <- read.csv("~/Projects/Mapping/quick-map/segregation-map/data/FreySegregationMap.csv", stringsAsFactors=FALSE)
freyseg <- read.csv("~/Projects/quick-map/segregation-map/data/FreySegregationMap.csv", stringsAsFactors=FALSE)
library(metromonitor)
library(ggplot2)
mp <- metropops(TRUE, "2013")[c("CBSA_Code","CBSA_Title")]
names(mp)[2] <- "CBSA_Title_Standard"

mergeTest <- merge(freyseg, mp, by="CBSA_Code")

sum(mergeTest$CBSA_Title == mergeTest$CBSA_Title_Standard) #all good

p <- ggplot(freyseg)
p + geom_dotplot(aes(x=Index), binwidth=7,dotsize=0.25)
p + geom_point(aes(x=Group, y=Index, size=Index))
