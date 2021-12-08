source("get_data.R")


bootstrap_tmy <- function(df){
  # get the years we have in raw data
  years <- unique(df$Year)
  
  # randomly select 12 years
  list1 <- replicate(12,sample(x=years,size = 1))
  
  # specify the month for these 12 years
  list2 <- c(1:12)
  df_time <- data.frame(year = list1, month = list2)
  df_time <- df_time %>% mutate_all(as.character)
  
  # create a dataframe to save bootstrap result
  df3 <- data.frame()
  
  # get the bootstrap result, which should be a one-year TMY file
  for (i in 1:12){
    df2 <- df %>% filter(Year == df_time$year[i] & Month == df_time$month[i])
    df3 <- rbind(df3,df2)
  }
  # write.csv(df3,"tmy")
  return(df3)
}

repeat_bootstrap <- function(n = 1, df){
  ###
  ## Parameter interpretation
  # This is the function to do the bootstrap and generate the TMY files
  # n is the times we want for bootstrap, which generates one-year TMY file each time, default n=1
  # df is the dataframe saved from our raw data. For now we use get_data() function to get the data
  # in the "data" folders. If the user get other data, they can read them into dataframe and run
  # this function to do the bootstrap. 
  
  ## Notion: 
  # The bootstrap is according to the year of dataframe to randomly select one year at a time,
  # so as long as there is a "Year" column in the df that user provide, the bootstrap process can probably
  # run without errors.
  ###
  
  # repeat the bootstrap process n(n is the user-defined parameter)  times
  for (j in 1:n){
    # set the name for each TMY file
    names <- paste0("tmy","_",j)
    
    # get the bootstrap results
    x <- bootstrap_tmy(df)
    
    # assign the results to the TMY name
    assign(names, x)
    
    # write the TMY data into csv files
    write.csv(x,paste0("tmy","_",j,".csv"))
  }
}

# demo --- if the user want to run the bootstrap, they can uncomment the annotation below
# df1 <- get_data()
# repeat_bootstrap(n = 5,df1)
