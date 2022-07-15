server <- function(input, output){
  datasetInput <- reactive({
    switch (input$dataset,
      "rock" = rock,
      "pressure" = pressure,
      "cars" = cars
    )
  })
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  output$distPlot <- renderPlot({
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "#75AADB",
         border = "white", xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
  })
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
}

