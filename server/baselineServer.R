baselineServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    output$num_plot <- renderPlotly({
      
      num_data <- dig_data%>%
        select(treatment_group, all_of(input$num_var)) %>%
        pivot_longer(cols = -treatment_group,
                     names_to = "Variable",
                     values_to = "Values")
      
      plot <- ggplot(num_data, aes(x = treatment_group, y = Values, fill= treatment_group)) +
                       geom_boxplot()+
                       facet_wrap(~Variable, scales = "free_y")
      
      ggplotly(plot)
    })
    
  })
}