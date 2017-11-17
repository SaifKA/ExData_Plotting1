

if(!file.exists("data")){
  dir.create("data")
  
}



### Download Data

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "./data/HH_power_consumption.zip")


df<-read.table(unz("./data/HH_power_consumption.zip","household_power_consumption.txt"),header = T,sep=";",na.strings = "?")



### Store Raw data for time and date conversion

df1<-df


df1$datetime<-paste0(df1$Date,df1$Time,sep=" ")

df1$datetime<-strptime(df1$datetime,"%d/%m/%Y %H:%M:%S")


### Final Data to work on

df2<-df1[which(df1$datetime>='2007-02-01' & df1$datetime<'2007-02-03'),]



png(filename = "plot1.png",width=480,height = 480)

hist(x = df2$Global_active_power,col= 'red',main="Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()

