####################################################### 
#### Created by Nilesh Kumar, IIM Raipur, India
#######################################################

###############  PLOTTING FUNCTIONS  ###############


# load some data
data(mtcars)
#View(mtcars) 

#wt = weight, mpg = miles per gallon, gear = Number of Gear, am = Automatic Manual, cyl = cylinders

#SCATTER PLOT

# create a basic scatter plot
plot(mtcars$wt, mtcars$mpg)

# specifying axis labels and add a title 
plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")

# getwd() setwd("your working directory") make sure your woeking directory is right
#getwd()
# save the graph either by using 'Export' in the 'Plots' tab in RStudio or using the following functions
png("scatterplot_weight_mpg.png")       # create PNG/jpg in current working directory
plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon",col="blue",
)
dev.off()   # "save" the PNG





#HISTOGRAMS

# create a basic histogram
hist(mtcars$mpg)
png("histogram_mpg.png") 
hist(mtcars$mpg, xlab="Miles per gallon", main="Histogram of Miles per Gallon", col="Blue", border="black")
dev.off()   # "save" the PNG


# control number of bins with parameter 'breaks'
hist(mtcars$mpg, breaks=12)
hist(mtcars$mpg, breaks=seq(10,34))

# get information about histogram
hInfo <- hist(mtcars$mpg, breaks=seq(10,34))
hInfo

# plot probability density instead of frequencies
hist(mtcars$mpg, breaks=seq(10,34), freq=F)

# create a kernel density plot
png("densityplot_mpg.png") 
plot(density(mtcars$mpg), col="blue", main="Density plot for Miles per gallon")
dev.off()   # "save" the PNG




#BAR PLOTS

# create a basic barplot
gearCounts <- table(mtcars$gear)
gearCounts
barplot(gearCounts)
barplot(gearCounts, xlab="Number of gears")
# label the bars individually with parameter 'names.arg'
png("barplot_gear.png") 
barplot(gearCounts, main="Bar graph for gear", col="blue", border="black", names.arg=c("3 Gears", "4 Gears", "5 Gears"))
dev.off()   # "save" the PNG

# stacked bar plot

gearTransmissionCounts <- table(mtcars$am, mtcars$gear)
gearTransmissionCounts
barplot(gearTransmissionCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"))
# add a legend with automatic labels with parameter 'legend.text'
barplot(gearTransmissionCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"), legend.text=T)
# add a legend with custom labels
barplot(gearTransmissionCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"), legend.text=c("automatic", "manual"))

# grouped bar plot with parameter 'beside=TRUE'
png("stackedbarplot_gear_am.png") 
barplot(gearTransmissionCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"), legend.text=c("automatic", "manual"), beside=TRUE)
dev.off()   # "save" the PNG



#Box Plots

# create a boxplot for an individual variable (e.g. miles per gallon)
boxplot(mtcars$mpg, ylab="Miles per gallon")

# create a boxplot for a variable by group (e.g. miles per gallon by cylinders)
boxplot(mpg ~ cyl, data=mtcars, xlab="Number of cylinders", ylab="Miles per gallon")
# do not draw outliers

png("Boxplot_cyl.png") 
boxplot(mpg ~ cyl, data=mtcars, xlab="Number of cylinders", ylab="Miles per gallon", outline=FALSE, col="Blue")
dev.off()   # "save" the PNG


#Line Plots

# load some time data (dataset of growth of five orange trees over time)
data(Orange)
View(Orange)
Orange

# extract data for 1st tree
tree1 <- subset(Orange, Orange$Tree==1)

# plot age vs circumference
plot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)")

# use lines with parameter 'type="l"'
plot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)", type="l")
# use both points and lines with parameter 'type="b"'
plot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)", type="b")
# use both points and lines overlayed with parameter 'type="o"'
png("lineplot_tree.png")
plot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)", type="o", main="Line plot", col="Blue")
dev.off()   # "save" the PNG

#Pie chart

#data to create pie chart
#Source https://www.moving.com/tips/the-top-10-largest-us-cities-by-population/

Cities <- c("New York", "Los Angeles", "Chicago", "Houston", "Phoenix", 
            "Philadelphia", "San Antonio", "San Diego", "Dallas", "San Jose")
Population <- c(8.60, 4.06, 2.68, 2.40, 2.71, 1.58, 1.57, 1.45, 1.40, 1.03 )
top_ten <- data.frame(Cities, Population)
top_ten

pie(top_ten$Population) #Basic R Pie Chart

pie(top_ten$Population, labels = Cities) # show label in pie chart

top_ten_descend <- top_ten[order(-top_ten$Population), ]

#add title in chart
pie(top_ten_descend$Population, labels = Cities, main = "Most Populous US Cities in 2019 (in millions)")


# Calculate percentages
pct <- round(100*top_ten_descend$Population/sum(top_ten_descend$Population))
# Draw oie chart
png("piechart_US_Population.png")
pie(top_ten_descend$Population,
    labels = paste(top_ten_descend$Cities, sep = " ", pct, "%"), 
    col = rainbow(length(top_ten_descend$Population)), 
    main = "Most Populous US Cities in 2019 (in millions)")
dev.off()   # "save" the PNG




