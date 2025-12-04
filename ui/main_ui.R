source("ui/study_overview_ui.R", local = TRUE)
source("ui/baseline_chars_ui.R", local = TRUE)
source("ui/primary_outcomes_ui.R", local = TRUE)
source("ui/linear_regression.R", local = TRUE)

ui <- navbarPage(
  
  title = "DIG Trail Explorer",
  theme = shinytheme("cosmo"),
  overviewUI("overview"),
  baselineUI("baseline"),
  outcomesUI("outcomes"),
  regressionUI("regression")
  
)

