---
title: "Untitled"
output: 
  flexdashboard::flex_dashboard:
    orientation: columns
    vertical_layout: fill
---

```{r setup, include=FALSE}
#Importing libraries
library(flexdashboard)
library(tidyverse)
library(highcharter)
library(gt)
library(htmltools)
library(viridis)
```
```{r}
#Importing data
df<-read_csv("bestsellers with categories.csv",show_col_types = FALSE)
view(df)

#Data preprocessing
#Removing Duplicates
df<- df%>%
  distinct(Name,.keep_all = TRUE) %>%
  rename(User_Rating = 'User Rating')
view(df)
```


Books
=======================================================================
Column {.tabset .tabset.fade data-width=650}
-----------------------------------------------------------------------
### Most Popular Authors

```{r}
#colors
custom_colors<-viridis::magma(n = 15)

#Most popular authors by reviews
df%>%
  group_by(Author)%>%
  summarise(Reviews =sum(Reviews))%>%
  arrange(desc(Reviews))%>%
  head(15)%>%
  hchart('column',hcaes(x=Author,y=Reviews,color=custom_colors))%>%
  hc_add_theme(hc_theme_google())%>%
  hc_tooltip(pointFormat ='<b> Number of Reviews :</b>
            {point.y}<br>')%>%
  hc_title(text='Most Popular Authors from 2009 to 2019',
           style = list(fontSize='25px',fontWeight='bold'))%>%
  hc_subtitle(text = 'By Number of reviews',style = list(fontSize='16px'))%>%
  hc_credits(enabled =TRUE, text='@miguelfzzz')
```

### Most Popular Books

```{r}
#colors
custom_colors<-viridis::plasma(n = 15)

###Most Popular Books by reviews
df%>%
arrange(desc(Reviews))%>%
head(15)%>% 
hchart('bar',hcaes(x=Name,y=Reviews,color=custom_colors))%>%
hc_add_theme(hc_theme_google())%>%
hc_tooltip(pointFormat ='<b> Number of Reviews :</b>
            {point.y}<br>')%>%
hc_title(text='Most Popular Books from 2009 to 2019',
           style = list(fontSize='25px',fontWeight='bold'))%>%
hc_subtitle(text = 'By Number of reviews',style = list(fontSize='16px'))%>%
hc_credits(enabled =TRUE, text='@miguelfzzz')
```

### {.no_padding}

```{r}
#colors
custom_colors <- viridis::rocket(n = 2)
#Most common Genre

df%>%
  group_by(Genre)%>%
  summarise(count= n())%>%
  hchart('pie',hcaes(x=Genre,y = count,color=custom_colors))%>%
  hc_add_theme(hc_theme_google())%>%
hc_tooltip(pointFormat ='<b> Proportion:</b>
            {point.percentage.2f}<br>')%>%
hc_title(text='Most Common Genre from 2009 to 2019',
           style = list(fontSize='15px',fontWeight='bold'))%>%
hc_subtitle(text = 'By Number of reviews',style = list(fontSize='16px'))%>%
hc_credits(enabled =TRUE, text='@miguelfzzz')

```



