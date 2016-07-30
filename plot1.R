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


#plot 1
#str(subSetData)
globalActivePower <- as.numeric(as.character(sub_data$Global_active_power))
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


