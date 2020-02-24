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
png(filename = "plot2.png")
plot(as.numeric(as.character(df$Global_active_power)), type = "l", ylab = "Global Actif Power(kilowatts)", main = "Global Active Power")
# Save the file.
dev.off()