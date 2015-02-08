data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",
                 colClasses=c(Date="character",Time="character"))

data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$DateTime <-as.POSIXct(strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S"))
data2 <- data[data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02") ,]
#par(mfrow = c(1, 1)) 
png(file="plot3.png",width = 480, height = 480)
with(data2,plot(DateTime,Sub_metering_1
                ,type="l"
                , xlab=""
                ,ylab = "Energy sub metering"
                
))

with(data2, points(DateTime, Sub_metering_2, col = "red",type="l"))
with(data2, points(DateTime, Sub_metering_3, col = "blue",type="l"))
legend("topright", pch = 1, col = c("black", "red", "blue")
       , legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
  

       )


dev.off() ## Don't forget to close the PNG device!
