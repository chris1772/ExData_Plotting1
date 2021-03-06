df <- read.table("c:/LearnR/ExplanatoryAnalysis/household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors=FALSE)
dates <- df$Date
times <- df$Time
datetime <- paste(dates, times, sep=" ")
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
df <- cbind(df, datetime)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Global_active_power <- as.numeric(df$Global_active_power)
df1 <- filter(df, df$Date =="2007-02-01" | df$Date=="2007-02-02")
df1$Sub_metering_1 <- as.numeric(df1$Sub_metering_1)
df1$Sub_metering_2 <- as.numeric(df1$Sub_metering_2)
df1$Sub_metering_3 <- as.numeric(df1$Sub_metering_3)
plot(df1$datetime, df1$Sub_metering_1,type="l", xlab="", ylab="Engery sub metering")
lines(df1$datetime, df1$Sub_metering_2, type="l", col="red")
lines(df1$datetime, df1$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,pt.cex=1, cex=0.9,col=c("black", "red", "blue"))
dev.copy(png, "c:/LearnR/ExplanatoryAnalysis/Plot3.png", height=480, width=480)
dev.off()




