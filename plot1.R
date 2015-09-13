# 
#  Course: Exploratory Data Analysis
#  Course project 1
#  
#  Plot 1: One histogram
#

    first_date <- "1/2/2007"
    second_date <- "2/2/2007"
    
    mainsubdir <- "./"
    fname<-paste(mainsubdir,"household_power_consumption.txt", sep="")                              # set file name
    PowerCons<- read.table(fname, sep=";", dec=".", stringsAsFactors=FALSE, header=TRUE)    # read file
    
    subPowerCons <- PowerCons[PowerCons$Date %in% c(first_date, second_date) ,]              # create Subset
    rm(PowerCons)
    
    Plot_GAP <- as.numeric(subPowerCons$Global_active_power)                               # extract a col
    
    png(filename = "plot1.png", width = 480, height = 480)                                  # Open PNG device
                                                                                            # Plot histogram
    hist(Plot_GAP, main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
    dev.off()                                                                               # close device

