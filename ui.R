#-----------------------------------------------------------------
# This website is for "Richard Doll Consortium Diet Collaboration"
#coded by Ling Kong, 31/July 2025
#----------------------------------------------------------------
library(shiny)
library(bslib)
library(bsicons)


theme_used <- "primary"

fluidPage(
  theme = bs_theme(
    version = 5,
    #font_scale = 0.9
    rdc_diet = "#6C47FF"
  ),
  tags$head(
    tags$style(HTML("
                  {font-family:'Calibri':'Calibri';'Arial': Arial;'Times New Roman':Times New Roman;}
                  {font-size: 'smaller'}
                  #numInput .form-control {
                    height: 34px;
                    padding: 2px 6px;
                    font-size: 0.85rem;
                  }
                  .shiny-input-container { margin-bottom: 0; }
                ")),
    # tags$style(HTML("hr {border-top: 1px solid #203e58}
    #   *{font-family:'Arial': Arial;'Times New Roman':Times New Roman;}
    #   .tabbable > .nav > li > a[data-value='Calculator'] {color:#041e42;font-size: 1.4359rem}
    #   .tabbable > .nav > li[class=default] > a { color:#041e42}
    #   .tabbable > .nav > li > a { color:041e42 }
    #   .tabbable > .nav > li > a[data-value='Confidential preliminary results July 2022'] {color:#041e42; font-size: 1.4359rem}
    #   .tabbable > .nav > li > a[data-value='Confidential preliminary results March 2023'] {color:#041e42; font-size: 1.4359rem}
    #   .tabbable > .nav > li > a[data-value='Dietary factor characteristics'] {color:#041e42; font-size: 1.4359rem}
    #   .tabbable > .nav > li > a[data-value='Home'] {color:#041e42;font-size: 1.4359rem}
    #   .tabbable > .nav > li > a[data-value='Information'] {color:#041e42;font-size: 1.4359rem}
    #   .tabbable > .nav > li[class=active] > a {background-color:#f2efea;color:#041e42;font-size: 1.4359rem}
    #   .first-ul{list-style-type: decimal;list-style-position: outside;list-style-type: decimal;}
    #   .second-ul{list-style-type: none;list-style-position: outside;list-style-type: disc;}
    #   .third-ul{list-style-type: lower-alpha; list-style-position: outside;list-style-type: circle;}
    #   table, tr,td {border: 0.5px solid #c0c0c0;vertical-align: middle;}
    #   tr{height: 38px;}
    #   tr:hover {background-color:#ffffff;}
    #  .one {text-indent: 10px;}
    #  #valRed{color:#FF0000}
    #  p.solid {outline-style: solid; outline-width: thin; outline-offset: 6px; outline-color: #A9A9A9;}
    # ")) 
  ),
  h1(class="mt-3 mb-2 ms-2 me-2",HTML("<b>Richard Doll Consortium Diet Collaboration</b>")), #br(), style = "color:#041e42; font-family:Arial; font-size: 4.5359rem; text-align:left"),
    tabsetPanel(id = "tabset", selected = "Calculator",
              #--home--
              tabPanel("Home",  br() ,style="text-align:justify;color:black;background-color:#f2efea;padding:15px;border-radius:10px；font-family:Arial ;font-size: 1.3359rem;",
                       
              ),
              #--end home----    
              tabPanel("Information", style="text-align:justify;color:black;background-color:#f2efea;padding:15px;border-radius:10px；font-family:Arial ;font-size: 1.3359rem;",
                       
              ),
              #---end information---
              ###start Baseline characteristics 2024###
              tabPanel("Dietary factor characteristics", br(), 
                       
              ),
              #####end of Outcome Analyses 2024###
              #----New added by Thomas for calculator---
              tabPanel(
                class = "m-2 p-1",
                "Calculator", #style="text-align:justify;color:black;background-color:#f2efea;padding:15px;border-radius:10px；font-family:Arial ;font-size: 1.3359rem;",
                
                #Instruction popover
                span(
                  HTML("<b>Instruction</b>"),
                  popover(
                    style="width:200px",
                    bs_icon(
                      "info-circle"
                    ),
                    #title = "Instruction",
                    span(
                      class = "ms-2 me-2 mt-1 mb-1 p-1",
                      HTML("
              <p>RR<sub>basic</sub> = RR adjusted for age, sex and (where relevant) region </p>
              <p>RR<sub>adj</sub> = RR adjsuted for measured confounders</p>
              <ol>
                <li>Enter RR<sub>basic</sub> and RR<sub>adj</sub> from RDC website</li>
                <li>
                  Enter either: <br />
                  Estimate of RR<sub>adj</sub> <br />
                  Estimate of correlation between measured confounders and Perfect Confounder Score
                </li>
              </ol>")),
                    placement = "right"
                  )
                ),
                
                #Notes
                div(
                  class = "mt-3, mb-1",
                  p(HTML(
                    "<i>r<sub>0</sub> is the value of r that results in null association<br />
          RR<sub>exact</sub> is the RR that would have been observed on adjustment for the Perfect Confounder Score</i>"))
                ),
                
                #1 section
                tags$label(HTML("<b>Enter RRs from RDC website</b>")),
                
                layout_column_wrap(
                  class = "mt-2 mb-1",
                  fluidRow(
                    column(
                      12,
                      div(
                        class = "d-flex align-items-center gap-2",
                        tags$label("Basic", class = "me-1"),
                        numericInput(
                          "rr_basic",
                          label = NULL,
                          value = 1.74,
                          width = "200px"
                        ),
                        actionButton(
                          "dec_basic", "-",
                          class = "btn btn-sm d-flex justify-content-center align-items-center",
                          style = "width:40px; height:34px;"
                        ),
                        actionButton(
                          "inc_basic", "+",
                          class = "btn btn-sm d-flex align-items-center justify-content-center", 
                          style = "width: 40px; height: 34px;"
                        ),
                        tags$label("Ajusted", class = "ms-1"), 
                        numericInput(
                          "rr_adj",
                          label = NULL,
                          value = 1.56,
                          width = "200px"
                        ),
                        actionButton(
                          "dec_adj", "-",
                          class = "btn btn-sm d-flex justify-content-center align-items-center",
                          style = "width:40px; height:34px;"
                        ),
                        actionButton(
                          "inc_adj", "+",
                          class = "btn btn-sm d-flex justify-content-center align-items-center",
                          style = "width:40px; height:34px;"
                        )
                      )
                    )
                  )
                ),
                
                #Display for Basic and Adjusted RR
                layout_column_wrap(
                  class = "mb-1 mt-1",
                  fill = FALSE,
                  layout_column_wrap(
                    class = "mt-1 mb-0",
                    width = 1/8,
                    value_box(
                      class = "me-1",
                      value = div(class= "fw-bold", style = "font-size:1rem", textOutput("B_basic")),  # smaller font textOutput("B_basic"),
                      title = div(style = "font-size:0.8rem", "B"),
                      theme = theme_used,
                      div(style = "font-size:0.6rem", "Basic"),
                      style = "height:90px;font-size:0.6rem"
                    )
                  )
                ),
                
                layout_column_wrap(
                  class = "mb-2 mt-1",
                  fill = FALSE,
                  #spacing = "1rem",
                  layout_column_wrap(
                    class = "pb-1 pt-0 mt-0, mb-0",
                    width = 1/8,
                    #gap = "1rem",
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem", uiOutput("B_adj")), title = div(style = "font-size:0.8rem", "B"), theme = theme_used, div(style = "font-size:0.6rem", "Adjusted"), style = "height:90px"),
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem", uiOutput("r02_adj")), title = div(style = "font-size:0.8rem",HTML("% reduction (r<sub>0</sub><sup>2</sup>)")), theme = theme_used, div(style = "font-size:0.6rem", "Adjusted"), style = "height:90px"),
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem", uiOutput("r0_adj")), title = div(style = "font-size:0.8rem",HTML("r<sub>0</sub>")), theme = theme_used, div(style = "font-size:0.6rem", "Adjusted"), style = "height:90px"),
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem", uiOutput("Bexact_adj")), title = div(style = "font-size:0.8rem",HTML("B<sub>exact</sub>")), theme = theme_used, div(style = "font-size:0.6rem", "Adjusted"), style = "height:90px"),
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem", uiOutput("RRexact_adj")), title = div(style = "font-size:0.8rem", HTML("RR<sub>exact</sub>")), theme = theme_used, div(style = "font-size:0.6rem", "Adjusted"), style = "height:90px")
                    # value_box(value = div(style = "font-size:1rem", uiOutput("B_adj")), title = div(style = "font-size:0.8rem", "B"), theme = theme_used, div(style = "font-size:0.6rem", "Adjusted"), style = "height:90px"),
                    # value_box(value = div(style = "font-size:1rem", uiOutput("r02_adj")), title = div(style = "font-size:0.8rem",HTML("% reduction (r<sub>0</sub><sup>2</sup>)")), theme = theme_used, div(style = "font-size:0.6rem","Adjusted"), style = "height:90px"),
                    # value_box(value = div(style = "font-size:1rem", uiOutput("r0_adj")), title = div(style = "font-size:0.8rem",HTML("r<sub>0</sub>")), theme = theme_used, div(style = "font-size:0.6rem","Adjusted"), style = "height:90px"),
                    # value_box(value = div(style = "font-size:1rem", uiOutput("Bexact_adj")), title = div(style = "font-size:0.8rem",HTML("B<sub>exact</sub>")), theme = theme_used, div(style = "font-size:0.6rem","Adjusted"), style = "height:90px"),
                    # value_box(value = div(style = "font-size:1rem", uiOutput("RRexact_adj")), title = div(style = "font-size:0.8rem", HTML("RR<sub>exact</sub>")), theme = theme_used, div(style = "font-size:0.6rem","Adjusted"), style = "height:90px")
                  )
                ),
                
                #End of part 1
                #tags$hr(),
                
                #Start of Enter estimated (plausible)
                #h5("Enter estimated (plausible) correlation between measured and perfect confounder score"),
                tags$label(HTML("<b>Enter estimated (plausible) correlation between measured and perfect confounder score</b>")),
                
                layout_column_wrap(
                  class = "mb-1",
                  width = 1/2,
                  fluidRow(
                    column(
                      12,
                      div(
                        class = "d-flex align-items-center gap-2 mt-1",
                        tags$label("Estimated (plausible):", class = ""),
                        numericInput(
                          "es1",
                          label = NULL,
                          value = 0.6,
                          width = "200px"
                        ),
                        # square buttons using btn-sm and fixed width/height
                        actionButton(
                          "dec_es1", "-",
                          class = "btn btn-sm d-flex justify-content-center align-items-center",
                          style = "width:40px; height:34px;"
                        ),
                        actionButton(
                          "inc_es1", "+",
                          class = "btn btn-sm d-flex align-items-center justify-content-center", 
                          style = "width: 40px; height: 34px;"
                        )
                      )
                    )
                  ),
                  fluidRow(
                    column(
                      12,
                      div(
                        class = "d-flex align-items-center gap-2 mt-1",
                        tags$label("Estimate of RDR:", class = ""),
                        numericInput(
                          "erdr1",
                          label = NULL,
                          value = 0.65,
                          width = "200px"
                        ),
                        # square buttons using btn-sm and fixed width/height
                        actionButton(
                          "dec_erdr1", "-",
                          class = "btn btn-sm d-flex justify-content-center align-items-center",
                          style = "width:40px; height:34px;"
                        ),
                        actionButton(
                          "inc_erdr1", "+",
                          class = "btn btn-sm d-flex align-items-center justify-content-center", 
                          style = "width: 40px; height: 34px;"
                        )
                      )
                    )
                  )
                ),
                
                layout_column_wrap(
                  class = "mb-1 mt-2",
                  width = 1/2,
                  #style = "padding-bottom: 1rem;",
                  layout_column_wrap(
                    width = 1/4,
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem",uiOutput("es_r2_1")), title = div(style = "font-size:0.8rem", HTML("% reduction (r<sup>2</sup>)")), theme = theme_used, p(""), style = "height:90px"),
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem",uiOutput("es_bexact_1")), title = div(style = "font-size:0.8rem", HTML("B<sub>exact</sub>")), theme = theme_used, p(""), style = "height:90px"),
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem",uiOutput("es_rrexact_1")), title = div(style = "font-size:0.8rem", HTML("RR<sub>exact</sub>")), theme = theme_used, p(""), style = "height:90px")
                  ),
                  layout_column_wrap(
                    width = 1/4,
                    value_box(value = div(style = "font-size:1rem",uiOutput("es_rdrc_1")), title = div(style = "font-size:0.8rem", HTML("RDR-corrected RR<sub>exact</sub>")), theme = theme_used, p(""), style = "height:90px")
                  )
                ),
                
                layout_column_wrap(
                  class = "mb-1 mt-2",
                  width = 1/2,
                  fluidRow(
                    column(
                      12,
                      div(
                        class = "d-flex align-items-center gap-2 mt-1",
                        tags$label("Estimated (plausible):", class = ""),
                        numericInput(
                          "es2",
                          label = NULL,
                          value = 0.7,
                          width = "200px"
                        ),
                        # square buttons using btn-sm and fixed width/height
                        actionButton(
                          "dec_es2", "-",
                          class = "btn btn-sm d-flex justify-content-center align-items-center",
                          style = "width:40px; height:34px;"
                        ),
                        actionButton(
                          "inc_es2", "+",
                          class = "btn btn-sm d-flex align-items-center justify-content-center", 
                          style = "width: 40px; height: 34px;"
                        )
                      )
                    )
                  ),
                  fluidRow(
                    column(
                      12,
                      div(
                        class = "d-flex align-items-center gap-2 mt-1",
                        tags$label("Estimate of RDR:", class = ""),
                        numericInput(
                          "erdr2",
                          label = NULL,
                          value = 0.65,
                          width = "200px"
                        ),
                        # square buttons using btn-sm and fixed width/height
                        actionButton(
                          "dec_erdr2", "-",
                          class = "btn btn-sm d-flex justify-content-center align-items-center",
                          style = "width:40px; height:34px;"
                        ),
                        actionButton(
                          "inc_erdr2", "+",
                          class = "btn btn-sm d-flex align-items-center justify-content-center", 
                          style = "width: 40px; height: 34px;"
                        )
                      )
                    )
                  )
                ),
                
                layout_column_wrap(
                  class = "mb-1 mt-2",
                  width = 1/2,
                  #style = "padding-bottom: 1rem;",
                  layout_column_wrap(
                    width = 1/4,
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem", uiOutput("es_r2_2")), title = div(style = "font-size:0.8rem", HTML("% reduction (r<sup>2</sup>)")), theme = theme_used, p(""), style = "height:90px"),
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem", uiOutput("es_bexact_2")), title = div(style = "font-size:0.8rem", HTML("B<sub>exact</sub>")), theme = theme_used, p(""), style = "height:90px"),
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem", uiOutput("es_rrexact_2")), title = div(style = "font-size:0.8rem", HTML("RR<sub>exact</sub>")), theme = theme_used, p(""), style = "height:90px")
                  ),
                  layout_column_wrap(
                    width = 1/4,
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem", uiOutput("es_rdrc_2")), title = div(style = "font-size:0.8rem", HTML("RDR-corrected RR<sub>exact</sub>")), theme = theme_used, p(""), style = "height:90px")
                  )
                ),
                
                layout_column_wrap(
                  class = "mb-1",
                  width = 1/2,
                  fluidRow(
                    column(
                      12,
                      div(
                        class = "d-flex align-items-center gap-2 mt-1",
                        tags$label("Estimated (plausible):", class = ""),
                        numericInput(
                          "es3",
                          label = NULL,
                          value = 0.8,
                          width = "200px"
                        ),
                        # square buttons using btn-sm and fixed width/height
                        actionButton(
                          "dec_es3", "-",
                          class = "btn btn-sm d-flex justify-content-center align-items-center",
                          style = "width:40px; height:34px;"
                        ),
                        actionButton(
                          "inc_es3", "+",
                          class = "btn btn-sm d-flex align-items-center justify-content-center", 
                          style = "width: 40px; height: 34px;"
                        )
                      )
                    )
                  ),
                  fluidRow(
                    column(
                      12,
                      div(
                        class = "d-flex align-items-center gap-2 mt-1",
                        tags$label("Estimate of RDR:", class = ""),
                        numericInput(
                          "erdr3",
                          label = NULL,
                          value = 0.65,
                          width = "200px"
                        ),
                        # square buttons using btn-sm and fixed width/height
                        actionButton(
                          "dec_erdr3", "-",
                          class = "btn btn-sm d-flex justify-content-center align-items-center",
                          style = "width:40px; height:34px;"
                        ),
                        actionButton(
                          "inc_erdr3", "+",
                          class = "btn btn-sm d-flex align-items-center justify-content-center", 
                          style = "width: 40px; height: 34px;"
                        )
                      )
                    )
                  )
                ),
                
                layout_column_wrap(
                  class = "mt-2 mb-1",
                  width = 1/2,
                  layout_column_wrap(
                    width = 1/4,
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem",uiOutput("es_r2_3")), title = div(style = "font-size:0.8rem", HTML("% reduction (r<sup>2</sup>)")), theme = theme_used, p(""), style = "height:90px"),
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem",uiOutput("es_bexact_3")), title = div(style = "font-size:0.8rem", HTML("B<sub>exact</sub>")), theme = theme_used, p(""), style = "height:90px"),
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem",uiOutput("es_rrexact_3")), title = div(style = "font-size:0.8rem", HTML("RR<sub>exact</sub>")), theme = theme_used, p(""), style = "height:90px")
                  ),
                  layout_column_wrap(
                    width = 1/4,
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem",uiOutput("es_rdrc_3")), title = div(style = "font-size:0.8rem", HTML("RDR-corrected RR<sub>exact</sub>")), theme = theme_used, p(""), style = "height:90px")
                  )
                ),
                
                #tags$hr(),
                
                #Start of Enter RRadj
                tags$label(HTML("<b>Enter RR<sub>adj</sub> to estimate what the correlation between measured confounders and Perfect Confounder Score would have to be for this RR<sub>adj</sub></b>")),
                
                layout_column_wrap(
                  class = "mb-1",
                  width = 1/2,
                  fluidRow(
                    column(
                      12,
                      div(
                        class = "d-flex align-items-center gap-2 mt-1",
                        tags$label(HTML("Estimated RR<sub>adj</sub>:"), class = ""),
                        numericInput(
                          "erradj",
                          label = NULL,
                          value = 0.7,
                          width = "200px"
                        ),
                        actionButton(
                          "dec_erradj", "-",
                          class = "btn btn-sm d-flex justify-content-center align-items-center",
                          style = "width:40px; height:34px;"
                        ),
                        actionButton(
                          "inc_erradj", "+",
                          class = "btn btn-sm d-flex align-items-center justify-content-center", 
                          style = "width: 40px; height: 34px;"
                        )
                      )
                    )
                  ),
                  fluidRow(
                    column(
                      12,
                      div(
                        class = "d-flex align-items-center gap-2 mt-1",
                        tags$label("Estimate of RDR:", class = ""),
                        numericInput(
                          "erdr4",
                          label = NULL,
                          value = 0.65,
                          width = "200px"
                        ),
                        # square buttons using btn-sm and fixed width/height
                        actionButton(
                          "dec_erdr4", "-",
                          class = "btn btn-sm d-flex justify-content-center align-items-center",
                          style = "width:40px; height:34px;"
                        ),
                        actionButton(
                          "inc_erdr4", "+",
                          class = "btn btn-sm d-flex align-items-center justify-content-center", 
                          style = "width: 40px; height: 34px;"
                        )
                      )
                    )
                  )
                ),
                
                #value_box(value = div(style = "font-size:1rem",uiOutput("es_rdrc_3")), title = div(style = "font-size:0.8rem", HTML("RDR-corrected RR<sub>exact</sub>")), theme = theme_used, p(""), style = "height:120px")
                
                layout_column_wrap(
                  class = "mt-2 mb-1",
                  width = 1/2,
                  layout_column_wrap(
                    width = 1/4,
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem",uiOutput("r02_rr_adj")), title = div(style = "font-size:0.8rem", HTML("% reduction (r<sub>0</sub><sup>2</sup>)")), theme = theme_used, p(""), style = "height:90px"),
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem",uiOutput("r0_rr_adj")), title = div(style = "font-size:0.8rem", HTML("r<sub>0</sub>")), theme = theme_used, p(""), style = "height:90px")
                  ),
                  layout_column_wrap(
                    width = 1/4,
                    value_box(value = div(class= "fw-bold", style = "font-size:1rem",uiOutput("es_rdrc_4")), title = div(style = "font-size:0.8rem", HTML("RDR-corrected RR<sub>exact</sub>")), theme = theme_used, p(""), style = "height:90px")
                  )
                )
              ),
              #--end calculator----
              
              nav_menu( "Archive", 
                        
              ), 
  )
)