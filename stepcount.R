
library(readxl)
mystepcount <- read_excel("mystepcount.xlsx")

str(mystepcount)

library(ggplot2)
library(gganimate)
library(scales)
theme_set(theme_bw())



mystepcount$September <- as.character(mystepcount$September)

animate(
  ggplot(mystepcount, aes(x=September,y=Steps)) + 
  geom_bar(fill="#004C99", stat="identity", width=1, position=position_dodge()) + 
    geom_hline(yintercept = 10000, col="black", size=1) +
  transition_states(September, wrap = FALSE) +
  shadow_mark() +
  enter_grow() +
  enter_fade() + 
  theme(axis.text = element_text(size=16),
        axis.title = element_text(size=16, face="bold")) + 
  xlab("September") +  
  scale_y_discrete(name="Step counts", limits=c(5000,10000, 15000, 20000, 25000, 30000)) +
  
    theme(axis.line = element_line(colour = "black"),
          panel.border = element_blank()) ,
  
  duration = .001
  )


