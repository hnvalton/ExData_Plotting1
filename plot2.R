plot2 <- function(){
        #This function assumes that file "household_power_consumption.txt"
        #is in working directory
    
        library(data.table)
        library(lubridate)
        
        #read the data
        data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("NA", "-", "?"))

        #put in data table
        DT <- data.table(data)
        #filter days        
        DT <- DT[DT$Date=="1/2/2007" | DT$Date == "2/2/2007",]
        #Create a date time variable 
        DT <- DT[,DateTime:={dmy(Date) + hms(Time)}]

        #set time locale to english
        Sys.setlocale("LC_TIME", "English")
        
        #create a plot of type l (lines)
        plot(DT$DateTime, DT$Global_active_power, type = "l",
             main = "",
             ylab = "Global Active Power (kilowatts)",
             xlab = "")
        
        #Copy to file
        dev.copy(png, file = "plot2.png")
        dev.off()
        

}