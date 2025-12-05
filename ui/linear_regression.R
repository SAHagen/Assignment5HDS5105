regressionUI <- function(id){
  ns <- NS(id)
  tabPanel(
    "Regression",
    sidebarLayout(
      sidebarPanel(width = 3,
                   selectInput(ns("num_var"), "Select 2 Numerical Variables",
                               choices = num_vars,
                               selected = c("age"),
                               multiple = TRUE)
      ),
      mainPanel(
        fluidRow(
          column(width = 9,
                 h4("Plot with Regression"),
                 plotOutput(ns("reg_plot"))
          ),
          column(width = 3,
                 h4("R- Squared"),
                 textOutput(ns("RSquared")))
        )
      )
    )
  )
}