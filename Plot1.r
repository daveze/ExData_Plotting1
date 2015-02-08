data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",
                 colClasses=c(Date="character",Time="character"))

data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$DateTime <-as.POSIXct(strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S"))
data2 <- data[data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02") ,]



#Plot1
names(data2)
png(file="plot1.png",width = 480, height = 480)
hist(data2$Global_active_power,col="red"
     ,main="Global Active Power"
     ,xlab = "Global Active Power (kilowatts)"
)
dev.off() ## Don't forget to close the PNG device!
