regressionServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    output$reg_plot <- renderPlot({
      num_data <- dig_data%>%
        select(all_of(input$num_var))
      columnnames = colnames(num_data)
      if(ncol(num_data) != 2){
       return() 
      }
      lm = lm(num_data[,2] ~ num_data[,1])
      plot(x = num_data[,1], y = num_data[,2], 
          xlab = columnnames[1],
          ylab = columnnames[2]) +
          abline(lm, col = "red")
    })
    output$RSquared <- renderText({
      num_data <- dig_data%>%
        select(all_of(input$num_var))
      if(ncol(num_data) != 2){
        return() 
      }
      cor(num_data[,1], num_data[,2], method = "pearson", use = "complete.obs")**2
    })
  })
}