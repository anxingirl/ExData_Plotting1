 hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character",rep("numeric",7)))
 
  hpc_sub<- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007" )
 
 #convert FIRST column from character to Date
 #convert Second column from character to Time
 
  hpc_sub$DateTime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%d/%m/%Y %H:%M:%S")
  
  png(file="plot3.png",width=480,height=480)

  #Unfortunately, I have got my Rconsole set in Chinese,the x axis output Three gibberish code 
  #instead of ("Thu","Fri","Sat").So I have to disable the default axises and 
  #rewrite them:
  
  hpc_sub$sim <- 1:nrow(hpc_sub)
  
   plot (hpc_sub$sim,hpc_sub$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering",axes=FALSE)
  lines(hpc_sub$sim, hpc_sub$Sub_metering_2,col="red")
  lines(hpc_sub$sim, hpc_sub$Sub_metering_3,col="blue")
  
  axis(1, at=c(1,nrow(hpc_sub)/2,nrow(hpc_sub)),labels=c("Thu","Fri","Sat"))
  
  axis(2, at=c(0,10,20,30),labels=c("0","10","20","30"))
  
  box()
  
  legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
 
  dev.off()
 
 
 
 