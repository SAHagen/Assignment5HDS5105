source("ui/study_overview_ui.R", local = TRUE)
source("ui/baseline_chars_ui.R", local = TRUE)
source("ui/primary_outcomes_ui.R", local = TRUE)

ui <- navbarPage(
  titlePanel("DIG Trail Explorer"),
  tabsetPanel(
    overviewUI("overview"),
    baselineUI("baseline"),
    outcomesUI("outcomes")
  )
)
