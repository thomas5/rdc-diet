# Last update:19/1/2025

function(input, output, session) {
    figure2022 <- reactive({
      paste0(input$fooditem,"_",input$participant, "_", input$outcome, "_output.pdf")
     })
    output$results_2022 <- renderUI({ 
      pdf_figure2022 <- figure2022()
      if (file.exists(paste0("./www/", pdf_figure2022))) {
         tags$iframe(style="height:100vh; width:100%;", src= pdf_figure2022)
      }
      else { tags$h4("Figure is not available for your selected options", style = "color:#ff0000")}
    })
    
    figure2023 <- reactive({
      paste0(input$fooditem2023,"_",input$participant2023, "_", input$outcome2023, "_output_2023.pdf")
    })
    output$results_2023 <- renderUI({ 
      pdf_figure2023 <- figure2023()
      if (file.exists(paste0("./www/",pdf_figure2023))) {
         tags$iframe(style="height:100vh; width:100%;", src=pdf_figure2023)
      }
      else { tags$h4("Figure is not available for your selected options", style = "color:#ff0000")}
    })
    
    figureBaseline2023 <- reactive({
      paste0(input$baselinefood,"_",input$baselineOutput, ".pdf")
    })
    output$baseline_2023 <- renderUI({
      pdf_Baseline2023 <- figureBaseline2023()
      if (file.exists(paste0("./www/", pdf_Baseline2023))) {
         tags$iframe(style="height:100vh; width:100%;", src= pdf_Baseline2023)
      }
      else { tags$h4("Figure is not available for your selected options", style = "color:#ff0000")}
    })
    
    figure2024 <- reactive({
      paste0(input$fooditem2024,"_",input$participant2024, "_", input$outcome2024, "_2024_v6.pdf")
    })
    output$results_2024 <- renderUI({ 
      pdf_figure2024 <- figure2024()
      if (file.exists(paste0("./www/",pdf_figure2024))) {
         tags$iframe(style="height:100vh; width:100%;", src=pdf_figure2024)
      }
      else { tags$h4("Figure is not available for your selected options", style = "color:#ff0000")}
    })
    
   
     figureBaseline2024 <- reactive({
       paste0(input$baselinefood2024, "_characteristics_2024_v6.pdf")
    })
    output$baseline_2024 <- renderUI({
      pdf_baseline2024 <- figureBaseline2024()
      if (file.exists(paste0("./www/",pdf_baseline2024))) {
         tags$iframe(style="height:100vh; width:100%;", src= pdf_baseline2024)
      }
      else { tags$h4("Figure is not available for your selected options", style = "color:#ff0000")}
    })
    
    observeEvent(input$link_to_info, {
      updateTabsetPanel(session, "tabset", "Information")
    })
    observeEvent(input$link_to_info2, {
      updateTabsetPanel(session, "tabset", "Information")
    })
    observeEvent(input$link_to_info3, {
      updateTabsetPanel(session, "tabset", "Information")
    })
    observeEvent(input$link_to_info4, {
      updateTabsetPanel(session, "tabset", "Information")
    })
    observeEvent(input$link_to_info5, {
      updateTabsetPanel(session, "tabset", "Information")
    })
    observeEvent(input$link_to_info6, {
      updateTabsetPanel(session, "tabset", "Information")
    })
    observeEvent(input$link_to_info7, {
       updateTabsetPanel(session, "tabset", "Information")
    })
    observeEvent(input$link_to_conf, {
      updateTabsetPanel(session, "tabset", "Confidential preliminary results July 2022")
    })
    observeEvent(input$link_to_conf2023, {
      updateTabsetPanel(session, "tabset", "Confidential preliminary results March 2023")
    })
    observeEvent(input$link_to_base, {
      updateTabsetPanel(session, "tabset", "Dietary factor characteristics")
    })
    observeEvent(input$link_to_base2024, {
       updateTabsetPanel(session, "tabset", "Dietary factor characteristics")
    })
    observeEvent(input$link_to_outcome2024, {
       updateTabsetPanel(session, "tabset", "Outcome analyses")
    })
    session$onSessionEnded(function(){stopApp()}) 
    
    
    #New code added by Thomas
    
    # Basic RR buttons
    observeEvent(input$inc_basic, {
      updateNumericInput(session, "rr_basic", value = input$rr_basic + 0.01)
    })
    observeEvent(input$dec_basic, {
      updateNumericInput(session, "rr_basic", value = input$rr_basic - 0.01)
    })
    
    # Adjusted RR buttons
    observeEvent(input$inc_adj, {
      updateNumericInput(session, "rr_adj", value = input$rr_adj + 0.01)
    })
    observeEvent(input$dec_adj, {
      updateNumericInput(session, "rr_adj", value = input$rr_adj - 0.01)
    })
    
    calc_Bbasic <- reactive( log(input$rr_basic) )
    calc_Badj <- reactive( log(input$rr_adj) )
    calc_r02 <- reactive( (1-(calc_Badj()/calc_Bbasic())) ) 
    calc_r0 <- reactive( sqrt(calc_r02()) )
    calc_Bexact <- reactive( calc_Bbasic() - ( (calc_Bbasic()-calc_Badj()) / calc_r02() ) )
    calc_RRexact <- reactive( exp(calc_Bexact()) ) 
    
    output$B_basic <- renderText({
      sprintf("%.4f", calc_Bbasic())    # numeric -> text for display
    })
    
    output$B_adj <- renderUI({ 
      tags$span(format(round(calc_Badj(), 4), nsmall = 3)) 
    })
    
    output$r02_adj <- renderUI({ 
      tags$span( paste0(format(round(calc_r02() * 100), 0) , "%") , nsmall = 3 ) 
    })
    
    output$r0_adj <- renderUI({ 
      tags$span( round(calc_r0(), digits = 2), nsmall = 3) 
    })
    
    output$Bexact_adj <- renderUI({ 
      tags$span(format(round(calc_Bexact(), digits = 2) , 4), nsmall = 3) 
    })
    
    output$RRexact_adj <- renderUI({ 
      tags$span(format(round(calc_RRexact(), 2), nsmall = 3)) 
    })
}
