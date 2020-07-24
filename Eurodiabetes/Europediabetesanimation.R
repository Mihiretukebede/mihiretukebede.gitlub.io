library(readr)
Eurodiabetes <- read_csv("Eurodiabetes.csv")
View(Eurodiabetes)

library(dplyr)

ger_au_ch <- Eurodiabetes %>% 
  filter(Location %in% c("Austria", "Germany", "Switzerland", "Denmark", "Portugal", "Finland"))
ger_au_ch <- na.omit(ger_au_ch)
ger_au_ch$Prev <- ger_au_ch$Value*100

str(ger_au_ch)

is.factor(ger_au_ch$Year)
ger_au_ch$yearfactor <- factor(ger_au_ch$Year)

ger_au_ch$Yearnumeric <- as.numeric(ger_au_ch$Year)


### Required packages
library(ggplot2)
library(gganimate)
library(scales)
library(lattice)
library(directlabels)


euro_anim <- ggplot(ger_au_ch, aes(x=Yearnumeric, y=Prev, col=Location)) + 
  geom_point(size=6) + transition_time(Yearnumeric)  +
  shadow_mark()  +  
  scale_x_continuous(name ="Year",
                     breaks= c(1990,1995,2000,2005, 
                               2010, 2015, 2020)) +
  
  xlab("Year") +
  ylab("Prevalence of diabetes in %") +
  labs(col="Country") + 
  ggtitle("Prevalence of diabetes cases in Austria, Germany and Switzerland") +
  
  theme(
    axis.title.x = element_text(color = "Blue", size=15),
    axis.title.y = element_text(color = "Blue", size=15),
    axis.text.x = element_text(size = 15),
    axis.text.y = element_text(size = 15),
    
    plot.title = element_text(size=20),
    
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 10),
    legend.position = "None",
    
    text = element_text(family = "Comics Sans MS")
  ) + ease_aes('cubic-in-out') +
  geom_dl(aes(label=Location),
          method=list("last.points",rot=40)) 


### Not that the gifski_renderer is to loop the gif or not
animate(euro_anim, renderer = gifski_renderer(loop = F), width = 700, height = 700, duration = 15)


euro_anim <- ggplot(ger_au_ch, aes(x=Yearnumeric, y=Prev, col=Location)) + 
  geom_point(size=6) + transition_time(Yearnumeric)  +
  shadow_mark()  +  
  scale_x_continuous(name ="Year",
                     breaks= c(1990,1995,2000,2005, 
                               2010, 2015, 2020)) +
  
  xlab("Year") +
  ylab("Prevalence of diabetes in %") +
  labs(col="Country") + 
  ggtitle("Prevalence of diabetes cases in Austria, Germany and Switzerland") +
  shadow_wake(wake_length = 0.1, alpha = FALSE) +
  theme(
    axis.title.x = element_text(color = "Blue", size=15),
    axis.title.y = element_text(color = "Blue", size=15),
    axis.text.x = element_text(size = 15),
    axis.text.y = element_text(size = 15),
    
    plot.title = element_text(size=20),
    
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 10),
    legend.position = "None",
    
    text = element_text(family = "Comics Sans MS")
  ) + ease_aes('cubic-in-out') +
  geom_dl(aes(label=Location),
          method=list("last.points",rot=40)) 



animate(euro_anim, renderer = gifski_renderer(loop = F), width = 700, height = 700, duration = 15)
