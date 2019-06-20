# ui.R
header <- dashboardHeader(
  title = "My New App"
)

sidebar <- dashboardSidebar(
  #menuItem(
  "CONTROLES"
    # selectInput("state", "Choose a state:",
    #             list(`East Coast` = list("NY", "NJ", "CT"),
    #                  `West Coast` = list("WA", "OR", "CA"),
    #                  `Midwest` = list("MN", "WI", "IA"))
    # ),
    # textOutput("result")
  #)
)

body <- dashboardBody(
  textInput("text1", "Variável x:"),
  textOutput("result1"),
  textInput("text2", "Variável y:"),
  textOutput("result2"),
  textInput("text3", "Variável Legenda:"),
  textOutput("result3"),
  actionButton("btn", "Gerar Gráfico"),
  plotOutput("plot")
)

ui <- dashboardPage(
  header,
  sidebar,
  body 
)