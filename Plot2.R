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

# make data numeric, change to Date format
Datasub$Global_active_power <- as.character(Datasub$Global_active_power)
Datasub$Global_active_power <- as.numeric(Datasub$Global_active_power)

Datasub$Date <- as.Date(Datasub$Date,format="%d/%m/%Y")
Datasub$dt <-paste(Datasub$Date,Datasub$Time)
Datasub$dt <- as.POSIXlt(Datasub$dt, format = "%Y-%m-%d %H:%M:%S")
Sys.setlocale(category = "LC_TIME", locale = "C") # sets local time to get English labels

# Create device to plot histogram
png(filename = "./Coursera/Exploratory Data Analysis/plot2.png"
    , width = 480
    , height = 480
    , units = "px"
    , bg = "transparent"
    )
# create graph
plot(Datasub$dt
     , Datasub$Global_active_power
     , type="l"
     , ylab ="Global Active Power (kilowatts)"
     , xlab = ""
     )

# Close device after creating graph
dev.off()
