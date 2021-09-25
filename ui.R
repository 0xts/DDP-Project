library(shiny)
library(ggplot2)

# load data
data("diamonds")

# Define UI for the application
shinyUI(fluidPage(titlePanel("Diamonds Price Prediction"),
                  div(p("Have you ever wondered how diamonds are priced beyond the number of carats(or weight)? Price also depends on the diamond's cut, color, and clarity.")),
                  div(p("The Diamond Price Prediction application uses the 'diamonds' dataset that comes with R package ggplot2. 
                        The dataset contains prices and other attributes of almost 54,000 diamonds. This application 
                        allows users to predict diamond prices based on Cut, Color and Clarity of a diamond.")),
                  div(h2("Select the diamond features from the right side panel to predict the price.")),
                  
                  # Sidebar with a slider input for number of variables
                  sidebarLayout(position = "right", sidebarPanel(h4("Choose Diamond Features"),
                                             selectInput("cut", "Cut", (sort(unique(diamonds$cut), decreasing = T))),
                                             selectInput("color", "Color", (sort(unique(diamonds$color)))),
                                             selectInput("clarity", "Clarity", (sort(unique(diamonds$clarity), decreasing = T))),
                                             sliderInput("lm", "Carat",
                                                         min = min(diamonds$carat), max = max(diamonds$carat),
                                                         value = max(diamonds$carat) / 2, step = 0.1),
                                             h4("Predicted Price: "), verbatimTextOutput("predict"), width = 4),
                                
                                # Show a plot of the carat/price relationship
                                mainPanel(plotOutput("distPlot"))
                  )))