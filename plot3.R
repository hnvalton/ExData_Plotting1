plot3 <- function(){
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
    DT <- DT[,DateTime:={dmy(Date) + hms(Time)}]
    
    #set time locale to english
    Sys.setlocale("LC_TIME", "English")
    
    #set the file
    png(filename = "plot3.png", width = 480, height = 480)
    #create a plot of type l (lines)
    with(DT, plot(DateTime, Sub_metering_1, type = "l",
         main = "",
         ylab = "Energy sub metering",
         xlab = ""))
    #add lines
    with(DT, lines(DateTime, Sub_metering_2, col = "red"))
    with(DT, lines(DateTime, Sub_metering_3, col = "blue"))
    
    #set legend
    legend("topright", lty = 1, col=c("black", "red", "blue"),
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    #Copy to file
#    dev.copy(png, file = "plot3.png")
    dev.off()
    
    
    
}