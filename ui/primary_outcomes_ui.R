outcomesUI <- function(id){
  ns <- NS(id)
  tabPanel(
    "Primary Outcomes",
    sidebarLayout(
      sidebarPanel(width = 3,
                   selectInput(ns("outcome"), "Select Outcome for Survival Fitting", 
                               choices = cat_vars, selected = "cvd"),
                   br(),
                   selectInput(ns("outcome_var_sanky"), "Select Outcome for Sankey Plot",
                               choices = sanky_vars, selected ="cvd")),
      mainPanel(
        fluidRow(
          column(width = 6,
                 #h4("Kaplan Survival Curve for Treatment"),
                 plotOutput(ns("kp_curve_trt"))
                 ),
          column(width = 6,
                 #h4("kpinteractions"),
                 plotOutput(ns("kp_interactions"))
                 )
        ),
        fluidRow(
          plotOutput(ns("sankey_plot"))
        )
      )
    )
  )
}