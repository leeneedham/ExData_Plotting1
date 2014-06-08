## Plot 2

## Downloading the data
# The zip file containing the raw data was downloaded as described in the file 
# "Downloading_Electrical_power_consumption_file".

## Reading and formatting the data 
# Reading and formatting the data (and estimating the memory required for the complete dataset) 
# is described in the "Plot_1_and_ReadingData_settingDataFormat.R" file.

# For Plot 2, the data was further subset:
data2 <- data[, c("DateTime", "Global_active_power")]
str(data2)

## Plot 2
# Start PNG device driver to save output to ~figure.png.  
# Note that "type" had to be set to "Cairo-png" on my Windows system to encode the 
# proper plotting colors.
png(file = "Plot2.png", type = "cairo-png")
# Plot the "step" type graph, setting annotations off
plot(data2, type = "s", ann=FALSE)
# Add the Y axis legend
title(ylab = "Global Active Power (kilowatts)")
# add the box around the graph
box()
# Turn off the device driver so that the output is flushed to png
dev.off()
