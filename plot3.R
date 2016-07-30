###########Assignment 1##############

#setup working directory
getwd()
#setwd("C:\\Users\\mli\\Documents\\Personal\\Training\\Exploratory Graphs\\Assignment1")


elc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
summary(elc)

sub_data <- elc[elc$Date %in% c("1/2/2007","2/2/2007") ,]
summary(sub_data)

#subSetData <- elc[strptime(elc$Date, "%d/%m/%Y") == strptime("01/02/07", "%d/%m/%y") 
#                  | strptime(elc$Date, "%d/%m/%Y") == strptime("02/02/07", "%d/%m/%y"), ]


#plot 3
#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub_metering_1 <- as.numeric(as.character(subSetData$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(subSetData$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(subSetData$Sub_metering_3))
#open graphci device
png("plot3.png", width=480, height=480)
#open a canvas
plot(datetime, Sub_metering_1, type = "l")
lines(datetime, Sub_metering_1, col = "black")
lines(datetime, Sub_metering_2, col ="red")
lines(datetime, Sub_metering_3, col ="blue")
#setup legend
legend("topright", pch = '-', col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
