plot4 <- function(){
    
    #This function assumes that file "household_power_consumption.txt"
    #is in working directory
    
    library(data.table)
    library(lubridate)    
    
    #read the data
    data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                       na.strings=c("NA", "-", "?"))
    
    #put in data table
    DT <- data.table(data)
    #filter days        
    DT <- DT[DT$Date=="1/2/2007" | DT$Date == "2/2/2007",]
    #Create a date time variable 
    DT <- DT[,datetime:={dmy(Date) + hms(Time)}]
    
    #set time locale to english
    Sys.setlocale("LC_TIME", "English")

    #set the grid
    par(mfrow=c(2,2))

    #plot 1
    with(DT, {
    plot(datetime, Global_active_power, type = "l",
         main = "",
         ylab = "Global Active Power",
         xlab = "")

    #Plot 2
    plot(datetime, Voltage, type = "l",
         main = "")
    
    #plot 3
    plot(datetime, Sub_metering_1, type = "l",
                  main = "",
                  ylab = "Energy sub metering",
                  xlab = "")
    #add lines
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    
    #set legend
    legend("top", lty = 1, col=c("black", "red", "blue"),
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           bty = "n", cex = 0.8)

    #Plot 4
    plot(datetime, Global_reactive_power, type = "l",
         main = "")
    })
    #Copy to file
    dev.copy(png, file = "plot4.png")
    dev.off()
    
    
}