# 
#  Course: Exploratory Data Analysis
#  Course project 1
#  
#  Plot 3: three line charts
#

    first_date <- "1/2/2007"
    second_date <- "2/2/2007"
    
    mainsubdir <- "./"
    fname<-paste(mainsubdir,"household_power_consumption.txt", sep="")                      # set file name
    PowerCons<- read.table(fname, sep=";", dec=".", stringsAsFactors=FALSE, header=TRUE)    # read file
    
    subPowerCons <- PowerCons[PowerCons$Date %in% c(first_date, second_date) ,]             # create Subset
    rm(PowerCons)
    
    Plot_SM1 <- as.numeric(subPowerCons$Sub_metering_1)                               # extract a col
    Plot_SM2 <- as.numeric(subPowerCons$Sub_metering_2)                               # extract a col
    Plot_SM3 <- as.numeric(subPowerCons$Sub_metering_3)                               # extract a col
    Plot_DateTime <- strptime(paste(subPowerCons$Date, subPowerCons$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
    
    png(filename = "plot3.png", width = 480, height = 480)                                  # Open PNG device
                                                                                            # Plot histogram
    plot(Plot_DateTime, Plot_SM1, type="l", col="black", ylab="Energy sub metering", xlab="")
    lines(Plot_DateTime, Plot_SM2, col="red")    
    lines(Plot_DateTime, Plot_SM3, col="blue")    
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid", lwd=1, col=c("black", "red", "blue"), border = "black")
    dev.off()                                                                               # close device

