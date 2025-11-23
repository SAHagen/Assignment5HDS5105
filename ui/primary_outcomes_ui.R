outcomesUI <- function(id){
  ns <- NS(id)
  tabPanel(
    "Primary Outcomes",
    sidebarLayout(
      sidebarPanel(width = 3),
      mainPanel()
    )
  )
}