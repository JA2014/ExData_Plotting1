## Script that construct the read data, construct plot1 and create the PNG1 file.
> if(!file.exists("EPC")) {dir.create("EPC")} ## if it does not exist, created the folder 'EPC' in my working directory,
> fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" ## Place the URL of the file to download in the variable
> download.file(fileUrl, destfile = "./EPC/EPC.zip") ## downloads the file from the Internet
> data <-read.csv('household_power_consumption.txt',sep=';',header=TRUE, stringsAsFactors = FALSE, na.strings="?")## load the data in the variable 'data'
> fevrier <- data[data$Date %in% c("1/2/2007","2/2/2007"),] ##allows to choose only the records between 1 and 2 February
> library(lubridate) ## load the library for date manipulation
> Mydatetime = dmy(fevrier$Date) + hms(fevrier$Time) ## create the variable that combines the date and time set from the columns 'Date' and 'Time'of the dataset
> fevrier$Datetime <- Mydatetime  ## adds a new column 'Datetime' that has the format 'Date and Time' in the dataset
> hist(fevrier$Global_active_power, col="red",main= "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency") ## create the Plot 1 and displays it on the screen
> dev.copy(png, file="plot1.png")## copy the 'Plot' in a PNG file
> dev.off()## close the PNG file device
