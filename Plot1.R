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


#-----------------------------------------------------------------
#Plot 1.
#-----------------------------------------------------------------
png(file="./figure/plot1.png", width=480, height=480, units="px")
hist(dataset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
