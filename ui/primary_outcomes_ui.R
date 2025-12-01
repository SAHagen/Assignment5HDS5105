outcomesUI <- function(id){
  ns <- NS(id)
  tabPanel(
    "Primary Outcomes",
    sidebarLayout(
      sidebarPanel(width = 3,
                   selectInput(ns("outcome"), "Select Outcome for Survival Fitting", 
                               choices = outcome_vars, selected = "cvd")),
      mainPanel(
        fluidRow(
          column(width = 6,
                 h4("Kaplan Survival Curve for Treatment"),
                 plotOutput(ns("kp_curve_trt"))
                 ),
          column(width = 6,
                 h4("kpinteractions"),
                 plotOutput(ns("kp_interactions"))
                 )
        ),
        fluidRow(
          column(width = 6,),
          column(width = 6,)
        )
      )
    )
  )
}