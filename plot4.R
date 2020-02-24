temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)

data <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";")
unlink(temp)

df <- data %>% mutate(Date = as.Date(Date, format = "%d/%m/%Y")) %>% filter(Date == "2007-02-01" | Date == "2007-02-02")
png(filename = "plot4.png")
old.par <- par(mfrow=c(2, 2))
#Global Active Power
plot(as.numeric(df$Global_active_power), type = "l", ylab = "Global Actif Power")

#Voltage
plot(as.numeric(df$Voltage), type = "l", ylab = "Voltage", xlab = "datetime")

#Energy sub metering
plot(as.numeric(df$Sub_metering_1), type = "l", ylab = "Energy sub metering")
lines(as.numeric(df$Sub_metering_2), type = "l", col="red")
lines(as.numeric(df$Sub_metering_3), type = "l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 1)

#Global reactive power
plot(as.numeric(df$Global_reactive_power), type = "l", ylab = "Global_reactive_power", xlab = "datetime")

par(old.par)

# Save the file.
dev.off()