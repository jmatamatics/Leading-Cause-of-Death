library(shiny)

# Define UI for application that draws bar graph
shinyUI(fluidPage(
  
  # Application title
  titlePanel(" Leading Causes of Deaths In NYC(2007-2014)"),
  
   
  sidebarLayout(
    sidebarPanel(
      
      selectInput("ethnicity", # choose the race
                  label = "Choose a ethnicity to display",
                  choices = c("White", "Black", "Hispanic", "Asian", "All 4 Races"),
                  selected = "Hispanic"),
      selectInput("sex", # choose the sex
                  label = "Choose a sex to display",
                  choices = c("Male","Female"),
                  selected = "Male"),
      sliderInput("range", label = "Year",
                  min = 2007, max = 2014,
                  value = 2007, step = 1,
                  pre = "", sep = "",
                  animate = TRUE)
      ),
    
    # Show a bar graph
    mainPanel(
      textOutput("header"),
      tableOutput("test"),
      plotOutput("bar", height = "300px")
    )
   
),

  

  
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("eth", # choose the race
                  label = "Choose a ethinicity to display",
                  choices = c("White", "Black", "Hispanic", "Asian", "All 4 Races"),
                  selected = "Black"),
      selectInput("s", # choose the sex
                  label = "Choose a sex to display",
                  choices = c("Male","Female"),
                  selected = "Male"),
      sliderInput("r", label = "Year",
                  min = 2007, max = 2014,
                  value = 2007, step = 1,
                  pre = "", sep = "",
                  animate = TRUE)
    ),
    
    # Show a bar graph
    mainPanel(
      textOutput("head"),
      tableOutput("t"),
      plotOutput("b", height = "300px")
    )
    
  )
)
)


