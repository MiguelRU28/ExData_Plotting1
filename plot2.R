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

#plot2

png(filename="plot2.png",width=480, height=480)
plot(x=data$POSIX ,y=data$Global_active_power, type = 'l', xlab='',ylab = 'Global Active Power (kilowatts)')
dev.off()






