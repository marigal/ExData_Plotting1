# Reading the whole file, which should be placed with the script in the same folder
Elec_Pow_Con <- read.table("./household_power_consumption.txt",header=T, sep=";")

#Creation of an additional column which merges Date & Time values
Elec_Pow_Con$Date_Time<-paste(Elec_Pow_Con$Date, Elec_Pow_Con$Time)

# Conversion of the new column (Date_Time) from factor to Date/Time class using the strptime() function.
Elec_Pow_Con$Date_Time <- strptime(Elec_Pow_Con$Date_Time, format="%d/%m/%Y %H:%M:%S")

#Conversion of Date to Date class using as.Date() function
Elec_Pow_Con$Date <- as.Date(Elec_Pow_Con$Date, "%d/%m/%Y")

#Extraction of a subset with Dates ranging from 2007/02/01 to 2007/02/02
dataset <- subset(Elec_Pow_Con, Date %in% as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"))

#Conversion of "Global active power" from factor to numerical type
dataset$Global_active_power<-as.numeric(as.character((dataset$Global_active_power)))

#Conversion of "Global reactive power" from factor to numerical type
dataset$Global_reactive_power<-as.numeric(as.character((dataset$Global_reactive_power)))

#Conversion of "Voltage" from factor to numerical type
dataset$Voltage<-as.numeric(as.character((dataset$Voltage)))

#Conversion of "Sub_metering_1_2_3" from factor to numerical type
dataset$Sub_metering_1<-as.numeric(as.character((dataset$ Sub_metering_1)))
dataset$Sub_metering_2<-as.numeric(as.character((dataset$ Sub_metering_2)))
dataset$Sub_metering_3<-as.numeric(as.character((dataset$ Sub_metering_3)))


#-----------------------------------------------------------------
#Plot 4.
#-----------------------------------------------------------------
png(filename="./figure/plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

---------------------------------------------------------------------
#Plot 4.1 
----------------------------------------------------------------------
plot(dataset$Global_active_power, type="l",xaxt="n",xlab="", ylab="Global Active Power")
axis(1, at=1, labels= "Thu"); axis(1, at=1440, labels= "Fri"); axis(1, at=2880, labels= "Sat")
-----------------------------------------------------------------------
#Plot 4.2
-----------------------------------------------------------------------
plot(dataset$Voltage, type="l", xaxt="n", xlab="datetime", ylab="Voltage")
axis(1, at=1, labels= "Thu"); axis(1, at=1440, labels= "Fri"); axis(1, at=2880, labels= "Sat")
-------------------------------------------------------------------------
#Plot 4.3
----------------------------------------------------------------------------
plot(dataset$Sub_metering_1,type="l", xaxt="n", xlab="",ylab="Energy sub metering")
lines(dataset$Sub_metering_2, type="l", col="red")
lines(dataset$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0, box.col = "transparent", bg="transparent")
axis(1, at=1, labels= "Thu"); axis(1, at=1440, labels= "Fri"); axis(1, at=2880, labels= "Sat")
---------------------------------------------------------------------------------
#Plot 4.4
--------------------------------------------------------------------------------
plot(dataset$Global_reactive_power,type="l", xaxt="n",xlab="datetime",ylab="Global_reactive_power")
axis(1, at=1, labels= "Thu"); axis(1, at=1440, labels= "Fri"); axis(1, at=2880, labels= "Sat")
---------------------------------------------------------------------------------------

dev.off()
