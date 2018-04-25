##################################
# Load Data and Packages
##################################

library('ProjectTemplate')
load.project()
library(ggplot2)
library(cowplot)

##################################
# Examine response variables / labels -> start with Dataset 1
##################################

#remaining useful life (there are 100 engines in the first Training Set)
p0 <- ggplot(train.FD001, aes(x = rul)) + geom_histogram(binwidth = 1) + ggtitle('Count of Remaining Useful Life (RUL) for All 100 Engines in Dataset') 
p0 <- p0 + xlab('Remaining Useful Life (cycles)') + ylab('Count') + background_grid(major = "xy", minor = "none")
p0 <- p0 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))
save_plot("./graphs/1-histogram_rul.png", p0,base_aspect_ratio = 2)


##################################
# Examine features (21 sensors) -> start with Dataset 1
##################################

# time series plot with RUL
p1 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_1, color = factor(unit_number))) 
p1 <- p1 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 1') 
p1 <- p1 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p1 <- p1 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p2 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_2, color = factor(unit_number)))
p2 <- p2 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 2') 
p2 <- p2 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p2 <- p2 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p3 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_3, color = factor(unit_number)))
p3 <- p3 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 3') 
p3 <- p3 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p3 <- p3 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p4 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_4, color = factor(unit_number)))
p4 <- p4 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 4') 
p4 <- p4 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p4 <- p4 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p5 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_5, color = factor(unit_number)))
p5 <- p5 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 5') 
p5 <- p5 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p5 <- p5 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p6 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_6, color = factor(unit_number)))
p6 <- p6 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 6') 
p6 <- p6 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p6 <- p6 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p7 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_7, color = factor(unit_number))) 
p7 <- p7 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 7') 
p7 <- p7 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p7 <- p7 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p8 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_8, color = factor(unit_number)))
p8 <- p8 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 8') 
p8 <- p8 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p8 <- p8 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p9 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_9, color = factor(unit_number)))
p9 <- p9 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 9') 
p9 <- p9 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p9 <- p9 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p10 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_10, color = factor(unit_number)))
p10 <- p10 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 10') 
p10 <- p10 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p10 <- p10 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p11 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_11, color = factor(unit_number)))
p11 <- p11 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 11') 
p11 <- p11 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p11 <- p11 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p12 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_12, color = factor(unit_number)))
p12 <- p12 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 12') 
p12 <- p12 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p12 <- p12 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p13 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_13, color = factor(unit_number))) 
p13 <- p13 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 13') 
p13 <- p13 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p13 <- p13 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p14 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_14, color = factor(unit_number)))
p14 <- p14 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 14') 
p14 <- p14 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p14 <- p14 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p15 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_15, color = factor(unit_number)))
p15 <- p15 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 15') 
p15 <- p15 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p15 <- p15 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p16 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_16, color = factor(unit_number)))
p16 <- p16 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 16') 
p16 <- p16 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p16 <- p16 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p17 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_17, color = factor(unit_number)))
p17 <- p17 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 17') 
p17 <- p17 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p17 <- p17 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p18 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_18, color = factor(unit_number)))
p18 <- p18 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 18') 
p18 <- p18 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p18 <- p18 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p19 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_19, color = factor(unit_number))) 
p19 <- p19 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 19') 
p19 <- p19 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p19 <- p19 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p20 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_20, color = factor(unit_number)))
p20 <- p20 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 20') 
p20 <- p20 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p20 <- p20 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

p21 <- ggplot(train.FD001, aes(x = -rul, y = sensor_measurement_21, color = factor(unit_number)))
p21 <- p21 + geom_smooth(method = 'loess', se = FALSE, size=0.5) + theme(legend.position="none") + ggtitle('Sensor 21') 
p21 <- p21 + xlab('Number of Cycles Until Failure') + ylab('Sensor Measurement') + background_grid(major = "xy", minor = "none")
p21 <- p21 + theme(axis.text=element_text(size=10), axis.title=element_text(size=12))

plot_sensors <- plot_grid(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21, ncol = 4)
save_plot("./graphs/2-plot_sensors.png", plot_sensors, ncol = 4, nrow = 6, base_aspect_ratio = 0.8)


