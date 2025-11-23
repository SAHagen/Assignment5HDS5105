source("server/study_overview_server.R", local = TRUE)
source("server/baseline_chars_server.R", local = TRUE)
source("server/primary_outcomes_server.R", local = TRUE)

server <- function(input, output, session) {
  overviewUI("overview")
  baselineUI("baseline")
  outcomesUI("outcomes")
}