library(shiny)

shinyServer(function(input, output, session) {
  
  inFile1 <- reactive({
    if (is.null(input$file1)) {
      return(NULL)
    } else {
      input$file1
    }
  })
  
  myInputFile1 <- reactive({
    if (is.null(inFile1())) {
      return(NULL)
    } else {
      read.csv(inFile1()$datapath)
    }
  })
  
  inFile2 <- reactive({
    if (is.null(input$file2)) {
      return(NULL)
    } else {
      input$file2
    }
  })
  
  myInputFile2 <- reactive({
    if (is.null(inFile2())) {
      return(NULL)
    } else {
      read.csv(inFile2()$datapath)
    }
  })
  

  observe({
    myData <- myInputFile1()
    updateSelectInput(
      session,
      "school",
      choices=c(as.character(myData$SchoolName), "All"))
    
    updateSelectInput(
      session,
      "grade",
      choices=c(sort.int(myData$Grade), "All"))
    
    updateSelectInput(
      session,
      "course",
      choices=c(as.character(myData$MeasurementScale), "All"))
    
    updateSelectInput(
      session,
      "ethnicity",
      choices=c(as.character(myData$StudentEthnicGroup), "All"))
    
  })
  

  distplot <- eventReactive(input$generateReport, {
    myInputFile1()
  })
  output$distplot<- renderTable({

    distplot()
# #     samp <- data.frame[,(!colNames(samp))]
#     summary(samp)
#      new.frame <- data.frame[,(!(samp$TestRITScore))]
#     basic_summ = filter(samp, MeasurementScale %in% c("Language Usage"))
#     
#     # 2: set up data frame for by-group processing.  
#     basic_summ = group_by(basic_summ, MeasurementScale, Grade)
#     
#     # 3: calculate the three summary metrics
#     basic_summ = summarise(basic_summ, 
#                            Winter_Mean_RIT_Score = mean(TestRITScore, na.rm=TRUE)
#                            
#     )
#     print(basic_summ)
  })

# output$plot <- renderPlot({
#   samp <- myInputFile1()
#   hist(mean(samp$TestRITScore), breaks = as.numeric(samp$Grade))
# })

})
