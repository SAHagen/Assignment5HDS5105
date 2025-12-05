source("server/overviewServer.R", local = TRUE)
source("server/baselineServer.R", local = TRUE)
source("server/outcomesServer.R", local = TRUE)
source("server/regressionServer.R", local = TRUE)

server <- function(input, output, session) {
  overviewServer("overview")
  baselineServer("baseline")
  outcomesServer("outcomes")
  regressionServer("regression")
}