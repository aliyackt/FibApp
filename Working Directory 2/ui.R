ui <- fluidPage(
  titlePanel("Hello Shiny! First Example"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "bins", label = "Number of Bins:", 
                  min = 1, max = 50, value = 30),
      selectInput("dataset", "Choose a dataset: ", choices = c("rock", "pressure",
                                                               "cars")),
      numericInput("obs", "Number of Observation to View: ", 10)),
    mainPanel(
      plotOutput(outputId = "distPlot"),
      mainPanel(verbatimTextOutput("summary"), tableOutput("view"))
    )
  )
)