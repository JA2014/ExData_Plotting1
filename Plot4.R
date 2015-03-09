## Script that construct the read data, construct plot4 and create the PNG4 file.> if(!file.exists("EPC")) {dir.create("EPC")} ## if it does not exist, created the folder 'EPC' in my working directory,
> fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" ## Place the URL of the file to download in the variable
> download.file(fileUrl, destfile = "./EPC/EPC.zip") ## downloads the file from the Internet
> data <-read.csv('household_power_consumption.txt',sep=';',header=TRUE, stringsAsFactors = FALSE, na.strings="?")## load the data in the variable 'data'
> fevrier <- data[data$Date %in% c("1/2/2007","2/2/2007"),] ## allows to choose only the records between 1 and 2 February
> library(lubridate) ## load the library for date manipulation
> Mydatetime = dmy(fevrier$Date) + hms(fevrier$Time) ## create the variable that combines the date and time set from the columns 'Date' and 'Time'of the dataset
> fevrier$Datetime <- Mydatetime  ## adds a new column 'Datetime' that has the format 'Date and Time' in the dataset
> windows() ## launch the screen device
> png()
par(mfrow= c(2,2),mar = c(4,4,2,1), oma = c(0,0,2,0)
> with (fevrier, {
> plot(fevrier$Datetime, fevrier$Global_active_power, main = "", xlab = "", ylab = "Global Active Power", type ="l")
> plot(fevrier$Datetime, fevrier$voltage, main = "", xlab = "datetime", ylab = "voltage", type ="l")
> plot(fevrier$Datetime, fevrier$Sub_metering_1, main = "", xlab = "", ylab = "Energie sub metering", type ="l", col = "black")
> with(fevrier, lines(fevrier$Datetime, fevrier$Sub_metering_2, main = "", xlab = "", ylab = "Energie sub metering", type ="l", col = "red"))
> with(fevrier, lines(fevrier$Datetime, fevrier$Sub_metering_3, main = "", xlab = "", ylab = "Energie sub metering", type ="l", col = "blue"))
> legend("topright", pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
> plot (fevrier$Datetime, fevrier$Global_active_power, main = "", xlab = "datetime", ylab = "voltage", type ="l")
> }
> dev.off()
> )
