if (!file.exists("Course Project 1")){
        dir.create("Course Project 1")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,"./Course Project 1/Household Power Consumption.zip", method="curl")
unzip("./Course Project 1/Household Power Consumption.zip", exdir = "./Course Project 1")
data <- read.table("./Course Project 1/household_power_consumption.txt", 
                   sep=";", 
                   na.strings="?", 
                   skip=66637,  
                   nrow=2880,   #skip and nrow pull only the two dates wanted
                   stringsAsFactors=FALSE
)
Sub_metering_1 <- as.numeric(data$V7)
Sub_metering_2 <- as.numeric(data$V8)
Sub_metering_3 <- as.numeric(data$V9)
datetime <- paste(data$V1,data$V2)
datetime <- as.POSIXct(strptime(datetime,"%d/%m/%Y %H:%M:%S"))
png("plot3.png")
plot(datetime, Sub_metering_1, 
     type="l", 
     xlab = "", 
     ylab="Energy sub metering"
)
lines(datetime, Sub_metering_2, col="red")
lines(datetime, Sub_metering_3, col="blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red","blue"),
       lty=1,
       )
dev.off()