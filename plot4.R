# read data format date time fields and subset data and create Date Time field
#
epc <- read.table("household_power_consumption.txt",sep = ";",header=TRUE, na.strings = "?")
epc$Date <- as.Date(epc$Date,"%d/%m/%Y")
epc <- subset(epc, Date == "2007-02-01" | Date == "2007-02-02")
epc$DateTime <- with(epc,as.POSIXct(paste(Date,Time)))

# create plots to PNG file
png(file="plot4.png",width = 480, height = 480)
par(mfrow= c(2,2), mar = c(0,2,0,0), oma = c(0, 0, 0, 0), pin = c(2.1,1.8))
#
plot(epc$Global_active_power~epc$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
#
plot(epc$Voltage~epc$DateTime, type = "l", ylab = "Voltage", xlab = "datetime")
#
plot(epc$Sub_metering_1~epc$DateTime, type = "n", ylab = "Energy Sub Metering", xlab = "")
points(epc$Sub_metering_1~epc$DateTime, type = "l", )
points(epc$Sub_metering_2~epc$DateTime, type = "l", col = "red")
points(epc$Sub_metering_3~epc$DateTime, type = "l", col = "blue")
legend("topright", c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),
       text.col = c("black","red","blue"), bty = "n")
plot(epc$Global_reactive_power~epc$DateTime, type = "l", ylab = "Global Reactive Power", xlab = "datetime")
dev.off()