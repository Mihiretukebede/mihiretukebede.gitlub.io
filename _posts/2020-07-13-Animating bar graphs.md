---
title: "Animating Bargraph"
date: "29/06/2020"
categories: Blog posts
output: html_document
---

<link rel="stylesheet" href="styles.css" type="text/css">

  Hello, this is my first ever blog post. Detail explanations of this data vizualization and other upcoming blogs are coming soon soon! Stay tuned. 
  

```r
library(readxl)
mystepcount <- read_excel("mystepcount.xlsx")
```

```
## Error: `path` does not exist: 'mystepcount.xlsx'
```

```r
str(mystepcount)
```

```
## Error in str(mystepcount): object 'mystepcount' not found
```

```r
library(ggplot2)
library(gganimate)
library(scales)
theme_set(theme_bw())

mystepcount$September <- as.character(mystepcount$September)
```

```
## Error in eval(expr, envir, enclos): object 'mystepcount' not found
```
  


```r
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
  xlab("June") +  
  scale_y_discrete(name="Step counts", limits=c(5000,10000, 15000, 20000, 25000, 30000)) +
  theme(axis.line = element_line(colour = "black"),
          panel.border = element_blank()) ,
  
  duration = .001
  )
```

```
## Error in ggplot(mystepcount, aes(x = September, y = Steps)): object 'mystepcount' not found
```