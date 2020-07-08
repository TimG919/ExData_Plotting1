epc <- read.table("household_power_consumption.txt",sep = ";",header=TRUE, na.strings = "?")
epc$Date <- as.Date(epc$Date,"%d/%m/%Y")
epc <- subset(epc, Date == "2007-02-01" | Date == "2007-02-02")
epc$Time <- strftime(epc$Time,"%H:%M:%S")