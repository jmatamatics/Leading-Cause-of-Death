
library(shiny)
library(ggplot2)
library(dplyr)
#load("death.Rdata")
#death <- read_csv(leadingdeath/death.csv)


shinyServer(function(input, output) {
  output$header <- renderText({
    paste("You have selected", input$ethnicity, input$sex)
    })

  
  output$bar <- renderPlot({
    ifelse(input$ethnicity == "All 4 Races",  
           filtered.death <- death %>% filter(Year == input$range, Sex == input$sex),
    filtered.death <- death %>% filter(Year == input$range, Race.Ethnicity == input$ethnicity, Sex == input$sex))
    g <- ggplot(data= filtered.death,aes(x=Leading.Cause,Deaths)) 
    
    g + geom_bar(aes(fill=Leading.Cause), stat = "identity") + 
      xlab(input$range)+ylab("Deaths") + theme_classic() + theme(axis.text.x=element_blank())
    
    
  })
  
  output$head <- renderText({
    paste("You have selected", input$eth, input$s)
  })
  
  output$b<- renderPlot({
    ifelse(input$eth == "All 4 Races",  
           filtered.death <- death %>% filter(Year == input$r, Sex == input$s),
           filtered.death <- death %>% filter(Year == input$r, Race.Ethnicity == input$eth, Sex == input$s))
    g <- ggplot(data= filtered.death,aes(x=Leading.Cause,Deaths)) 
    
    g + geom_bar(aes(fill=Leading.Cause), stat = "identity") + 
      xlab(input$range)+ylab("Deaths") + theme_classic() + theme(axis.text.x=element_blank())
    
    
  })
  
  })


  

