########################################################################
#Obtain and download Housing dataset
#'http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip' 
# Simply navigate to that web address, download, then unzip.  Keep track of file location
########################################################################

########################################################################
#This script assumes linux forward slash notation
########################################################################

getwd()
###
#setwd("Insert your directory location the Plot?.r script)
setwd("/home/brian/Projects/Coursera/Explore/Project1")

#######
##libraries
#######
library(data.table)
library(lubridate)

fileUrl <- 'http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
if (!file.exists("data")) {
  dir.create("data")
}

######
# Check if data already exists; if not, download it.
######

if (!file.exists('./data/household_power_consumption.zip')) {
  download.file(fileUrl, './data/household_power_consumption.zip', method='wget')
}

######
#Unzip file
#####
#unzip('./data/household_power_consumption.zip',exdir="./data")


####Read random sample to get file structure
tmp<-read.csv("./data/household_power_consumption.txt", header = TRUE, sep=";", nrows=20)
names(tmp)
################################
#This next step will take some processing time. If it fails, use the following code:
#df2 <- fread('grep "^[12]/2/2007" ./data/household_power_consumption.txt', sep=";", header= F, na.strings="?")
#colnames(df2)<-names(tmp)
################################

full<-read.csv("./data/household_power_consumption.txt",header=T,sep=";", na.strings=c("?",""))
full$Date<-dmy(full$Date)
full$Time<-hms(full$Time)
################################
#This next step will also take some processing time
################################


full$DateTime<-paste(full$Date,full$Time)
full$DateTime<-ymd_hms(full$DateTime)

################################
#This next grep step will take some processing time
################################

useDates<-grep("2007-02-01|2007-02-02",full$DateTime, value=F )
df<-full[useDates,]


##########################
#PLOT 4
##########################


#########################
#Change varialbes to numeric
#########################

df$Global_active_power<-as.numeric(df$Global_active_power)

#####################
#Create image folder/directory
#####################

if (!file.exists("images")) {
  dir.create("images")
}

#####################
#Create plot
#####################

par(mfrow=c(2,2))


#plot left top
plot2<-plot(df$Global_active_power~df$DateTime, type= "l", col="black",
            ylab="Global Active Power (kilowatts)"
            , xlab ="")

#plot right top
plot4<-plot(df$Voltage~df$DateTime, type= "l", col="black",
            ylab="Voltage"
            , xlab ="datetime"
            , axis(side =2, at =2))


#plot left bottom

plot3<-plot(df$Sub_metering_1~df$DateTime, type= "l", col="black",
            ylab="Energy sub metering"
            , xlab ="")
lines(df$Sub_metering_2~df$DateTime,col="red")
lines(df$Sub_metering_3~df$DateTime,col="blue")

legend ("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
        , box.lwd = 0 , lty = c(1, 1, 1), col = c("black","red","blue"))

#plot right bottom

plot5<-plot(df$Global_reactive_power~df$DateTime, type= "l", col="black",
            ylab="Global_reactive_power"
            , xlab ="datetime"
            , axis(side =2, at = 0:.5)
    )

#####################
#Copy screen device output to png, saved in ./images/ with w,h at 480 pixels
#####################

dev.copy(png, file = "./images/plot3.png", width = 480, height =480)  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!

