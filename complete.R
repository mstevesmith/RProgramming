complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    combined <- data.frame(id=numeric(), nobs=numeric())
    
    
    for(i in id) {
        filename <- paste(formatC(i,width=3,flag="0"), ".csv", sep="")
        x <- read.csv(paste(getwd(), "/", directory, "/", filename, sep=""))
        removeNA <- complete.cases(x)
        count <- nrow(x[removeNA, ])
        
        combined <- rbind(combined, data.frame(id=i,nobs=count))
        
    }
    combined
}