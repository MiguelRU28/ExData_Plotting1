
# Commencing the work:

temp <- tempfile() # open it

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)

data <- read.table(unz(temp,"household_power_consumption.txt"), 
                   sep=";", 
                   header = T, 
                   na="?", 
                   colClasses = c("character",
                                  'character',
                                  'numeric',
                                  'numeric',
                                  'numeric',
                                  'numeric',
                                  'numeric',
                                  'numeric',
                                  'numeric'))

dim(data)

unlink(temp) # close it

# Subsetting based on the assignment instructions.(only those dates 2007-02-01 and 2007-02-02)

data <- data[which(data$Date == '2/2/2007' | data$Date=='1/2/2007'),]

# After this we lessened a lot out dimension data. (from 2075259 to 2880)

# setting the date format.

data$POSIX <-as.POSIXlt.character(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")


#plot4

png(filename="plot4.png",width=480, height=480)
par(mfrow=c(2,2))
plot(x=data$POSIX ,y=data$Global_active_power, type = 'l', xlab='',ylab = 'Global Active Power')
plot(x=data$POSIX ,y=data$Voltage, type = 'l', xlab='datetime',ylab = 'Voltage')
plot(x=data$POSIX,y=data$Sub_metering_1, type='l', col = 'black', ylab = 'Energy sub metering', xlab = '')
lines(x=data$POSIX,y=data$Sub_metering_2, col='red')
lines(x=data$POSIX,y=data$Sub_metering_3, col='blue')
legend('topright', legend = c('Sub_metering_1',"Sub_metering_2","Sub_metering_3"), col = c('black','red','blue'), lty = 1, bty = "n")
plot(x=data$POSIX ,y=data$Global_reactive_power, type = 'l', xlab='datetime',ylab = 'Global_reactive_power')

dev.off()
