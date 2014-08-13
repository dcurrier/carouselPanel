
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output, session) {


  # Values from cdata returned as text
  output$clientdataText <- renderText({
    cnames <- names(session$clientData)

    allvalues <- lapply(cnames, function(name) {
      paste(name, session$clientData[[name]], sep=" = ")
    })
    paste(allvalues, collapse = "\n")
  })


  nBins = reactive({
    input$bins
  })

  output$distPlot1 <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = nBins() + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })

  output$distPlot2 <- renderPlot({

    #browser()
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = nBins() + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'steelblue', border = 'white')

  })

  #outputOptions(output, 'distPlot1', suspendWhenHidden=FALSE)
  outputOptions(output, 'distPlot2', suspendWhenHidden=FALSE)


})
