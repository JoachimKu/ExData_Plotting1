# 
#  Course: Exploratory Data Analysis
#  Course project 1
#  
#  Plot 2: line chart
#

    first_date <- "1/2/2007"
    second_date <- "2/2/2007"
    
    mainsubdir <- "./"
    fname<-paste(mainsubdir,"household_power_consumption.txt", sep="")                      # set file name
    PowerCons<- read.table(fname, sep=";", dec=".", stringsAsFactors=FALSE, header=TRUE)    # read file
    
    subPowerCons <- PowerCons[PowerCons$Date %in% c(first_date, second_date) ,]             # create Subset
    rm(PowerCons)
    
    Plot_GAP <- as.numeric(subPowerCons$Global_active_power)                               # extract a col
    Plot_DateTime <- strptime(paste(subPowerCons$Date, subPowerCons$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
    
    png(filename = "plot2.png", width = 480, height = 480)                                  # Open PNG device
                                                                                            # Plot histogram
    plot(Plot_DateTime, Plot_GAP, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    dev.off()                                                                               # close device

