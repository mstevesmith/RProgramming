pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    combined <- data.frame()
    
    for(i in id) {
        filename <- paste(formatC(i,width=3,flag="0"), ".csv", sep="")
        x <- read.csv(paste(getwd(), "/", directory, "/", filename, sep=""))
        
        combined <- rbind(combined, x)
    }
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    # combined[1,]

    y <- subset(combined, select=pollutant)

    mean(y[,], na.rm=TRUE)
}