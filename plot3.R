# Read data from file
df<-read.table("household_power_consumption.txt", na.strings="?",sep = ";",header=TRUE)

# Format Date time per suggestion
df$Date=as.Date(df$Date,format="%d/%m/%Y")
df$datetime<-strptime(paste(df$Date,df$Time),format="%Y-%m-%d %H:%M:%S")

# Filter 2 days data
pldat<-df[df$Date %in% as.Date(c('2007-02-01','2007-02-02')),]

#Draw line chart
plot(pldat$datetime,pldat$Sub_metering_1,type="l",col=1,xlab="",ylab="Energy Sub Metering")
lines(pldat$datetime,pldat$Sub_metering_2,col=2)
lines(pldat$datetime,pldat$Sub_metering_3,col=4)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lty=c(1,1))

# Write plot to png file
dev.copy(png,'plot3.png',width=800,height=1000)

# Save file
dev.off()
