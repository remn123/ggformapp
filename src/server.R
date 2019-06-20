# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  output$result1 <- renderText({
    input$text1
  })
  
  output$result2 <- renderText({
    input$text2
  })
  
  output$result3 <- renderText({
    input$text3
  })
  
  F1 <- reactive({
    if(!input$btn)
    {
      return(NULL)
    }
    isolate({input$text1})
  })
  
  F2 <- reactive({
    if(!input$btn)
    {
      return(NULL)
    }
    isolate({input$text2})
  })
  
  F3 <- reactive({
    if(!input$btn)
    {
      return(NULL)
    }
    isolate({input$text3})
  })
  
  output$plot <- renderPlot({
    
    f1 <- F1()
    f2 <- F2()
    f3 <- F3()
    
    if(!is.null(f1) && !is.null(f2) && !is.null(f3)){
      vars1 <- all.vars(formula(paste0(" ~ ", f1)))
      vars2 <- all.vars(formula(paste0(" ~ ", f2)))
      vars3 <- all.vars(formula(paste0(" ~ ", f3)))
      
      data <- iris %>% select(c(vars1, vars2, vars3))
      
      print(names(data))
      
      x <- "x"
      y <- "y"
      g <- "g"
      
      data <- get_df_plot(data, f1, x)
      data <- get_df_plot(data, f2, y)
      data <- get_df_plot(data, f3, g)
      
      data <- data %>% select(x, y, g)
      
      print(names(data))
      
      plotObj <- ggplot(data, aes(x = x, 
                                  y = y, 
                                  colour = g)) +
                    geom_point() +
                    geom_line()
      
      plotObj
    }
    
    
  }) 
  
}