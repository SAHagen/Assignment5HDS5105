baselineUI <- function(id){
  ns <- NS(id)
  tabPanel(
    "Baseline Characteristics",
    sidebarLayout(
      sidebarPanel(width = 3,
                   selectInput(ns("num_var"), "Select Numerical Variables",
                               choices = num_vars,
                               selected = c("age"),
                               multiple = TRUE),
                   selectInput(ns("cat_var"), "Select Caterogorical Variable(s0): ",
                               choices = cat_vars,
                               selected = c("sex"))
      ),
      mainPanel(
        fluidRow(
          column(
            width = 6,
            h4("BoxPlots for Numerical Variables"),
            plotlyOutput(ns("num_plot"))
            
          ),
          column(width = 6,
                 h4("Bar Charts for Categorical Varibles"),
                 plotlyOutput(ns("bar_plot"))
                 )
        ),
        fluidRow(
          column(width = 6,
                 h4("Cross Tables"),
                 # output for cross tabulation of the categorical variables
                 ),
          column(width = 6,
                 h4("Table"),
                 #
                 )
        )
      )
    )
  )
}