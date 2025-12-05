overviewUI <- function(id){
  ns <- NS(id)
  tabPanel(
    "Study Overview",
    mainPanel(
      fluidRow(
        column(width = 6,
               h4("Summary"),
                
        )),
      fluidRow(
        column(width = 12), 
        h4("In the primary outcomes tab, we visualize the chosen characteristics using different charts, 
                          such as a boxplot or a bar chart. In Primary Outcomes we show survival charts. Finally, in the linear
                          regression tab, we plot two continuous variables against each other and show a regression line.")
      
    )
  )
  )
}