#box plots 
# ggplot(train.FD001, aes(x = factor(class_label), y = sensor_measurement_6, fill = factor(unit_number))) +
#   geom_boxplot() + theme(legend.position="none")


# Overlaid histograms
h1 <- ggplot(train.FD001, aes(x=sensor_measurement_1, fill=factor(class_label))) + ggtitle('Sensor 1') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.05, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h2 <- ggplot(train.FD001, aes(x=sensor_measurement_2, fill=factor(class_label))) + ggtitle('Sensor 2') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.05, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                       breaks=c("0", "1"),
                       labels=c("Operational", "Failure Within 30 Days"))

h3 <- ggplot(train.FD001, aes(x=sensor_measurement_3, fill=factor(class_label))) + ggtitle('Sensor 3') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=1, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h4 <- ggplot(train.FD001, aes(x=sensor_measurement_4, fill=factor(class_label))) + ggtitle('Sensor 4') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=1, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h5 <- ggplot(train.FD001, aes(x=sensor_measurement_5, fill=factor(class_label))) + ggtitle('Sensor 5') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.05, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h6 <- ggplot(train.FD001, aes(x=sensor_measurement_6, fill=factor(class_label))) + ggtitle('Sensor 6') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.01, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h7 <- ggplot(train.FD001, aes(x=sensor_measurement_7, fill=factor(class_label))) + ggtitle('Sensor 7') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.05, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h8 <- ggplot(train.FD001, aes(x=sensor_measurement_8, fill=factor(class_label))) + ggtitle('Sensor 8') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.01, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h9 <- ggplot(train.FD001, aes(x=sensor_measurement_9, fill=factor(class_label))) + ggtitle('Sensor 9') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=1, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h10 <- ggplot(train.FD001, aes(x=sensor_measurement_10, fill=factor(class_label))) + ggtitle('Sensor 10') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.05, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h11 <- ggplot(train.FD001, aes(x=sensor_measurement_11, fill=factor(class_label))) + ggtitle('Sensor 11') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.02, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h12 <- ggplot(train.FD001, aes(x=sensor_measurement_12, fill=factor(class_label))) + ggtitle('Sensor 12') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.1, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h13 <- ggplot(train.FD001, aes(x=sensor_measurement_13, fill=factor(class_label))) + ggtitle('Sensor 13') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.01, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h14 <- ggplot(train.FD001, aes(x=sensor_measurement_14, fill=factor(class_label))) + ggtitle('Sensor 14') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=1, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h15 <- ggplot(train.FD001, aes(x=sensor_measurement_15, fill=factor(class_label))) + ggtitle('Sensor 15') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.01, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h16 <- ggplot(train.FD001, aes(x=sensor_measurement_16, fill=factor(class_label))) + ggtitle('Sensor 16') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.05, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h17 <- ggplot(train.FD001, aes(x=sensor_measurement_17, fill=factor(class_label))) + ggtitle('Sensor 17') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=1, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h18 <- ggplot(train.FD001, aes(x=sensor_measurement_18, fill=factor(class_label))) + ggtitle('Sensor 18') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.05, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h19 <- ggplot(train.FD001, aes(x=sensor_measurement_19, fill=factor(class_label))) + ggtitle('Sensor 19') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.05, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h20 <- ggplot(train.FD001, aes(x=sensor_measurement_20, fill=factor(class_label))) + ggtitle('Sensor 20') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.02, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

h21 <- ggplot(train.FD001, aes(x=sensor_measurement_21, fill=factor(class_label))) + ggtitle('Sensor 21') +
  xlab('Sensor Measurement') + ylab('Count') + background_grid(major = "xy", minor = "none") +
  geom_histogram(binwidth=.01, alpha=.5, position="identity") + theme(legend.position="top") + 
  guides(fill=guide_legend(title=NULL)) + scale_fill_manual(values=c("#2970DE", "#DE0928"), 
                                                            breaks=c("0", "1"),
                                                            labels=c("Operational", "Failure Within 30 Days"))

hist_sensors <- plot_grid(h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15,h16,h17,h18,h19,h20,h21, ncol = 4)
save_plot("./graphs/3-hist_sensors.png", hist_sensors, ncol = 4, nrow = 6, base_aspect_ratio = 0.8)
