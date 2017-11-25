#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
    titlePanel("Predict Flower Species from Sepal and Petal dimensions"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("Sepal Length", "What is the Sepal Length of the flower?", 4, 10, value = 5.8, step = 0.1),
            sliderInput("Sepal Width", "What is the Sepal Width of the flower?", 2, 5, value = 3, step = 0.1),
            sliderInput("Petal Length", "What is the Petal Length of the flower?", 1, 7, value = 4.3, step = 0.1),
            sliderInput("Petal Width", "What is the Petal Width of the flower?", 0.1, 2.5, value = 1.3, step = 0.1),
            submitButton("Submit")
        ),
        mainPanel(
                h6("The Application allows the user to specify the size of the flower's Sepal and Petal by using sliders.
                    Then, by using the Submit button, there is a decision tree algorithm that runs in the background to predict the species of the flower.
                   There are also 4 plots showing the distribution of the sizes and the currently selected size of each feature."),
                splitLayout(cellWidths = c("50%","50%"),
                            plotOutput("plot1", height = "220px"),
                            plotOutput("plot2", height = "220px")),
            
                splitLayout(cellWidths = c("50%","50%"),
                            plotOutput("plot3", height = "220px"),
                            plotOutput("plot4", height = "220px")),
            h3("Table of Predicted Species with Probabilities:"),
            tableOutput("pred")
            
        )
    )
))
