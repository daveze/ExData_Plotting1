#get the data
dt <- read.csv("C:/Users/David/Documents/household_power_consumption.txt",sep=";",as.is = TRUE)
dt_1 <- dt
dt_1$Time<- strptime(paste(dt_1$Date,dt_1$Time),"%d/%m/%Y %H:%M:%S")

dt_1$Date <- as.Date(dt_1$Date,"%d/%m/%Y")

x_1 <- as.numeric(dt_3$Sub_metering_1)
x_2 <- as.numeric(dt_3$Sub_metering_2)
x_3 <- as.numeric(dt_3$Sub_metering_3)
y<-dt_3$Time

plot(y,x_1,type="l",ylab = "Energy Sub metering", xlab="",col = "black")
lines(y, x_2 , col = "red")
lines(y, x_3 , col = "blue")

legend("topright",c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"))
