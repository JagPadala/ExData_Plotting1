## Sets up a plot for assignment1
plot2 <- function() {
        ## Read the csv file
        powerData <- read.csv("household_power_consumption.txt",header = TRUE,sep=";")
        
        ## subset only dates that are needed
        febPowerData <- subset(powerData,as.Date(powerData$Date,"%d/%m/%Y")==as.Date("1/2/2007","%d/%m/%Y") | as.Date(powerData$Date,"%d/%m/%Y")==as.Date("2/2/2007","%d/%m/%Y"));
        
        ## initialize the device
        png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12);
        
        ## print the plot
        with (febPowerData , {
                plot (strptime(paste(febPowerData$Date,febPowerData$Time),format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(febPowerData$Global_active_power)),type="l",ylab = "Global Active Power (Kilowatts)", xlab="Datetime")
        })
        
        ## close the print device
        dev.off()
        
}
