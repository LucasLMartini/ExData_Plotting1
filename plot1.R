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
hist(power$Global_active_power,col="red",main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.copy(png,file = "plot1.png")
dev.off()