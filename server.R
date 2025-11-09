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
      tags$span(format(round(calc_RRexact(), 2), nsmall = 2)) 
    })
    
    observeEvent(input$inc_es1, {
      updateNumericInput(session, "es1", value = input$es1 + 0.01)
    })
    observeEvent(input$dec_es1, {
      updateNumericInput(session, "es1", value = input$es1 - 0.01)
    })
    
    observeEvent(input$inc_erdr1, {
      updateNumericInput(session, "erdr1", value = input$erdr1 + 0.01)
    })
    observeEvent(input$dec_erdr1, {
      updateNumericInput(session, "erdr1", value = input$erdr1 - 0.01)
    })
    
    observeEvent(input$inc_es2, {
      updateNumericInput(session, "es2", value = input$es2 + 0.01)
    })
    observeEvent(input$dec_es2, {
      updateNumericInput(session, "es2", value = input$es2 - 0.01)
    })
    
    observeEvent(input$inc_erdr2, {
      updateNumericInput(session, "erdr2", value = input$erdr2 + 0.01)
    })
    observeEvent(input$dec_erdr2, {
      updateNumericInput(session, "erdr2", value = input$erdr2 - 0.01)
    })
    
    observeEvent(input$inc_es3, {
      updateNumericInput(session, "es3", value = input$es3 + 0.01)
    })
    observeEvent(input$dec_es3, {
      updateNumericInput(session, "es3", value = input$es3 - 0.01)
    })
    
    observeEvent(input$inc_erdr3, {
      updateNumericInput(session, "erdr3", value = input$erdr3 + 0.01)
    })
    observeEvent(input$dec_erdr3, {
      updateNumericInput(session, "erdr3", value = input$erdr3 - 0.01)
    })
    
    calc_est_1 <- reactive(input$es1 * input$es1)
    calc_bexact_1 <- reactive(calc_Bbasic() - ((calc_Bbasic() - calc_Badj()) / calc_est_1()))
    calc_rrexact_1 <- reactive(exp(calc_bexact_1()))
    calc_rdrc_1 <- reactive(exp(calc_bexact_1() / input$erdr1))
    
    calc_est_2 <- reactive( input$es2 * input$es2 )
    calc_bexact_2 <- reactive( calc_Bbasic() - ((calc_Bbasic() - calc_Badj()) / calc_est_2()) )
    calc_rrexact_2 <- reactive( exp(calc_bexact_2()) )
    calc_rdrc_2 <- reactive( exp(calc_bexact_2() / input$erdr2) )
    
    calc_est_3 <- reactive(input$es3 * input$es3)
    calc_bexact_3 <- reactive( calc_Bbasic() - ((calc_Bbasic() - calc_Badj()) / calc_est_3()) )
    calc_rrexact_3 <- reactive( exp(calc_bexact_3()) )
    calc_rdrc_3 <- reactive(exp(calc_bexact_3() / input$erdr3))
    
    output$es_r2_1 <- renderUI({
      tags$span( paste0(format(round(calc_est_1() * 100, 0), nsmall = 0 ), "%")) 
    })
    
    output$es_bexact_1 <- renderUI({ 
      tags$span(format(round(calc_bexact_1(), 4), nsmall = 4)) 
    })
    
    output$es_rrexact_1 <- renderUI({ 
      tags$span(format(round(calc_rrexact_1(), 2), nsmall = 2)) 
    })
    
    output$es_rdrc_1 <- renderUI({ 
      tags$span(format(round(calc_rdrc_1(), 2), nsmall = 2)) 
    })
    
    #2nd box
    output$es_r2_2 <- renderUI({ 
      tags$span( paste0(format(round(calc_est_2() * 100, 2), nsmall =0 ), "%")) 
    })
    
    output$es_bexact_2 <- renderUI({ 
      tags$span(format(round(calc_bexact_2(), 4), nsmall = 3)) 
    })
    
    output$es_rrexact_2 <- renderUI({ 
      tags$span(format(round(calc_rrexact_2(), 2), nsmall = 3)) 
    })
    
    output$es_rdrc_2 <- renderUI({ 
      tags$span(format(round(calc_rdrc_2(), 2), nsmall = 3)) 
    })
    
    #3rd box
    output$es_r2_3 <- renderUI({ 
      tags$span( paste0(format(round(calc_est_3() * 100, 2), nsmall =0 ), "%")) 
    })
    
    output$es_bexact_3 <- renderUI({ 
      tags$span(format(round(calc_bexact_3(), 4), nsmall = 4)) 
    })
    
    output$es_rrexact_3 <- renderUI({ 
      tags$span(format(round(calc_rrexact_3(), 2), nsmall = 2)) 
    })
    
    output$es_rdrc_3 <- renderUI({ 
      tags$span(format(round(calc_rdrc_3(), 2), nsmall = 2)) 
    })
    
    observeEvent(input$inc_erradj, {
      updateNumericInput(session, "erradj", value = input$erradj + 0.01)
    })
    observeEvent(input$dec_erradj, {
      updateNumericInput(session, "erradj", value = input$erradj - 0.01)
    })
    
    observeEvent(input$inc_erdr4, {
      updateNumericInput(session, "erdr4", value = input$erdr4 + 0.01)
    })
    observeEvent(input$dec_erdr4, {
      updateNumericInput(session, "erdr4", value = input$erdr4 - 0.01)
    })
    
    #part 3
    calc_err_adj_r02 <- reactive(1 -(log(input$erradj) / log(input$rr_basic)))
    calc_err_adj_r0 <- reactive( sqrt(calc_err_adj_r02()) )
    calc_rdrc_4 <- reactive(exp(log(input$erradj) / input$erdr4))
    
    
    output$r02_rr_adj <- renderUI({ 
      tags$span( paste0(format(round(calc_err_adj_r02() * 100, 0), nsmall =0 ), "%")) 
    })
    
    output$r0_rr_adj <- renderUI({ 
      tags$span(format(round(calc_err_adj_r0(), 2), nsmall = 2)) 
    })
    
    output$es_rdrc_4 <- renderUI({ 
      tags$span(format(round(calc_rdrc_4(), 2), nsmall = 2)) 
    })
}
