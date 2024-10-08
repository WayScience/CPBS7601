# install.packages(c("shiny", "dplyr", "ggplot2"))

library(shiny)
library(dplyr)
library(ggplot2)

# Load themes
source(file.path("../6.data_visualization/ggplot_themes.R"))
       
# Load built-in datasets
data("mpg")
mpg <- mpg %>%
  dplyr::mutate(full_car_name = paste(year, manufacturer, model, sep = " "))

data("iris")

# UI (User Interface)
ui <- fluidPage(
  titlePanel("CPBS 7601 - Basic Shiny App Tutorial"),
  
  tabsetPanel(
    tabPanel(
      "Exploring miles per gallon",
      
      sidebarLayout(
        sidebarPanel(
          # First option - setting x axis
          selectInput(
            "mpg_xvar",
            "X-axis variable:",
            choices = colnames(mpg),
            selected = "displ"
          ),
          
          # Second option - setting y axis
          selectInput(
            "mpg_yvar",
            "Y-axis variable:",
            choices = colnames(mpg),
            selected = "hwy"
          ),
          
          # Third option - setting fill color
          selectInput(
            "mpg_fill_color",
            "Fill color:",
            choices = colnames(mpg),
            selected = "class"
          ),
          
          # First check box
          checkboxGroupInput(
            "mpg_years", "Select Car Years:",
            choices = sort(unique(mpg$year)),  # List all unique years as choices
            selected = unique(mpg$year)
          ),  
          
          # Second checkbox
          checkboxInput("filter_duplicates", "Filter duplicate car models", value = FALSE)
        ),
        
        mainPanel(
          plotOutput("ggplot_mpg")  # Output for the ggplot
        )
      )
    ),
    
    tabPanel(
      "Exploring the iris dataset",
      sidebarLayout(
        sidebarPanel(
           selectInput(
             "iris_xvar",
             "X-axis variable:",
             choices = colnames(iris),
             selected = "Sepal.Length"
             ),
           
           selectInput(
             "iris_yvar",
             "Y-axis variable:", 
             choices = colnames(iris),
             selected = "Petal.Width"
             ),
           
           selectInput(
             "iris_color_var",
             "Color by:",
             choices = colnames(iris),
             selected = "Species"
           ),
           
           selectInput(
             "iris_size_var",
             "Size by:",
             choices = colnames(iris),
             selected = "Sepal.Width"
           )
         ),
        mainPanel(
          plotOutput("ggplot_iris")
          )
        )
      )
  )
)

# Server (Back-end Logic)
server <- function(input, output) {
  output$ggplot_mpg <- renderPlot({

    # Filter the data based on selected x-range from the slider
    filtered_data <- mpg %>%
      dplyr::filter(year %in% input$mpg_years)
    
    if (input$filter_duplicates) {
      filtered_data <- filtered_data %>%
        dplyr::distinct(full_car_name, .keep_all = TRUE)
    }
    
    # Create the plot using ggplot2
    (
      ggplot(
        data = filtered_data,
        aes_string(
          x = input$mpg_xvar,
          y = input$mpg_yvar
          )
      )
      + geom_point(
        aes_string(fill = input$mpg_fill_color),
        shape = 23,
        size = 2
      )
      + custom_ggplot_theme
      + scale_color_brewer(palette = "Set2")
    )
  })
  
  # Plot for iris dataset
  output$ggplot_iris <- renderPlot({
    # Create the plot for iris dataset using ggplot2 with dynamic x, y, and color variables
    (
      ggplot(
        iris,
        aes_string(
          x = input$iris_xvar,
          y = input$iris_yvar,
          color = input$iris_color_var,
          size = input$iris_size_var
          )) +
        geom_point() +
        labs(
          title = paste("Plot of", input$iris_yvar, "vs", input$iris_xvar),
          x = input$iris_xvar,
          y = input$iris_yvar
          ) +
        custom_ggplot_theme
    )
  })
  
}

# Run the app
shinyApp(ui = ui, server = server)
