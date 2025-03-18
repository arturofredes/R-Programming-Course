############################################
#Part 1 
############################################
#library(dplyr)
pollutantmean <- function(directory = getwd(),pollutant, monitors ){
    sum_pol_tot <- 0
    nna_count_tot <- 0
    for(monitor in monitors){
        str_monitor <- sprintf("%03d", monitor)
        path = paste(directory, paste(str_monitor,".csv",sep = ""), sep = "/" )
        data <- read.table(file = path,
                     header = TRUE,
                     sep = ",",
                     comment.char = "",
                     skip = 0)
        nna_count <- sum(!is.na(data[[pollutant]]))
        sum_pol <- sum(data[[pollutant]], na.rm = TRUE)
        
        nna_count_tot <- nna_count_tot + nna_count
        sum_pol_tot <- sum_pol_tot + sum_pol 
    }
    # Return the average pollutant value
    return(sum_pol_tot / nna_count_tot)
    }

