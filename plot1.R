plot1 <- function() {
        powerData <- read.csv("household_power_consumption.txt",header = TRUE,sep=";")
        
        febPowerData <- subset(powerData,as.Date(powerData$Date,"%d/%m/%Y")==as.Date("1/2/2007","%d/%m/%Y") | as.Date(powerData$Date,"%d/%m/%Y")==as.Date("2/2/2007","%d/%m/%Y"));
        
        
        png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12);
        hist(as.numeric(as.character(febPowerData$Global_active_power)),main="Global Active Power",xlab = "Global Active Power (kilowatts)",col=c("red"))
        dev.off()
        
}
