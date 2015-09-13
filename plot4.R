# 
#  Course: Exploratory Data Analysis
#  Course project 1
#  
#  Plot 4: four plots
#

    first_date <- "1/2/2007"
    second_date <- "2/2/2007"
    
    mainsubdir <- "./"
    fname<-paste(mainsubdir,"household_power_consumption.txt", sep="")                      # set file name
    PowerCons<- read.table(fname, sep=";", dec=".", stringsAsFactors=FALSE, header=TRUE)    # read file
    
    subPowerCons <- PowerCons[PowerCons$Date %in% c(first_date, second_date) ,]             # create Subset
    rm(PowerCons)
    
    png(filename = "plot4.png", width = 480, height = 480)                                  # Open PNG device
    par(mfrow=c(2,2))                                           # 2 x 2 number of plots

    Plot_DateTime <- strptime(paste(subPowerCons$Date, subPowerCons$Time, sep=" "), "%d/%m/%Y %H:%M:%S")    
    
# First Plot
    Plot_GAP <- as.numeric(subPowerCons$Global_active_power)                               # extract a col
    plot(Plot_DateTime, Plot_GAP, type="l", ylab="Global Active Power", xlab="")   
    
# Second Plot   
    Plot_Voltage <- as.numeric(subPowerCons$Voltage)                               # extract a col
    plot(Plot_DateTime, Plot_Voltage, type="l", col="black", ylab="Voltage", xlab="datetime")    
    
# Third Plot
    Plot_SM1 <- as.numeric(subPowerCons$Sub_metering_1)                               # extract a col
    Plot_SM2 <- as.numeric(subPowerCons$Sub_metering_2)                               # extract a col
    Plot_SM3 <- as.numeric(subPowerCons$Sub_metering_3)                               # extract a col

    # Plot histogram
    plot(Plot_DateTime, Plot_SM1, type="l", col="black", ylab="Energy sub metering", xlab="")
    lines(Plot_DateTime, Plot_SM2, col="red")    
    lines(Plot_DateTime, Plot_SM3, col="blue")    
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid", lwd=1, col=c("black", "red", "blue"), bty= "n")

# Fourth Plot
    Plot_ReactivePower <- as.numeric(subPowerCons$Global_reactive_power)                               # extract a col
    plot(Plot_DateTime, Plot_ReactivePower, type="l", col="black", ylab="Voltage", xlab="datetime")    
    
# Close Plot
    dev.off()                                                                               # close device

