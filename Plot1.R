df <- read.table("c:/LearnR/ExplanatoryAnalysis/household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors=FALSE)
dates <- df$Date
times <- df$Time
datetime <- paste(dates, times, sep=" ")
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
df <- cbind(df, datetime)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Global_active_power <- as.numeric(df$Global_active_power)
df1 <- filter(df, df$Date =="2007-02-01" | df$Date=="2007-02-02")
hist(df1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red") 
dev.copy(png, file="c:/LearnR/ExplanatoryAnalysis/Plot1.png", height=480, width=480)
dev.off()


