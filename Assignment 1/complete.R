complete <- function(directory = getwd(),monitors){
    # Initialize an empty dataframe with columns 'id' and 'nobs'
    df <- data.frame(id = integer(), nobs = integer(), stringsAsFactors = FALSE)
    for(monitor in monitors){
        str_monitor <- sprintf("%03d", monitor)
        path = paste(directory, paste(str_monitor,".csv",sep = ""), sep = "/" )
        data <- read.table(file = path,
                           header = TRUE,
                           sep = ",",
                           comment.char = "",
                           skip = 0)
        nna_count <- sum((!is.na(data[["nitrate"]]))&(!is.na(data[["sulfate"]])))
        df <- rbind(df, data.frame(id = monitor, nobs = nna_count))
        }
        
    # Return the average pollutant value
    return(df)
    }
    ?