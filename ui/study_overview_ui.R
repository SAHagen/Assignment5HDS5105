overviewUI <- function(id){
  ns <- NS(id)
  tabPanel(
    "Study Overview",
    mainPanel(
      fluidRow(
        h2("The Digitalis Investigation Group (DIG) Trial"),
        br(),
        h3("Study background"),
        h4("The DIG (Digitalis Investigation Group) Trial was a randomized, double-blind, multicenter 
           trial with more than 300 centers in the United States and Canada participating. The purpose
           of the trial was to examine the safety and efficacy of Digoxin in treating patients with 
           congestive heart failure in sinus rhythm. Digitalis was introduced clinically more than 200 
           years ago and has since become a commonly prescribed medication for the treatment of heart 
           failure; however, there was considerable uncertainty surrounding its safety and efficacy. 
           Small trials indicated that Digoxin alleviated some of the symptoms of heart failure, prolonge
           d exercise tolerance, and generally improved the quality of patients' lives. Unfortunately, 
           these trials were generally small and although they did focus on the effect of treatment on 
           patients’ relief from heart failure symptoms and quality of life, they failed to address 
           the effect of treatment on cardiovascular outcomes. Questions about the safety of Digoxin 
           were also a concern. Digoxin toxicity is uncommon in small trials with careful surveillance, 
           however, the long-term effects of therapeutic levels of Digoxin were less clear."),
        br(),
        h3("About This Explore"),
        h4("This dashboard allows users to explore the DIG dataset through interactive visualization and statistical modeling."),
        br(),
        h4("In the primary outcomes tab, we visualize the chosen characteristics using different charts, 
        such as a boxplot or a bar chart. In Primary Outcomes we show survival charts and the sankey plot. Finally, in the
        linear regression tab, we plot two continuous variables against each other and show a regression 
        line, as well as the R squared value."),
      
    )
  )
  )
}