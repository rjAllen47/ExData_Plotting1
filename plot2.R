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
Global_active_power <- as.numeric(data$V3)
datetime <- paste(data$V1,data$V2)
datetime <- as.POSIXct(strptime(datetime,"%d/%m/%Y %H:%M:%S"))
png("plot2.png")
plot(datetime, Global_active_power, 
     type="l", 
     xlab = "", 
     ylab="Global Active Power (kilowatts)"
     )
dev.off()

