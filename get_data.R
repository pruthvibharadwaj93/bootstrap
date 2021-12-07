library(tidyverse)

get_data <- function(){
  # create a data frame to storage the data
  df_tmy3 <- data.frame()
  
  # run the for loop to get all data we need
  for (file1 in list.files(paste0(getwd(),"/data"))) {
    # Using list.files(paste0(getwd(),"/data")) to get the path of the data
    # we need for bootstrapping
    
    # save the data into dataframe
    d <- read.csv(paste("data",file1, sep = "/"))
    # change the column names
    colnames(d) <- d[2,]
    
    # drop the useless rows
    d <- d[c(-1:-2),]
    
    # drop the useless columns, which are without values
    d_col <- d %>% colnames()
    d <- d[,-which(d_col=="")]
    
    # combine the data
    df_tmy3 <- rbind(df_tmy3,d)
    
    
  }
  # change the row names
  row.names(df_tmy3) <- c(1:nrow(df_tmy3))
  
  # output the dataframe that we need for bootstrapping
  return(df_tmy3)
}
# demo
df1 <- get_data()
