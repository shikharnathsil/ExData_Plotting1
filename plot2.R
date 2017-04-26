# Read data from file
df<-read.table("household_power_consumption.txt", na.strings="?",sep = ";",header=TRUE)

# Format Date time per suggestion
df$Date=as.Date(df$Date,format="%d/%m/%Y")
df$datetime<-strptime(paste(df$Date,df$Time),format="%Y-%m-%d %H:%M:%S")

# Take 2 days only
pldat<-df[df$Date %in% as.Date(c('2007-02-01','2007-02-02')),]

# Draw line chart
plot(pldat$datetime,pldat$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")

# Write plot to png file
dev.copy(png,'plot2.png',width=480,height=480)

# Save file
dev.off()
