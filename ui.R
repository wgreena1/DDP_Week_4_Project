library(shiny)

shinyUI(fluidPage(
        titlePanel("Predict Chick Weight from Age and Diet!"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput(inputId="slider_age", label="What is the age (in days) of the chick?", 0, 21, value = 0),
                        selectInput(inputId="diet", label="What is the chick's experimental diet?", c("1","2", "3", "4")),
                        checkboxInput("line", "Show corresponding regression line on plot?", value = FALSE),
                        submitButton("Submit")
                        ),
                mainPanel(
                        plotOutput("plot1"),
                        h3("Predicted Chick Weight (in grams):"),
                        textOutput("chick_pred")
                )
        )
))