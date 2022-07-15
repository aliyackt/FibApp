library(shiny)

ui <- fluidPage(
  titlePanel("Hello Shiny! First Example"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "bins", label = "Number of Bins:", 
                  min = 1, max = 50, value = 30)),
    mainPanel(
      plotOutput(outputId = "distPlot")
    )
  )
)
#fluidPage:resposive

server <- function(input, output){
  output$distPlot <- renderPlot({
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "#75AADB",
         border = "white", xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
  })
}

shinyApp(ui = ui, server = server)
# shinyApp: execute and give output
