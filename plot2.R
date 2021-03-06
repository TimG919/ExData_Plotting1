# read data format date time fields and subset data and create Date Time field
#
epc <- read.table("household_power_consumption.txt",sep = ";",header=TRUE, na.strings = "?")
epc$Date <- as.Date(epc$Date,"%d/%m/%Y")
epc <- subset(epc, Date == "2007-02-01" | Date == "2007-02-02")
epc$DateTime <- with(epc,as.POSIXct(paste(Date,Time)))

# create plot to PNG file
png(file="plot2.png",width = 480, height = 480)
plot(epc$Global_active_power~epc$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
