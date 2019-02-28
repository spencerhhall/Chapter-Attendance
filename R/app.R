# Load necessary packages
library("shiny")
library("ggplot2")

ui <- fluidPage(
  titlePanel("Weekly Chapter Attendance Data"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "week", label = "Week",
                  min = 1, max = 10, value = 1)
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)

server <- function(input, output) {
  output$plot <- renderPlot({
    df <-  read.csv("../data/clean_W19.csv", stringsAsFactors = FALSE)
    index <- input$week
    index2 <- index + 2
    df <- df[index:index2, ]
    View(df)
    my_plot <- ggplot(data = df) +
      geom_col(mapping = aes(x = Last.Name, y = frequency, fill = Last.Name), width = 1)
    my_plot
  })
}

shinyApp(ui = ui, server = server)
