library(shiny)
library(e1071)

data(Titanic)
df <- as.data.frame(Titanic)

shinyUI( pageWithSidebar(
  headerPanel( "Diving into Titanic Diaster"),
  sidebarPanel(
    img(src="http://3.bp.blogspot.com/_-uG4jtfy1m0/TPKgqQTRuxI/AAAAAAAAAsM/j_edGNFWDQE/s1600/8.jpg"),
    br(),
    selectInput( "cl", "Select Class", levels(df[1,1]), "Crew"),
    selectInput( "se", "Select Gender", levels(df[1,2]), "Female"),
    selectInput( "ag", "Select Age", levels(df[1,3]), "Adult"),
    br()
  ),
  mainPanel(
    h3("Source: Titanic Dataset"),
    p("It lists info of 2,201 passengers who onboarded Titanic ocean liner on its maiden voyage which unfortunately became its last too. Data is classified as per economic status (class), sex, age and survival."),
    p("Based on passenger's attributes selected, associated survival rates are as below"),
    plotOutput('plot1')
  )
))