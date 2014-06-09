## Plot 3

## Downloading the data
# The zip file containing the raw data was downloaded as described in the file 
# "Downloading_Electrical_power_consumption_file".

## Reading and formatting the data 
# Reading and formatting the data (and estimating the memory required for the complete dataset) 
# is described in the "Plot_1_and_ReadingData_settingDataFormat.R" file.

# For Plot 3, the data was further subset:
data3 <- data[, c("DateTime", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]
str(data3)

## Plot 3
# Set plot colors 
plot_colors <- c("black","red","blue")
# Start PNG device driver to save output to ~figure.png.  
# Note that "type" had to be set to "Cairo-png" on my Windows system to encode the 
# proper plotting colors.
png(file = "Plot3.png", type = "cairo-png")
# Plot the "step" type graph for the Sub-metering 1 data, setting annotations off
plot(data3$DateTime, data3$Sub_metering_1, type = "s", ann=FALSE)
#Plot the "step" type line for the Sub-metering 2 data
lines(data3$DateTime, data3$Sub_metering_2, type = "s",col=plot_colors[2])
#Plot the "step" type line for the Sub-metering 3 data
lines(data3$DateTime, data3$Sub_metering_3, type = "s", col=plot_colors[3])
# Add the Y axis legend
title(ylab = "Energy sub metering")
#Create a legend at upper right that uses the same line colors used by the actual plots
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=plot_colors, lwd=2)
# add the box around the graph
box()
# Turn off the device driver so that the output is flushed to png
dev.off()
