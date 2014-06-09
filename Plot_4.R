## Plot 4

## Downloading the data
# The zip file containing the raw data was downloaded as described in the file 
# "Downloading_Electrical_power_consumption_file".

## Reading and formatting the data 
# Reading and formatting the data (and estimating the memory required for the complete dataset) 
# is described in the "Plot_1_and_ReadingData_settingDataFormat.R" file.

# For Plot 4, there are four sublots:
# 4a - Upper left: The same as original Plot 2, a plot of Global Active Power against DateTime
# 4b - Upper right, a plot of voltage against DateTime
# 4c - Lower left: The same as original Plot 3, a plot of energy sub metering against DateTime
# 4d - Lower right, a plot of Global reactive power against DateTime.

# For 4a, y =Global_active-power, the data was further subset:
data2 <- data[, c("DateTime", "Global_active_power")]
str(data2)
# For 4b, y = Voltage, the data was further subset:
data4 <- data[, c("DateTime", "Voltage")]
str(data4)
# For 4c, y = Sub-metering 1, 2, 3; the data was further subset:
data3 <- data[, c("DateTime", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]
str(data3)
# For 4d, y = Global reactive power, the data was further subset:
data5 <- data[, c("DateTime", "Global_reactive_power")]
str(data5)

-----------------

## Plot 4
# Set plot colors 
plot_colors <- c("black","red","blue")
# Start PNG device driver to save output to ~figure.png.  
# Note that "type" had to be set to "Cairo-png" on my Windows system to encode the 
# proper plotting colors.
png(file = "Plot4.png", type = "cairo-png")
# Set the plot area for 4 graphs, laying them down by rows in a 2 by 2 matrix
par(mfrow =c(2, 2))

# Plot 4a: y = Global Active Power
# Plot the "step" type graph, setting annotations off
plot(data2, type = "s", ann = FALSE)
# Add the Y axis legend
title(ylab = "Global Active Power (kilowatts)")
# add the box around the graph
box()

# Plot 4b: y = Voltage
# Plot the "step" type graph, setting annotations off
plot(data4, type = "s", ann = FALSE)
# Add the Y and x axes legends
title(ylab = "Voltage")
title(xlab = "datetime")
# add the box around the graph
box()

# Plot 4c: y = Energy sub-metering 1, 2, 3
# Plot the "step" type graph for the Sub-metering 1 data, setting annotations off
plot(data3$DateTime, data3$Sub_metering_1, type = "s", ann=FALSE)
#Plot the "step" type line for the Sub-metering 2 data
lines(data3$DateTime, data3$Sub_metering_2, type = "s",col=plot_colors[2])
#Plot the "step" type line for the Sub-metering 3 data
lines(data3$DateTime, data3$Sub_metering_3, type = "s", col=plot_colors[3])
# Add the Y axis legend
title(ylab = "Energy sub metering")
#Create a legend at upper right that uses the same line colors used by the actual plots, with no border
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.9, col=plot_colors, lwd=2, bty = "n")
# add the box around the graph
box()

# Plot 4d: y = Global reactive power
# Plot the "step" type graph, setting annotations off
plot(data5, type = "s", ann = FALSE)
# Add the Y and x axes legends
title(ylab = "Global_reactive_power")
title(xlab = "datetime")
# add the box around the graph
box()

# Turn off the device driver so that the output is flushed to png
dev.off()

