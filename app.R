library(shiny)
source("global.R", local = TRUE)
source("ui/main_ui.R",     local = TRUE)
source("server/main_server.R", local = TRUE)

shinyApp(ui = ui, server = server)
