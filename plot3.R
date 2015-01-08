### Raymon Verhoeven
### January 2015
### Coursera: Exploratory Data Analysis - Project 1

# First read the file into R
getwd()
Data<- read.table(file="./Coursera/Exploratory Data Analysis/household_power_consumption.txt"
                  , header = TRUE
                  , sep = ";")
View(Data)

# subset data to 1st and 2nd of February
?subset
Datasub <- subset(Data, Date=="1/2/2007" | Date=="2/2/2007")

# make data numeric, change to DateTime format
Datasub$Sub_metering_1 <- as.character(Datasub$Sub_metering_1)
Datasub$Sub_metering_1 <- as.numeric(Datasub$Sub_metering_1)
Datasub$Sub_metering_2 <- as.character(Datasub$Sub_metering_2)
Datasub$Sub_metering_2 <- as.numeric(Datasub$Sub_metering_2)

Datasub$Date <- as.Date(Datasub$Date,format="%d/%m/%Y")
Datasub$dt <-paste(Datasub$Date,Datasub$Time)
Datasub$dt <- as.POSIXlt(Datasub$dt, format = "%Y-%m-%d %H:%M:%S")
Sys.setlocale(category = "LC_TIME", locale = "C") # sets local time to get English labels

# Create device to plot histogram
png(filename = "./Coursera/Exploratory Data Analysis/plot3.png"
    , width = 480
    , height = 480
    , units = "px"
    , bg = "transparent"
    )

# create graph
plot(Datasub$dt
     , Datasub$Sub_metering_1
     , type="l"
     , ylab ="Energy sub metering"
     , xlab = ""
     )
lines(Datasub$dt
      , Datasub$Sub_metering_2
      , type="l"
      , col = "red"
      )
lines(Datasub$dt
      , Datasub$Sub_metering_3
      , type="l"
      , col = "blue"
      )
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

# Close device after creating graph
dev.off()
