## Plot 1

# The zip file containing the raw data was downloaded as described in the file 
# "Downloading_Electrical_power_consumption_file".

## Reading the data

## Estimating the memory required
# The amount of memory required for the complete dataset of 2,075,259 rows and 9 columns 
# was estimated using a function published by Paul Hiemstra in an "R-bloggers" blog: 
# "Predicting the memory usage of an R object containing numbers". 
# <http://www.r-bloggers.com/predicting-the-memory-usage-of-an-r-object-containing-numbers/>
# The function and calculations to reach the estimated amount of memory required are 
# described in the file "Estimated_memory_usage_Electrical_power_consumption_file".
# Using this approach, the total predicted data size was approximately 1.3 Gb.
# My computer has approximately 5.5 GB available RAM, so this should not be a problem.

# However, to avoid uncompressing and reading the entire zipped unprocessed data file, 
# the dataset was subset to read only the required days (1/2/2007 and 2/2/2007) into the 
# data file and temporary memory was used for reading the the unprocessed data file in 
# archived zip file:

# Archived zip file name
zip_fname <- "./DataArchive/household_power_consumption.zip"

# Get the name of the unprocessed data file within the archived zip file 
# (Assumption: There is only one file in the archived zip file)
rawData_fname <- unzip(zip_fname, list = TRUE)$Name
rawData_fname

# Open a temporary file connection for collecting output of filtering
filtered.txt <- file()

# Open a connection for reading the target unprocessed data file in the archived zip 
# file without decompressing to disk
unz_rD <- unz(zip_fname, rawData_fname)

# Filter observations for target dates 1/2/2007 and 2/2/2007 using "grep" and "cat".
cat(grep("(^Date)|(^[1|2]/2/2007)", readLines(unz_rD), value=TRUE), sep = "\n", file = filtered.txt)

# Load filtered data into R using the "read.csv2" function since the semi-colon is 
# used as the separator. Since missing values are coded as "?", include the argument 
# "na.strings = "?"".  Include the argument "colClasses = "character" to set the 
# classes of the column.
data <- read.csv2(filtered.txt, na.strings = "?", colClasses = "character")

# Close connections
close(filtered.txt) ; close(unz_rD)

# Examine the data structure
str(data)

# Create a new column "DateTime" consisting of pasting the Date and Time columns together 
data <- within(data, DateTime <- paste(Date, Time, sep = " "))

# Change the Date column to the "Date" format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# Change the DateTime column to the POSIXlt format using the "strptime" function
data$DateTime <- strptime(data2$DateTime, format = "%d/%m/%Y %H:%M:%S")
# Use lapply to change columns 3:9 to numeric class
cols <- c(3:9)
data[, cols] <- lapply(cols, function(x) as.numeric(data[, x]))

# Examine the revised data structure
str(data)

## Plot 1
# Set plot colors 
plot_colors <- c("red","blue","black")

# Start PNG device driver to save output to ~figure.png.  
# Note that "type" had to be set to "Cairo-png" on my Windows system to encode the 
# proper plotting colors.
png(file = "Plot1.png", type = "cairo-png")
# Plot the histogram
hist(data$Global_active_power, col=plot_colors[1], main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# Turn off the device driver so that the output is flushed to png
dev.off()