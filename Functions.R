add2 <- function(x,y){
  x+y #returns whatever is the last line
}


above10 <- function(x){
  use <- x>10
  x[use]
}

aboven <- function(x,n = 10){ #we can specyfy a default
  use <- x>n
  x[use]
}


columnmean <- function(y, removeNA = TRUE){
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i], na.rm = removeNA)
  } 
  means
}
