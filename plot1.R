 hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character",rep("numeric",7)))
 
  hpc_sub<- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007" )
 
 #convert FIRST column from character to Date
 #convert Second column from character to Time
 
  hpc_sub$DateTime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%d/%m/%Y %H:%M:%S")
  
  png(file="plot1.png", width = 480, height = 480)
 
 hist(hpc_sub$Global_active_power,col="red",xlab="Global active power(kilowatts)",main="Global active power")
 dev.off()
 
 
  
 
 
 