#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
library(e1071)
shinyServer(function(input, output) {
    rpartmodel <- train(Species ~., data = iris, method = "rpart")
    
    rpartpred <- reactive({
        Inputs <- data.frame(Sepal.Length = input$`Sepal Length`, Sepal.Width = input$`Sepal Width`, Petal.Length = input$`Petal Length`, Petal.Width = input$`Petal Width`)
        out1 <- predict(rpartmodel, newdata = Inputs, type ="prob")
        out1
    })
    
    
    output$plot1 <- renderPlot({
    Sepal_Length_Input <- input$`Sepal Length`
    ggplot(iris, aes(x = Sepal.Length, fill = Species)) + geom_density() + 
        geom_vline(xintercept = Sepal_Length_Input, size = 2, color = "Red")
    })
    
    output$plot2 <- renderPlot({
    Sepal_Width_Input <- input$`Sepal Width`
    ggplot(iris, aes(x = Sepal.Width, fill = Species)) + geom_density() + 
        geom_vline(xintercept = Sepal_Width_Input, size = 2, color = "Red")
    })
    
    output$plot3 <- renderPlot({
        Petal_Length_Input <- input$`Petal Length`
        ggplot(iris, aes(x = Petal.Length, fill = Species)) + geom_density() + 
            geom_vline(xintercept = Petal_Length_Input, size = 2, color = "Red")
    })
    
    output$plot4 <- renderPlot({
        Petal_Width_Input <- input$`Petal Width`
        ggplot(iris, aes(x = Petal.Width, fill = Species)) + geom_density() + 
            geom_vline(xintercept = Petal_Width_Input, size = 2, color = "Red")
    })
    
    
    output$pred <- renderTable({
        rpartpred()
    })
})
