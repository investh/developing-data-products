library(shiny)
library(datasets)

data <- mtcars

shinyUI(pageWithSidebar(
    headerPanel(
        "Fuel Calculator"
    ),
    sidebarPanel(
        h3("About"),
        p("Use this apllication to calculate the required fuel  for your travel 
          distance"),
        h3('How to use this application'),
        tags$ol(
            tags$li('Select your car model'),
            tags$li('Select distance measure [miles/km]'),
            tags$li('Enter travel distance'),
            tags$li('The required fuel will be displayed on the right'),
            tags$li('Change any of the variables to explore different option')
        ),
        selectInput("car", "Select your car model:", choices = rownames(data)),
        radioButtons("measure", "Select distance measure:",
                     c("Miles" = "miles","Kilometers" = "km")),
        numericInput('dist','Enter travel distance in miles', 0, min=0,max=100000,step=10)
    ),
    mainPanel(
        h3('Result'),
        tags$br(),
        h4('Selected car:'),
        textOutput('car'),
        tags$br(),
        h4('Selected distance:'),
        textOutput('dist'),
        tags$br(),
        h4('Required fuel:'),
        tags$span(textOutput('fuel'),style = "color: Green;font-size: 24px;")
    )
))