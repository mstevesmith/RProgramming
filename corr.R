corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    #combined <- data.frame(id=numeric(), nobs=numeric())
    correlations = vector()
    
    for(i in 1:332) {
        filename <- paste(formatC(i,width=3,flag="0"), ".csv", sep="")
        x <- read.csv(paste(getwd(), "/", directory, "/", filename, sep=""))
        removeNA <- complete.cases(x)
        count <- nrow(x[removeNA, ])
        pollutants <- x[removeNA, ]

        #combined <- rbind(combined, data.frame(id=i,nobs=count))
        if (count > threshold) {
            cor_value <- cor(pollutants[ , 2], pollutants[ ,3])
            correlations <- append(correlations, cor_value)
        }
    }
    correlations
}