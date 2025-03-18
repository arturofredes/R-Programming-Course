corr <- function(directory = getwd(), threshold = 0){
    cor_vector <- numeric()
    df <- complete(directory,1:332)
    filtered_df <- df[df$nobs > threshold, ]
    for(monitor in filtered_df[['id']]){
        str_monitor <- sprintf("%03d", monitor)
        path = paste(directory, paste(str_monitor,".csv",sep = ""), sep = "/" )
        data <- read.table(file = path,
                           header = TRUE,
                           sep = ",",
                           comment.char = "",
                           skip = 0)
        x <- cor(x=data[['nitrate']], y = data[['sulfate']], use = "complete.obs")
        cor_vector <- c(cor_vector, x)
    }
    
    return(cor_vector)
}


