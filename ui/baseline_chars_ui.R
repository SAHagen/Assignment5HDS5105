baselineUI <- function(id){
  ns <- NS(id)
  tabPanel(
    "Baseline Characteristics",
    sidebarLayout(
      sidebarPanel(width = 3),
      mainPanel()
    )
  )
}