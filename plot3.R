

# read data
#data<-read.table("./data/household_power_consumption.txt")
# read raw data to table

# download zip file and extract to ./data/
data<-read.table("./data/household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?")

#str(data)
#head(data)
#names(data)
#View(data)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#View(data$Date)
str(data)

#subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
str(subdata)
#View(subdata)
head(subdata)


datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)
str(subdata)





png(filename = "plot3.png",width = 480,height = 480)


with(subdata, {
  plot(Sub_metering_1~Datetime, type="l",ylab="Energy Sub metering (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## exporting to file
dev.off()
