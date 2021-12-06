library(tidyverse)



df_tmy3 <- data.frame()

for (year in 1998:2020) {
  path <- paste0("data","/1340803_42.33_-71.02","_",year,".csv")
  d <- read.csv(path, header = FALSE)
  d <- d[c(-1:-2),]
  colnames(d) <- d[1,]
  d <- d[-1,]
  df_tmy3 <- rbind(df_tmy3,d)
  
  
}

row.names(df_tmy3) <- c(1:nrow(df_tmy3))
