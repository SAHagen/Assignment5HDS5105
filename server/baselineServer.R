baselineServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    output$num_plot <- renderPlotly({
      
      num_data <- dig_data%>%
        select(trtmt, all_of(input$num_var)) %>%
        pivot_longer(cols = -trtmt,
                     names_to = "Variable",
                     values_to = "Values")
      
      plot <- ggplot(num_data, aes(x = trtmt, y = Values, fill= trtmt)) +
                       geom_boxplot()+
                       facet_wrap(~Variable, scales = "free_y")
      
      ggplotly(plot)
    })
    output$bar_plot <- renderPlotly({
      
      cat_data <- dig_data%>%
        select(trtmt, all_of(input$cat_var)) %>%
        pivot_longer(cols = -trtmt,
                     names_to = "Variable",
                     values_to = "Values")
      
      plot <- ggplot(cat_data, aes(x = Variable, fill = Values)) +
        geom_bar()+
        facet_wrap(~Variable, scales = "free_y")
      
      ggplotly(plot)
    })
    
    
    
  })
}