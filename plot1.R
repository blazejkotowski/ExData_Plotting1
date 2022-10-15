hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hpc$Date <- strptime(hpc$Date, "%d/%m/%Y")
filtered <- hpc[hpc$Date >= strptime("01/02/2007", "%d/%m/%Y") & hpc$Date <= strptime("02/02/2007", "%d/%m/%Y"), ]

png(filename="plot1.png", width=480, height=480, units="px")
hist(filtered$Global_active_power, xlab="Global active power (kilowatts)", main="Global Active Power", col="red")
dev.off()