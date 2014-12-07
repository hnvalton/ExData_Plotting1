plot1 <- function(){
    
    library(data.table)
    
#    file <-  paste(getwd() ,"household_power_consumption.txt")
#data <- read.table("household_power_consumption.txt", sep=";", na.strings=c("NA", "-", "?"), select=c(1,3),
#                   stringsAsFactors=TRUE)

    data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("NA", "-", "?"))
    DT <- data.table(data)
#    str(DT)

    DT <- DT[DT$Date=="1/2/2007" | DT$Date == "2/2/2007",]
    hist(DT$Global_active_power,
         main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)",
         col = "red")
    #Copy to file
    dev.copy(png, file = "plot1.png")
    dev.off()

}