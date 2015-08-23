library(shiny)
data(mtcars)

shinyServer
(
    function(input, output) 
    {
        observeEvent(input$goButton, 
        {
        output$oid1 <- renderPrint({
                isolate({
                    input$goButton
                    if(is.null(input$id1))
                        "mpg ~ wt"
                    else
                        paste("mpg ~", paste(input$id1, collapse=" + "))
                })
        })
        
        output$oid2 <- renderPrint({
            isolate({
                if(is.null(input$id1))
                    frml <- "mpg ~ wt"
                else
                    frml <- paste("mpg ~", paste(input$id1, collapse=" + "))
                
                modLM <- lm(as.formula(frml), data = mtcars)
                summary(modLM)
            })
        })
        })
    }
)