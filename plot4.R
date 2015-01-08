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
Datasub <- subset(Data, Date=="1/2/2007" | Date=="2/2/2007")

# make data numeric, change to DateTime format
Datasub$Sub_metering_1 <- as.character(Datasub$Sub_metering_1)
Datasub$Sub_metering_1 <- as.numeric(Datasub$Sub_metering_1)
Datasub$Sub_metering_2 <- as.character(Datasub$Sub_metering_2)
Datasub$Sub_metering_2 <- as.numeric(Datasub$Sub_metering_2)
Datasub$Voltage <- as.character(Datasub$Voltage)
Datasub$Voltage <- as.numeric(Datasub$Voltage)
Datasub$Global_active_power <- as.character(Datasub$Global_active_power)
Datasub$Global_active_power <- as.numeric(Datasub$Global_active_power)
Datasub$Global_reactive_power <- as.character(Datasub$Global_reactive_power)
Datasub$Global_reactive_power <- as.numeric(Datasub$Global_reactive_power)
Datasub$Date <- as.Date(Datasub$Date,format="%d/%m/%Y")
Datasub$dt <-paste(Datasub$Date,Datasub$Time)
Datasub$dt <- as.POSIXlt(Datasub$dt, format = "%Y-%m-%d %H:%M:%S")
Sys.setlocale(category = "LC_TIME", locale = "C") # sets local time to get English labels

# Create device to plot histogram
png(filename = "./Coursera/Exploratory Data Analysis/plot4.png"
    , width = 480
    , height = 480
    , units = "px"
    , bg = "transparent"
    )

# create graphs
par(mfrow=c(2,2))

# Plot top left
plot(Datasub$dt
     , Datasub$Global_active_power
     , type="l"
     , ylab ="Global Active Power"
     , xlab = ""
     , cex.lab=0.75
     , cex.axis=0.75
)

# Plot top right
plot(Datasub$dt
     , Datasub$Voltage
     , type="l"
     , ylab ="Voltage"
     , xlab = "datetime"
     , cex.lab=0.75
     , cex.axis=0.75
)

# Plot bottom left
plot(Datasub$dt
     , Datasub$Sub_metering_1
     , type="l"
     , ylab ="Energy sub metering"
     , xlab = ""
     , cex.lab=0.75
     , cex.axis=0.7
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
legend("topright"
       , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , lty=1
       , col=c("black","red","blue")
       , cex=0.75
       , bty="n"
       )

# Plot bottom right
plot(Datasub$dt
     , Datasub$Global_reactive_power
     , type="l"
     , ylab ="Global_reactive_power"
     , xlab = "datetime"
     , cex.lab=0.75
     , cex.axis=0.7
)

# Close device after creating graph
dev.off()
