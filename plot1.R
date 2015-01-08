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

# Make data for plot 1 numeric

Datasub$Global_active_power <- as.character(Datasub$Global_active_power)
Datasub$Global_active_power <- as.numeric(Datasub$Global_active_power)

# Create device to plot histogram
png(filename = "./Coursera/Exploratory Data Analysis/plot1.png"
    , width = 480
    , height = 480
    , units = "px"
    , bg = "transparent"
    )
# create graph
hist(Datasub$Global_active_power
     , main  = "Global Active Power"
     , xlab  = "Global Active Power (kilowatts)"
     , col   = "red"
     )
# Close device after creating graph
dev.off()
