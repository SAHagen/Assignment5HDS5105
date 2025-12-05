outcomesServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    data <- dig_data
    
    output$kp_curve_trt <- renderPlot({
      
      data <- dig_data
      model_wg <- survfit(Surv(month, death_status) ~ 1, data = data) # wg for within group
      # plot for the survival curves by treatment group
      plot(model_wg, col =  c("#FF0000", "#0000FF"),
           main = "Risk of mortality within each month", 
           xlab = "Time in Months",
           ylab = "Survival Probability")
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
      f <- as.formula(paste("Surv(month, death_status) ~", input$outcome, "+ trtmt"))
      model_outcome <- survfit(f, data = data)
      
      plot(model_outcome, col = c("#FF0000", "#0000FF", "#00FF00", "#7f00ff"),
           main = paste("Risk of Mortality Stratified by Treatment and", input$outcome),
           xlab = "Time in Months",
           ylab = "Survival Probability",
      )
      legend(
        "bottomright",  
        legend = names(model_outcome$strata), 
        col = c("#ff0000", "#0000ff", "#00ff00", "#7f00ff"),
        lty = 1,
        cex = 0.6
      )
      
    })
   
    
    #output$cif_plot <- renderPlot({
      
     # ggplot(dig_data, aes(x=trtmt, y=hospdays, fill=trtmt)) +
        #geom_boxplot() +
        #labs(title = "Burden of Disease: Days Hospitalized by Treatment",
          #   y = "Total Days in Hospital")
      
   # })
    
    
    output$sankey_plot <- renderPlot({
  
      sankey_data <- dig_data %>%
        group_by(trtmt, .data[[input$outcome_var_sanky]], death_status) %>%
        tally() 
      
      ggplot(sankey_data,
             aes(y = n, axis1 = trtmt, axis2 = .data[[input$outcome_var_sanky]], axis3 = death_status)) +
        geom_alluvium(aes(fill = trtmt), width = 1/12) +
        geom_stratum(width = 1/12, fill = "grey80", color = "grey") +
        geom_label(stat = "stratum", aes(label = after_stat(stratum))) +
        scale_x_discrete(limits = c("Treatment", input$outcome_var_sanky , "Final Status"), 
                         expand = c(.05, .05)) +
        scale_fill_brewer(type = "qual", palette = "Set1") +
        labs(title = "Patient Flow: From Treatment to Outcome",
             y = "Number of Patients") +
        theme_minimal() +
        theme(legend.position = "none") 
    })
    
    
  })
}