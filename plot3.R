## Sets up a plot for assignment1
plot3 <- function() {
        ## Read the csv file
        powerData <- read.csv("household_power_consumption.txt",header = TRUE,sep=";")
        
        ## subset only dates that are needed
        febPowerData <- subset(powerData,as.Date(powerData$Date,"%d/%m/%Y")==as.Date("1/2/2007","%d/%m/%Y") | as.Date(powerData$Date,"%d/%m/%Y")==as.Date("2/2/2007","%d/%m/%Y"));
        
        ## initialize the device
        png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12);
        
        ## print the plot
        with (febPowerData , {
                plot (strptime(paste(febPowerData$Date,febPowerData$Time),format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(febPowerData$Sub_metering_1)),type="n",ylab = "Energy sub meetering", xlab="Day")
                lines (strptime(paste(febPowerData$Date,febPowerData$Time),format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(febPowerData$Sub_metering_1)),type="l",col="black")
                lines (strptime(paste(febPowerData$Date,febPowerData$Time),format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(febPowerData$Sub_metering_2)),type="l",col="red")
                lines (strptime(paste(febPowerData$Date,febPowerData$Time),format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(febPowerData$Sub_metering_3)),type="l",col="blue")
                legend("topright",c("Sub_meetering_1","Sub_meetering_2","Sub_meetering_3"),lty=c(1,1),col=c("black","red","blue"))
        })
        
        ## close the print device
        dev.off()
        
}
