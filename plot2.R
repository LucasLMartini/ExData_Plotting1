par(mar = c(5.1,6,4.1,2.1))
par(mfrow=c(1,1))
par(cex=1)
l_start<-66638
l_end<-69518
nrows<-l_end-l_start
colclasses<-c("character","character",rep("numeric",7))
col_names <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
               "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dir = file.path("..","household_power_consumption.txt")
power<-read.csv(dir,sep=";",skip = l_start-1, nrows = nrows,
                colClasses = colclasses, header = F, col.names = col_names)
power <- within(power, Date_Time <- paste(power$Date, power$Time, sep=' '))
power <- within(power, Date_Time <- strptime(power$Date_Time,format = f))
plot(power$Date_Time,power$Global_active_power,type="l", ylab = "Global Active Power (kilowatts)",
     xlab="")
dev.copy(png,file = "plot2.png")
dev.off()