library("metromonitor")
library("jsonlite")

t100 <- metropops(TRUE,"2013")
all  <- metropops(FALSE,"2013") 

diff <- all[!(all$CBSA_Code %in% t100$CBSA_Code), ]
lst <- list(t100 = t100[,c("CBSA_Code","CBSA_Title","POP2010","EST2013","lon","lat")], rest = diff[,c("CBSA_Code","CBSA_Title","POP2010","EST2013","lon","lat")])

json <- toJSON(lst)

writeLines(json, "/home/alec/Projects/quick-map/build/LonLatUpdate.json")
