###########Assignment 1##############

#setup working directory
getwd()
setwd("C:\\Users\\mli\\Documents\\Personal\\Training\\Exploratory Graphs\\Assignment1")


elc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
summary(elc)

sub_data <- elc[elc$Date %in% c("1/2/2007","2/2/2007") ,]
summary(sub_data)

#subSetData <- elc[strptime(elc$Date, "%d/%m/%Y") == strptime("01/02/07", "%d/%m/%y") 
#                  | strptime(elc$Date, "%d/%m/%Y") == strptime("02/02/07", "%d/%m/%y"), ]


#plot 4
#str(subSetData)
Global_reactive_power<-as.numeric(as.character(subSetData$Global_reactive_power))
Voltage <- as.numeric(as.character(subSetData$Voltage))
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#open graphic device
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
#2
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
#3
plot(datetime, Sub_metering_1, main = "", xlab = "", type = "l")
lines(datetime, Sub_metering_1, col = "black")
lines(datetime, Sub_metering_2, col ="red")
lines(datetime, Sub_metering_3, col ="blue")
legend("topright", pch = '-', col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#4
plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_ReActive_Power")
dev.off()

