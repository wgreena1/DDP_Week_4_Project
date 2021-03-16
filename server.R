library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
        
        fit<-lm(weight~ Time+Diet, data=ChickWeight)
        
        fit_data<-reactive({
                subset(ChickWeight, Diet== input$diet)
        })
        
        output$plot1 <- renderPlot({
                ggplot(ChickWeight) + 
                        aes(x=Time, y=weight, col=as.factor(Diet)) +
                        geom_point() +
                        xlab("Chick Age (Days)")+
                        ylab("Chick Weight (Grams)")+
                        scale_color_discrete("Experimental Diet")+
                        if(input$line) {
                                geom_smooth(data= fit_data(),method='lm')
                                }
        })
        
        df<- reactive({
                data.frame(Time= input$slider_age,
                           Diet=as.factor(input$diet))
        })
        
        chick_pred <- reactive({
                predict(fit, df())
        })
        
        output$chick_pred<-renderText(chick_pred())
        
})


