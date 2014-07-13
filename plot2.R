 hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character",rep("numeric",7)))
 
  hpc_sub<- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007" )
 
 #convert FIRST column from character to Date
 #convert Second column from character to Time
 
  hpc_sub$DateTime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%d/%m/%Y %H:%M:%S")
  
  png(file="plot2.png",width = 480, height=480)

  #with(hpc_sub,plot(DateTime, Global_active_power, type="l",xlab="",ylab="Global active power"))
  #The above line should be fine.
  #Unfortunately, I have got my Rconsole set in Chinese,the x axis output Three gibberish code 
  #instead of ("Thu","Fri","Sat").So I have to disable the default axises and 
  #rewrite them:
  
  hpc_sub$sim <- 1:nrow(hpc_sub)
  
  with(hpc_sub,plot(sim, Global_active_power, type="l",axes=FALSE,xlab="",ylab="Global active power"))
  
  axis(1, at=c(1,nrow(hpc_sub)/2,nrow(hpc_sub)),labels=c("Thu","Fri","Sat"))
  
  axis(2, at=c(0,2,4,6),labels=c("0","2","4","6"))
  
  box()
 
  dev.off()
 
 
 
 