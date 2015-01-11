# Coursera, Exploratory Data Analysis, January 2015

# Project 1: Reconstruct plots, all of which were constructed using the base
# plotting system

#############################
# Code for reading the data
#############################
# (common to all plot{1, 2, 3, 4}.R files of this assignment)

df <- read.table(file = 'household_power_consumption.txt',
	header = FALSE,
	sep = ';',
	col.names = c('Date',
		'Time',
		'GlobalActivePower',
		'GlobalReactivePower',
		'Voltage',
		'GlobalIntensity',
		'SubMetering1',
		'SubMetering2',
		'SubMetering3'),
	na.strings = '?',
	colClasses = c('character',
		'character',
		rep('numeric', 7)),

	# (Use nrow and skip to very quickly parse the file)
	nrows = 2880,
	skip = 66637)

df$DateTime <- strptime(paste(df$Date, df$Time), '%d/%m/%Y %H:%M:%S')
df$Date <- as.Date(df$Date, '%d/%m/%Y')

# (Redundant) code to subset the data if we later decide to no longer use nrows
# and skip during the initial parsing of the file

df <- subset(x = df,
	subset = (as.Date('1/2/2007', '%d/%m/%Y') <= Date) &&
		(Date <= as.Date('2/2/2007', '%d/%m/%Y')))

##########
# Plot 2
##########

png(filename = 'plot2.png',
	width = 480,
	height = 480)

with(df, {
	plot(x = DateTime,
		y = GlobalActivePower,
		type = 'l',
		ann = FALSE)
	title(ylab = 'Global Active Power (kilowatts)')
})

dev.off()
