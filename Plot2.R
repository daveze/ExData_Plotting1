data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",
                 colClasses=c(Date="character",Time="character"))

data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$DateTime <-as.POSIXct(strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S"))
data2 <- data[data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02") ,]
with(data2,plot(DateTime,Global_active_power
                ,type="l"
                , xlab=""
                ,ylab = "Global Active Power (kilowatts)"
))

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!