libraryRequireInstall = function(packageName, ...)
{
    if (!require(packageName, character.only = TRUE))
    {
        install.packages(packageName, repos = "http://cran.us.r-project.org", ...)
        packOK = require(packageName, character.only = TRUE)
    }
}



allpackages = c("tseries")


sapply(allpackages, libraryRequireInstall)



library(tseries)


datafile <- "C:/temp/daily_quotes.csv"

dataset <- read.csv(datafile, header = TRUE, sep = ";")

closePrice <- c(as.numeric(dataset$Close))

result <- adf.test(closePrice)



print('the large p-value,0.5, from the adf.test confirms that it is not mean reverting') 

print('The small p - value(0.01) confirms that it is mean reverting')

print(result)

