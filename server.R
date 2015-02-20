library(shiny)
library(datasets)

carsData <- mtcars

shinyServer(
    function(input, output){
        output$car <- renderText({input$car})
        output$mpg <- renderText({carsData$mpg[rownames(carsData) == input$car]})
        output$dist <- renderText({
            if(input$measure == 'miles'){
                paste(input$dist," miles")
            }else{
                paste(input$dist," kilometers")
            }
        })
        calc <- reactive({
            if(input$measure == 'miles'){
                input$dist/carsData$mpg[rownames(carsData) == input$car]
            }else{
                input$dist*0.621371192/carsData$mpg[rownames(carsData) == input$car]
            }
        })
        output$fuel <- renderText({
            paste(format(round(calc(),2))," gallons / ",
                  format(round(calc()*3.78541,2)), " litres")
        })    
    }
)