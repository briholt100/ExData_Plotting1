#### Introduction
By, Brian Holt, MA
January 11, 2015
for Coursera project 1, exploring data, Leek, Peng, Cafo

######  Basic instructions

Each script has instructions for each command.

All scripts will require the use of Linux, as I have not tested them on windows.  The modifications I made were just removing the "s" from https.  However, this code seemed to not work consistently in Windows environments, so beware.  

All .PNG images are located in the images folder of repository.

#### A comment to peer reviewers

When I create the plots on my screen, they look very close to the images created by Dr. Peng. Even the last plot with 4 individual plots.

But when I look at what is produced by my github repo, the images have changed.  

Based on this comment: https://class.coursera.org/exdata-010/forum/thread?thread_id=94#comment-259

I've decided that my images are correct enough for the purposes of this assignment.  Of course, it's up to you to decide. Please take a look at what the screen produces before deciding I should get zero.


#Warning:
I did not read the data using fread, instead, I just read the whole data into a table.  This may take a lot of processing time.

Lastly, each script below contains commands to download a zip file, create both "data" and "image" directories, and unzips a file.  

I have put a comment mark infront of the unzip command so that you can control when or whether you want to execute that command. 

##### Data descriptions:

This assignment uses data from the UC Irvine Machine Learning Repository (http://archive.ics.uci.edu/ml/), a popular repository for machine learning datasets. In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available on the course web site.


Dataset: Electric power consumption [20Mb] (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)


Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.


The following descriptions of the 9 variables in the dataset are taken from the UCI web site: (https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption)

  1.  Date: Date in format dd/mm/yyyy
  2.  Time: time in format hh:mm:ss
  3.  Global_active_power: household global minute-averaged active power (in kilowatt)
  4.  Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
  5.  Voltage: minute-averaged voltage (in volt)
  6.  Global_intensity: household global minute-averaged current intensity (in ampere)
  7.  Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
  8.  Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
  9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

