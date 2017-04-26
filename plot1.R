# Read data from household file ~~2 million rows and 9 vars.
df<-read.table("household_power_consumption.txt", na.strings="?", sep = ";",header=TRUE)

# Format Date time as per suggestion
df$Date=as.Date(df$Date,format="%d/%m/%Y")

df$datetime<-strptime(paste(df$Date,df$Time),format="%Y-%m-%d %H:%M:%S")

# Filter data by two days only, use dates 1st, 2nd feb, 2007
pldat<-df[df$Date %in% as.Date(c('2007-02-01','2007-02-02')),]

# Draw histogram per specs
hist(pldat$Global_active_power,xlab="Global Active Power (kilowatts)", ylab="Frequency",col ="Red",main = "Global Active Power")

# Write plot to png file
dev.copy(png,'plot1.png',width=480,height=480)

#Save file
dev.off()
