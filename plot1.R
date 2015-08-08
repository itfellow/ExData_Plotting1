# read data
# download zip file and extract to ./data/
data<-read.table("./data/household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?")

str(data)
head(data)
names(data)
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
png(filename = "plot1.png",width = 480,height = 480)


hist(subdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## export directy to PNG without showing 
# Add the PNG file and R code file to the top-level folder of your git repository 
#(no need for separate sub-folders)
dev.off()
