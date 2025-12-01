outcomesServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    data <- dig_data
    
    output$kp_curve_trt <- renderPlot({
      
      data <- dig_data
      model_wg <- survfit(Surv(month, death_status) ~ 1, data = data) # wg for within group
      # plot for the survival curves by treatment group
      plot(model_wg, col =  c("#FF0000", "#0000FF"),
           main = "", 
           xlab = "",
           ylab = "")
      legend(
        legend = "Overall Survival",
        "bottomright",
        col = c("#FF0000", "#0000FF"),
        lty = 1,
        cex = 0.6
      )
      
    })
    
    output$kp_interactions <- renderPlot({
      
      data <- dig_data
      variable <- input$outcome
      
      model_outcome <- survfit(Surv(month, death_status) ~ variable + trtmt, data =  dig_data)
      plot(model_cvd, col = c("#FF0000", "#0000FF", "#00FF00", "#7f00ff"),
           xlab = "Time in Months",
           ylab = "Survival Probability",
      )
      legend(
        "bottomright",  
        legend = names(model_cvd$strata), 
        col = c("#ff0000", "#0000ff", "#00ff00", "#7f00ff"),
        lty = 1,
        cex = 0.6
      )
      
    })
   
    
    
  })
}