data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",
                 colClasses=c(Date="character",Time="character"))

data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$DateTime <-as.POSIXct(strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S"))
data2 <- data[data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02") ,]

par(mfrow = c(2, 2)) # 2 row 2 columns
with(data2,plot(DateTime,Global_active_power
                ,type="l"
                , xlab=""
                ,ylab = "Global Active Power (kilowatts)"
))

with(data2,plot(DateTime,Voltage
                ,type="l"
                , xlab="datetime"
                ,ylab = "Voltage"
))

with(data2,plot(DateTime,Sub_metering_1
          ,type="l"
          , xlab=""
          ,ylab = "Energy sub metering"
))

with(data2, points(DateTime, Sub_metering_2, col = "red",type="l"))
with(data2, points(DateTime, Sub_metering_3, col = "blue",type="l"))
legend("topright", pch = 1, col = c("black", "red", "blue")
          , legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
          ,cex=0.8
)

with(data2,plot(DateTime,Global_reactive_power
                ,type="l"
                , xlab="datetime"

))