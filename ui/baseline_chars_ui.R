baselineUI <- function(id){
  ns <- NS(id)
  tabPanel(
    "Baseline Characteristics",
    sidebarLayout(
      sidebarPanel(width = 3,
                   h3("Plots"),
                   selectInput(ns("num_var"), "Select Numerical Variables",
                               choices = num_vars,
                               selected = c("age"),
                               multiple = TRUE),
                   selectInput(ns("cat_var"), "Select Caterogorical Variable(s0): ",
                               choices = cat_vars,
                               selected = c("sex")),
                   hr(),
                   h3("Cross Tabulation"),
                   helpText("Select variables to cross-tabulate outcomes against the treatment group."),
                   selectInput(ns("row_var"), 
                               "Select Outcome (Row)",
                               choices = vars_for_table1,
                               selected = "hospitalized"),
                   helpText("Note: This variable will appear as the rows in the table."),
                   selectInput(ns("col_var"),
                               "Select Stratification (Col):", 
                               choices = vars_for_table1,
                               selected = "cvd")
                   
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
          column(width = 12,
                 h4("Cross Tables"),
                 br(),
                 verbatimTextOutput(ns("formula_caption")),
                 tableOutput(ns("association_table"))
                 )
        )
      )
    )
  )
}