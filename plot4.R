

# download zip file and extract to ./data/
# read data
# read raw data to table
data<-read.table("./data/household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?")

#str(data)
#head(data)
#names(data)
#View(data)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#View(data$Date)
str(data)

subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
str(subdata)
#View(subdata)
head(subdata)


datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)
str(subdata)


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))


with(subdata, 
 {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power",xlab="")
 }
)


## export to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

