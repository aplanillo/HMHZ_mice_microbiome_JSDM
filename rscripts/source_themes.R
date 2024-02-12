
# this script contains the premade themes for the ggplots for three options:
# - theme_ap: light background single plot
# - theme_ap_facets: light background facet plot
# - theme_ap_dark: dark background single plot


# to be able to change the fonts, we might need to run this code before
# library(extrafont)
# font_import()
# loadfonts(device = "win")

theme_ap <- function(){

  font <- "Arial"   #assign font family up front

  theme_bw() %+replace%    #replace elements we want to change

    theme(

      #grid elements
      # panel.grid.major = element_blank(),    #strip major gridlines
      # panel.grid.minor = element_blank(),    #strip minor gridlines
      # axis.ticks = element_blank(),          #strip axis ticks

      #text elements
      plot.title = element_text(             #title
        family = font,            #set font family
        size = 20,                #set font size
        face = 'bold',            #bold typeface
        hjust = 0,                #left align
        vjust = 2),               #raise slightly

      plot.subtitle = element_text(          #subtitle
        family = font,            #font family
        size = 14),               #font size

      plot.caption = element_text(           #caption
        family = font,            #font family
        size = 9,                 #font size
        hjust = 1),               #right align

      axis.title = element_text(             #axis titles
        family = font,            #font family
        size = 14,
        face = "bold"),               #font size

      axis.text = element_text(              #axis text
        family = font,            #axis famuly
        size = 12),                #font size

      axis.text.x = element_text(            #margin for axis text
        margin=margin(5, b = 10)),

      axis.text.y = element_text(            #margin for axis text
        margin=margin(l = 5, r = 10)),

      legend.title = element_text(             #axis titles
        family = font,            #font family
        size = 14,
        face = "bold"),

      legend.text = element_text(              #axis text
        family = font,            #axis famuly
        size = 12)

      #since the legend often requires manual tweaking
      #based on plot content, don't define it here
    )
}



theme_ap_facets <- function(){

  # font <- "Helvetica"   #assign font family up front

  theme_bw() %+replace%    #replace elements we want to change

    theme(

      #grid elements
      # panel.grid.major = element_blank(),    #strip major gridlines
      # panel.grid.minor = element_blank(),    #strip minor gridlines
      # axis.ticks = element_blank(),          #strip axis ticks

      #text elements
      plot.title = element_text(             #title
        family = font,            #set font family
        size = 20,                #set font size
        face = 'bold',            #bold typeface
        hjust = 0,                #left align
        vjust = 2),               #raise slightly

      plot.subtitle = element_text(          #subtitle
        family = font,            #font family
        size = 14),               #font size

      plot.caption = element_text(           #caption
        family = font,            #font family
        size = 9,                 #font size
        hjust = 1),               #right align

      axis.title = element_text(             #axis titles
        family = font,            #font family
        size = 14,
        face = "bold"),               #font size

      axis.text = element_text(              #axis text
        family = font,            #axis famuly
        size = 12),                #font size

      axis.text.x = element_text(            #margin for axis text
        margin=margin(5, b = 10)),

      axis.text.y = element_text(            #margin for axis text
        margin=margin(l = 5, r = 10)),

      legend.title = element_text(             #axis titles
        family = font,            #font family
        size = 14,
        face = "bold"),

      legend.text = element_text(              #axis text
        family = font,            #axis famuly
        size = 12),

      strip.text.x = element_text(
        size = 12, color = "black"),

      strip.text.y = element_text(
        size = 12, color = "black")

    )
}



theme_ap_dark <- function(){

  # font <- "Arial"   #assign font family up front

  theme_bw() %+replace%    #replace elements we want to change

    theme(

      panel.background = element_rect(fill = "grey10"),

      #grid elements
      panel.grid.major = element_line(colour = "grey30"),    #strip major gridlines
      panel.grid.minor = element_line(colour = "grey30", linetype = 2),    #strip minor gridlines
      # axis.ticks = element_blank(),          #strip axis ticks

      #text elements
      plot.title = element_text(             #title
        family = font,            #set font family
        size = 20,                #set font size
        face = 'bold',            #bold typeface
        hjust = 0,                #left align
        vjust = 2),               #raise slightly

      plot.subtitle = element_text(          #subtitle
        family = font,            #font family
        size = 14),               #font size

      plot.caption = element_text(           #caption
        family = font,            #font family
        size = 9,                 #font size
        hjust = 1),               #right align

      axis.title = element_text(             #axis titles
        family = font,            #font family
        size = 14,
        face = "bold"),               #font size

      axis.text = element_text(              #axis text
        family = font,            #axis famuly
        size = 12),                #font size

      axis.text.x = element_text(            #margin for axis text
        margin=margin(5, b = 10)),

      axis.text.y = element_text(            #margin for axis text
        margin=margin(l = 5, r = 10)),

      legend.title = element_text(             #axis titles
        family = font,            #font family
        size = 14,
        face = "bold"),

      legend.text = element_text(              #axis text
        family = font,            #axis famuly
        size = 12)

      #since the legend often requires manual tweaking
      #based on plot content, don't define it here
    )
}



