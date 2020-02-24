library(dplyr)
if(file.exists("household_power_consumption.txt")){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
} else{
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
  
  data <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";")
  unlink(temp)
}


df <- data %>% mutate(Date = as.Date(Date, format = "%d/%m/%Y")) %>% filter(Date == "2007-02-01" | Date == "2007-02-02")
png(filename = "plot3.png")
plot(as.numeric(as.character(df$Sub_metering_1)), type = "l", ylab = "Energy sub metering")
lines(as.numeric(as.character(df$Sub_metering_2)), type = "l", col="red")
lines(as.numeric(as.character(df$Sub_metering_3)), type = "l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 1)

# Save the file.
dev.off()