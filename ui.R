library(shiny)

shinyUI
(
    pageWithSidebar
    (
        headerPanel("Impact of Predictors on Linear Regression"),
        sidebarPanel
        (
            h4('Choose Predictors'),
            checkboxGroupInput("id1", NULL,
                               c("wt",
                                 "cyl",
                                 "disp",
                                 "hp"), selected="wt"),
            actionButton("goButton", "Build")
        ),
        
        mainPanel(
            h4('Objective'),
            p('This simple shiny app demonstrates the impact of predictors on accuracy of regression. We use mtcars dataset to predict mpg based on various predictors.'),
            p('Please choose at least one predictor in the side panel and click on Build to view the summary of the model. If you don\'t choose any predictor, wt is chosen by default'),
            p(' '),
            h4('Formula'),
            verbatimTextOutput("oid1"),
            h4('Linear Regression Model'),
            verbatimTextOutput("oid2")
        )
    )
)