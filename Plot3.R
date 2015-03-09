## Script that construct the read data, construct plot3 and create the PNG3 file.
> if(!file.exists("EPC")) {dir.create("EPC")} ## if it does not exist, created the folder 'EPC' in my working directory,
> fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" ## Place the URL of the file to download in the variable
> download.file(fileUrl, destfile = "./EPC/EPC.zip") ## downloads the file from the Internet
> data <-read.csv('household_power_consumption.txt',sep=';',header=TRUE, stringsAsFactors = FALSE, na.strings="?")## load the data in the variable 'data'
> fevrier <- data[data$Date %in% c("1/2/2007","2/2/2007"),] ## allows to choose only the records between 1 and 2 February
> library(lubridate) ## load the library for date manipulation
> Mydatetime = dmy(fevrier$Date) + hms(fevrier$Time) ## create the variable that combines the date and time set from the columns 'Date' and 'Time'of the dataset
> fevrier$Datetime <- Mydatetime  ## adds a new column 'Datetime' that has the format 'Date and Time' in the dataset
> windows() ## launch the screen device. ## the next 3 lines of codes, create the 1st graph and add 2 others graph
> with(fevrier, plot(fevrier$Datetime, fevrier$Sub_metering_1, main = "", xlab = "", ylab = "Energie sub metering", type ="l", col = "black"))## create the fist graph
> with(fevrier, lines(fevrier$Datetime, fevrier$Sub_metering_2, main = "", xlab = "", ylab = "Energie sub metering", type ="l", col = "red")) ## add the second graph
> with(fevrier, lines(fevrier$Datetime, fevrier$Sub_metering_3, main = "", xlab = "", ylab = "Energie sub metering", type ="l", col = "blue")) ## add the third graph
> legend("topright", pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))## make annotation for the x and y label, title and legend 
> dev.copy(png, file="plot3.png")## copy the 'Plot' in a PNG file named 'plot3.png'.
> dev.off()## close the PNG device.
## the weekday are in french because of my regional setting. Jeu = thu, Ven = fri, sam = sat
