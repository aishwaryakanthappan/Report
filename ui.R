library(shiny)
#narrowSidebar <- HTML('<style>.span3 {min-width: 150px; max-width: 150px; }</style>')
shinyUI(fluidPage(
  img(src = "logo.png", height = 72, width = 150),
  titlePanel("MAP Report"),
  
  
   sidebarLayout(
    sidebarPanel(
      #tags$head(narrowSidebar),
      tags$head(
        tags$style(type="text/css", "label.radio { display: inline-block; }", ".radio input[type=\"radio\"] { float: none; }"),
        tags$style(type="text/css", "select { max-width: 350px; }"),
        tags$style(type="text/css", "textarea { max-width: 350px; }"),
        tags$style(type="text/css", ".jslider { max-width: 350px; }"),
        tags$style(type='text/css', ".well { max-width: 350px; }"),
        tags$style(type='text/css', ".span4 { max-width: 350px; }")
      ),
      

#       fileInput("file1", label = h5("Choose current semester file")),
#       
#       fileInput("file2", label = h5("Choose previous semester file")),

selectInput("currentsemester", label = h5("Select Current Semester"), ""),

selectInput("previoussemester", label = h5("Select Previous Semester"), ""),

      selectInput("school", label = h5("Select School"), ""),
      
      selectInput("grade", label = h5("Select Grade"), ""),                 
      
      selectInput("course", label = h5("Select Course"), ""),                  
      
      selectInput("ethnicity", label = h5("Select Ethnicity"), ""),
                  
#       br(),
#       downloadButton('downloadData', 'Download PDF File'),
#       br(),
#       br(),
#       downloadButton('downloadData', 'Download Excel File'),
#       br(),
#       br(),
      actionButton("generateReport", "Generate Report"),
      br(),

      p(a("Click here", 
          href = "http://www.accordeducation.org"), "to download PDF"),

      p(a("Click here", 
          href = "http://www.accordeducation.org"), "to download Excel"),

      p(a("Click here", 
           href = "http://www.accordeducation.org"), "to download student report")
    ),
    
    mainPanel(
      tableOutput('distplot')
#       plotOutput('plot')
    )
  )  
))
