par(mar = c(5.1,6,4.1,2.1))
par(cex=0.5)
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
f <- "%d/%m/%Y %H:%M:%S"
power <- within(power, Date_Time <- strptime(power$Date_Time,format = f))
png(file = "plot4.png")
par(mfrow=c(2,2))
plot(power$Date_Time,power$Global_active_power,type="l", ylab = "Global Active Power",
     xlab="")
plot(power$Date_Time,power$Voltage,type="l", ylab = "Voltage",
     xlab="datetime")
plot(power$Date_Time,power$Sub_metering_1,type="l", ylab = "Energy Sub-metering",
     xlab="")
lines(power$Date_Time,power$Sub_metering_2,type="l",col="red")
lines(power$Date_Time,power$Sub_metering_3,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,
       col = c("black","red","blue"),box.lwd = 0)
plot(power$Date_Time,power$Global_reactive_power,type="l", ylab = "Global Reactive Power",
     xlab="datetime")
#dev.copy(png,file = "plot4.png")
dev.off()