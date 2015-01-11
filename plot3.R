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
# Plot 3
##########

png(filename = 'plot3.png',
	width = 480,
	height = 480)

with(df, {
	plot(x = DateTime,
		y = SubMetering1,
		type = 'l',
		col = 'black',
		ann = FALSE)
	lines(x = DateTime,
		y = SubMetering2,
		type = 'l',
	 	col = 'red')
	lines(x = DateTime,
		y = SubMetering3,
		type = 'l',
	 	col = 'blue')
	title(ylab = 'Energy sub metering')
	legend('topright',
		legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
		lwd = c(1, 1, 1),
		col = c('black', 'red', 'blue'))
})

dev.off()
