

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


subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
str(subdata)
#View(subdata)
head(subdata)


datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)
str(subdata)

## Construct the plot and save it to a PNG file 
## with a width of 480 pixels and a height of 480 pixels.
png(filename = "plot2.png",width = 480,height = 480)


plot(subdata$Global_active_power~subdata$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")


dev.off()
