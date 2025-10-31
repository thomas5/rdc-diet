#-----------------------------------------------------------------
# This website is for "Richard Doll Consortium Diet Collaboration"
#coded by Ling Kong, 31/July 2025
#----------------------------------------------------------------
library(shiny)
library(bslib)

fluidPage(
    tags$head(
      tags$style(HTML("hr {border-top: 1px solid #203e58}
        *{font-family:'Arial': Arial;'Times New Roman':Times New Roman;}
        .tabbable > .nav > li > a[data-value='Calculator'] {color:#041e42;font-size: 1.4359rem}
        .tabbable > .nav > li[class=default] > a { color:#041e42}
        .tabbable > .nav > li > a { color:041e42 }
        .tabbable > .nav > li > a[data-value='Confidential preliminary results July 2022'] {color:#041e42; font-size: 1.4359rem}
        .tabbable > .nav > li > a[data-value='Confidential preliminary results March 2023'] {color:#041e42; font-size: 1.4359rem}
        .tabbable > .nav > li > a[data-value='Dietary factor characteristics'] {color:#041e42; font-size: 1.4359rem}
        .tabbable > .nav > li > a[data-value='Home'] {color:#041e42;font-size: 1.4359rem}
        .tabbable > .nav > li > a[data-value='Information'] {color:#041e42;font-size: 1.4359rem}
        .tabbable > .nav > li[class=active] > a {background-color:#f2efea;color:#041e42;font-size: 1.4359rem}
        .first-ul{list-style-type: decimal;list-style-position: outside;list-style-type: decimal;}
        .second-ul{list-style-type: none;list-style-position: outside;list-style-type: disc;}
        .third-ul{list-style-type: lower-alpha; list-style-position: outside;list-style-type: circle;}
        table, tr,td {border: 0.5px solid #c0c0c0;vertical-align: middle;}
        tr{height: 38px;}
        tr:hover {background-color:#ffffff;}
       .one {text-indent: 10px;}
       #valRed{color:#FF0000}
       p.solid {outline-style: solid; outline-width: thin; outline-offset: 6px; outline-color: #A9A9A9;}
        ")) 
    ),
    h1("Richard Doll Consortium Diet Collaboration",style = "color:#041e42; font-family:Arial; font-size: 4.5359rem; text-align:left"),
    tabsetPanel( id = "tabset",
      #--home--
      tabPanel("Home",  br(),style="text-align:justify;color:black;background-color:#f2efea;padding:15px;border-radius:10px；font-family:Arial ;font-size: 1.3359rem;",
        p("The aims of the ",strong("Richard Doll Consortium Diet Collaboration")," are to:"),
        tags$div("1. ",strong("Review the prospective epidemiological evidence"), "on selected dietary risk factors and vascular disease, lung cancer and diabetes, aiming to avoid or limit 4 major sources of bias:", br(),
          tags$ul(class='first-ul',
            tags$li("Reverse causality"),
            tags$li("Publication bias"),
            tags$li("Imprecision of baseline dietary information (as a measure of long-term “usual” intake)"),
            tags$li("Unmeasured and/or residual confounding")
            )
          ),
         tags$div( "2. ", strong("Prepare a collaborative report of the meta-analyses"), "of the shared results from the collaborating studies, making the analyses transparently available without undue insistence on how best to interpret them."
          ), br(),
       p( strong("Confidential analyses")," involving 12 dietary factors, 7 outcomes and 3 sets of inclusion criteria have been shared by the PIs of the questionnaire-based prospective studies of diet with >100,000 recruited by 2010 (see",actionLink("link_to_info", "Information")," page for details)."),
     
      tags$div( "All of the analyses and meta-analyses are available on the ", actionLink("link_to_base2024", "Dietary factor characteristics")," and ", actionLink("link_to_outcome2024", "Outcome analyses")," pages of this website."), br(),
        p("[NOTE: website works best with Firefox]")
      ),
      #--end home----    
      tabPanel("Information",  br(),style="text-align:justify;color:black;background-color:#f2efea;padding:15px;border-radius:10px；font-family:Arial ;font-size: 1.3359rem;",
            p(strong("METHODOLOGICAL DETAILS")),
            tags$div(strong("1.	Limiting the effects of reverse causality"),
                tags$ul(class='second-ul',
                    tags$li("Restrict attention to prospective studies"),
                    tags$li("Omit people with prior disease at entry"),
                    tags$li("Omit the first 3 (or so) years of follow-up")
                ),
           ),
           tags$div(strong("2.	Limiting the effects of publication bias"),
              tags$ul(class='second-ul',
                      tags$li("Specify a set of 20 “eligible” prospective studies: all those with diet questions on >100,000 by 2010"),
                      tags$li("Specify a set of exposures (dietary factors), and specify a set of outcomes (disease rates)"),
                      tags$li("For EACH exposure-outcome pair thus specified, seek detailed analyses of it from all eligible studies with relevant data, and NO OTHER studies")
              )
            ),
           tags$div(strong("3.	Limiting the effects of imprecision of baseline data (for assessing usual dietary intake)"),
                    tags$ul(class='second-ul',
                            tags$li("For each dietary factor, check how the extreme baseline categories of intake (lowest vs highest) were defined in each study."),
                            tags$li("Check whether those baseline-defined categories were at least moderately predictive of the mean intake of that dietary factor at a later re-survey.")
                    )
           ),
           tags$div(strong("4.	Limiting the effects of unmeasured and residual confounding"),
              tags$ul(class='second-ul',
                  tags$li("Dietary factors correlate with other risk factors for vascular disease, lung cancer, and diabetes (eg, smoking, education, other deprivation, BMI)."),
                  tags$li("Adjustment of an RR for realistically noisy measures of these confounders merely reduces such problems, as substantial residual confounding will remain after it ",tags$a(href="https://youtu.be/B0ZpenVs8oI?si=r1TfTWoqAJ4zBUwx","(link).",target="_blank"))
              )
            ),br(),
          p(strong("STATISTICAL ANALYSES")),
          p("The analyses are based on the",tags$a(href="combined analysis request agreed by the PIs in 2021 doc.pdf","analysis request agreed by the PIs in 2021,",target="_blank"), "involving a maximum of 1512 RRs (and their 95% CIs) plus 84 diet-confounder correlations from each study."),
            
          tags$div(strong("Twelve dietary factors:"),
               tags$ul(class='second-ul',
                  tags$li(strong("Meat:")),   
                        tags$ul(class='third-ul',
                        tags$li("Processed meat (sausage, bacon, ham, etc)*"),  
                        tags$li("Red meat (excluding poultry or processed meat)**") 
                        ),
                  tags$li(strong("Sugary drinks: ")), 
                        tags$ul(class='third-ul',
                          tags$li("Sugary drinks (sugar-sweetened cold drinks)") 
                        ),
                  tags$li(strong('4 "healthy" foods:')),
                  tags$ul(class='third-ul',
                          tags$li("Fruit (excluding fruit juice)"),  
                          tags$li("Vegetables (preferably excluding starchy carbohydrates, although some questionnaires could not exclude them)") ,
                          tags$li("Wholegrain foods (estimated mainly from cereals or wholegrain bread, although in some studies this included all brown bread)"),  
                          tags$li("Fibre (estimated mainly from fruit, vegetables and wholegrain)") ,
                        ),
                  tags$li(strong("Nuts and Legumes:")),
                        tags$ul(class='third-ul',
                        tags$li("Beans (including dried, baked, refried, chili, or other beans, but not soy beans)"),
                        tags$li("Peas (dried or fresh, including split peas, but excluding the pods of fresh peas)"),
                        tags$li("Soy foods (estimated total soybean content)"),
                        tags$li("Nuts (preferably excluding peanuts, although some questionnaires could not do this)")
                        ),  
                  tags$li(strong("Dietary index:")), 
                        tags$ul(class='third-ul',
                          tags$li("Preferred index of overall dietary quality (%).") 
                        ),
                     ),
                  ),
         p(style="font-size: 1.1359rem","*Analyses were only conducted in North America and Europe (US/ANZ/Eur).",br(),
           "**Analyses were conducted separately for North America and Europe (US/ANZ/Eur) and Asia."),
           tags$div(strong("Seven outcomes (and their ICD-10 codes):"),
             tags$ul(class='second-ul',
                  tags$li("IHD mortality (I20-25), MI incidence (I21)"),
                  tags$li("Stroke mortality (I60-69), Stroke incidence (I60-64)"), 
                  tags$li("Lung cancer mortality (C34), Lung cancer incidence (C34)"), 
                  tags$li("Diabetes incidence (E10-14)")
              ),
            ), 
            tags$div(strong("Three sets of inclusion criteria:"),
                tags$ul(class='second-ul',
                    tags$li('All participants (follow-up to age 90)'),
                    tags$li('Never-smokers (follow-up to age 90)'),
                    tags$li('All participants (age<75) (follow-up to age 75)'),
                ),
            ),
          tags$div(
            p(strong("Three progressive levels of adjustment for confounders")),
            p("Each analysis (of a particular dietary factor versus a particular outcome with particular inclusion criteria) was provided with three progressive levels of adjustment:"),
            
            p(HTML('&emsp;'),strong('Basic:'),HTML('&nbsp;'),strong(" RR adjusted only for age, sex, and region (if relevant)."),br(),
            HTML('&emsp;'),strong('Adj:'),HTML('&emsp;&nbsp;'),strong("RR with additional adjustment for smoking (if relevant), and social factors"),", including some measure(s) of education and/or income and/or SES and/or deprivation, but not adjusted for BMI, BP or energy intake. In a few studies, additional adjustments were made for any other factors considered appropriate by the PI.",br(),
            HTML('&emsp;'),strong('Full:' ),HTML('&emsp;&nbsp;'),strong("RR with additional adjustment for BMI.")),
          ),
         tags$div("The changes in log RR produced by these progressive levels of adjustment are given as percentages. Let r denote the partial correlation coefficient between the true value T and noisy value N of the confounder within the baseline-defined high and low categories of the dietary factor of interest. If r was 1.0, 0.8, 0.7 or 0.6, then adjustment for N (the noisy measure of the confounding factor) should be expected to make log RR jump all the way, or about two-thirds of the way, or about half of the way, or only about one-third of the way, from its unadjusted value towards what its value should have been on adjustment for T (ie, on perfect adjustment for the confounding factor). These percentage changes, together with consideration of how reliably the relevant confounding factors are thought to have been known, can help judge how much of the adjusted log RR can plausibly be ascribed to residual confounding. ", tags$i("The % change in log RR is given only if the basic log RR differs by >3.3 SE (p<0.001) from zero (",HTML("&#967;&#178")," of 10.89). SE of log RR ≈2/√n.")),
          br(),
          p("Note: Some studies provided analyses both with and without energy adjustment. Where both were available, the results were not materially different (see ",tags$a(href="Ratio of RRs (energy vs not energy adjusted) never.pdf","table).",target="_blank"),"Hence, where both were available, the analyses without energy adjustment are used in the meta-analyses, for consistency with the many studies in which energy adjustment was not possible. Further details on analyses with energy adjustment are located here for ", tags$a(href="all90.pdf","all participants,",target="_blank"), tags$a(href="all75.pdf", "all participants (age < 75)",target="_blank")," and ",  tags$a(href="never.pdf", "never smokers.",target="_blank")),br(),
          
        p(strong("STUDY ACRONYMS"),
          tags$table(style = "width:100%;",id="table1",
               tags$tr(tags$th(id = "th1", style ="width: 15%" ,"Study abbreviated name"),
                       tags$th(id="th1",style ="width: 10%", "Study Location"),
                       tags$th(id="th1",style ="width: 35%" ,"Full study name and link"),
                       tags$th(id="th1",style ="width: 40%" ,"Questionnaire link")
                       ),
               #----Mostly North America---
              tags$tr(style="height:30px;",tags$th("Mostly North America")),
              tags$tr(tags$td(HTML('&emsp;'),"CPS-II Mort"),
                      tags$td(HTML('&emsp;'),"USA"),
                      tags$td(tags$a(href="https://www.cancer.org/research/population-science/cancer-prevention-and-survivorship-research-team/acs-cancer-prevention-studies/cancer-prevention-study-2.html/","American Cancer Society Cancer Prevention Study II",target="_blank")),
                      tags$td(tags$a(href="https://www.cancer.org/content/dam/cancer-org/research/epidemiology/cps-II-baseline-1982-men.pdf","www.cancer.org/content/dam/cancer-org/research/epidemiology/cps-II-baseline-1982-men.pdf",target="_blank"),br(),
                      tags$a(href="https://www.cancer.org/content/dam/cancer-org/research/epidemiology/cps-II-baseline-1982-women.pdf","www.cancer.org/content/dam/cancer-org/research/epidemiology/cps-II-baseline-1982-women.pdf",target="_blank")
                              )
                      ),
              tags$tr(tags$td(HTML('&emsp;'),"NIH-AARP"),
                      tags$td(HTML('&emsp;'),"USA"),
                     tags$td(tags$a(href="https://dietandhealth.cancer.gov/","NIH-AARP Diet and Health Study",target="_blank")),
                     tags$td(tags$a(href="https://dietandhealth.cancer.gov/archive/","https://dietandhealth.cancer.gov/archive/",target="_blank")),
                     
                     ),       
            tags$tr(tags$td(HTML('&emsp;'),"Harvard: HPFS", br(), HTML('&emsp;&emsp;&emsp;&emsp;&emsp;'),"NHS-1"),
                    tags$td(HTML('&emsp;'),"USA"),
                   tags$td(tags$a(href="https://sites.sph.harvard.edu/hpfs/","Health Professionals Follow-up Study (HPFS)",target="_blank"),br(), tags$a(href="https://nurseshealthstudy.org/","Nurses’ Health Study (NHS-1)",target="_blank"),br(),"(Only energy adjusted results)"),
                  ),
          tags$tr(tags$td(HTML('&emsp;'),"MEC"),
                  tags$td(HTML('&emsp;'),"USA"),
                  tags$td(tags$a(href="https://www.uhcancercenter.org/mec","Multi-Ethnic Consortium ",target="_blank"),br(),"(Results to follow)")
                  ),
          tags$tr(tags$td(HTML('&emsp;'),"CPS-II Nutr"),
                  tags$td(HTML('&emsp;'),"USA"),
                  tags$td(tags$a(href="https://www.cancer.org/research/population-science/cancer-prevention-and-survivorship-research-team/acs-cancer-prevention-studies/cancer-prevention-study-2.html","American Cancer Society Cancer Prevention Study II Nutrition cohort",target="_blank")),
                  tags$td(tags$a(href="https://www.cancer.org/content/dam/cancer-org/research/epidemiology/cps-II-nutrition-1992-men-and-women.pdf","www.cancer.org/content/dam/cancer-org/research/epidemiology/cps-II-nutrition-1992-men-and-women.pdf",target="_blank"),br(),
                  tags$a(href="https://www.cancer.org/content/dam/cancer-org/research/epidemiology/cps-II-nutrition-1999-long-survey-men.pdf","www.cancer.org/content/dam/cancer-org/research/epidemiology/cps-II-nutrition-1999-long-survey-men.pdf",target="_blank"),br(),
                  tags$a(href="https://www.cancer.org/content/dam/cancer-org/research/epidemiology/cps-II-nutrition-1999-long-survey-women.pdf","www.cancer.org/content/dam/cancer-org/research/epidemiology/cps-II-nutrition-1999-long-survey-women.pdf",target="_blank")
                          )
                  ),
          tags$tr(tags$td(HTML('&emsp;'),"WHI"),
                  tags$td(HTML('&emsp;'),"USA"),
                  tags$td(tags$a(href="https://www.whi.org/","Women’s Health Initiative",target="_blank")),
                  tags$td(tags$a(href="https://epic.iarc.fr/","https://epic.iarc.fr/",target="_blank"))
                  ),
          tags$tr(tags$td(HTML('&emsp;'),"Mexico City"),
                  tags$td(HTML('&emsp;'),"Mexico"),
                  tags$td(tags$a(href="https://www.ctsu.ox.ac.uk/research/prospective-blood-based-study-of-150-000-individuals-in-mexico","Mexico City Prospective Study",target="_blank"),br(),"(using ‘fruit and vegetables’ in the analyses of vegetables)"),
                  tags$td(tags$a(href="https://datashare.ndph.ox.ac.uk/mexico/label.cgi?id=3 ","https://datashare.ndph.ox.ac.uk/mexico/label.cgi?id=3",target="_blank"))
                  ),
          tags$tr(tags$td(HTML('&emsp;'),"PLCO"),
                  tags$td(HTML('&emsp;'),"USA"),
                  tags$td(tags$a(href="https://prevention.cancer.gov/major-programs/prostate-lung-colorectal-and-ovarian-cancer-screening-trial","Prostate, Lung, Colorectal and Ovarian Cancer Screening Trial",target="_blank")),
                  tags$td(tags$a(href="https://cdas.cancer.gov/datasets/plco/4/ ","https://cdas.cancer.gov/datasets/plco/4/ ",target="_blank"))
                  ),
          tags$tr(tags$td(HTML('&emsp;'),"CTS"),
                  tags$td(HTML('&emsp;'),"USA"),
                  tags$td(tags$a(href="https://www.calteachersstudy.org/","California Teachers Study (CTS)",target="_blank")),
                  tags$td(tags$a(href="https://www.calteachersstudy.org/past-questionnaires","https://www.calteachersstudy.org/past-questionnaires",target="_blank"))
                  ),
          #---Mostly Europe/Anz---
          tags$tr(style="height:30px;",tags$th("Mostly Europe/Anz")),
          tags$tr(tags$td(HTML('&emsp;'),"MWS"),
                  tags$td(HTML('&emsp;'),"UK"),
                  tags$td(tags$a(href="http://www.millionwomenstudy.org/introduction/","Million Women Study",target="_blank")),
                  tags$td(tags$a(href="https://www.ceu.ox.ac.uk/research/million-women-study-old/million-women-study-1/questionnaires","https://www.ceu.ox.ac.uk/research/million-women-study-old/million-women-study-1/questionnaires",target="_blank"))
                  ),
          tags$tr(tags$td(HTML('&emsp;'),"EPIC"),
                  tags$td(HTML('&emsp;'),"Europe"),
                  tags$td(tags$a(href="https://epic.iarc.fr/","European Prospective Investigation into Cancer and Nutrition",target="_blank")),
                  ),
          tags$tr(tags$td(HTML('&emsp;'),"UK Biobank"),
                  tags$td(HTML('&emsp;'),"UK"),
                  tags$td(tags$a(href="https://www.ukbiobank.ac.uk/","UK Biobank",target="_blank")),
                  tags$td(tags$a(href="https://biobank.ndph.ox.ac.uk/showcase/refer.cgi?id=113241","https://biobank.ndph.ox.ac.uk/showcase/refer.cgi?id=113241",target="_blank"))
                  ),
          tags$tr(tags$td(HTML('&emsp;'),"45 & Up"),
                  tags$td(HTML('&emsp;'),"ANZ"),
                  tags$td(tags$a(href="https://www.saxinstitute.org.au/our-work/45-up-study/","45 and Up",target="_blank")),
                  tags$td(tags$a(href="https://www.saxinstitute.org.au/wp-content/uploads/45Up-Study-Male-v3b_f7641.pdf","https://www.saxinstitute.org.au/wp-content/uploads/45Up-Study-Male-v3b_f7641.pdf",target="_blank"),br(),
                         tags$a(href="https://www.saxinstitute.org.au/wp-content/uploads/45Up-Study-Female-v3b_ba7a.pdf","https://www.saxinstitute.org.au/wp-content/uploads/45Up-Study-Female-v3b_ba7a.pdf",target="_blank"),br(),
                         tags$a(href="https://www.saxinstitute.org.au/wp-content/uploads/2012-Follow-Up-45-and-Up-Study-MEN.pdf","https://www.saxinstitute.org.au/wp-content/uploads/2012-Follow-Up-45-and-Up-Study-MEN.pdf",target="_blank"),br(),
                         tags$a(href="https://www.saxinstitute.org.au/wp-content/uploads/2012-Follow-Up-45-and-Up-Study-WOMEN.pdf","https://www.saxinstitute.org.au/wp-content/uploads/2012-Follow-Up-45-and-Up-Study-WOMEN.pdf",target="_blank")
                          )
                  ),
          tags$tr(tags$td(HTML('&emsp;'),"NOWAC"),
                  tags$td(HTML('&emsp;'),"Norway"),
                  tags$td(tags$a(href="https://uit.no/research/nowac_en","Norwegian Women and Cancer Study",target="_blank")),
                  tags$td(tags$a(href=" https://uit.no/research/nowac_en/project?pid=824582"," https://uit.no/research/nowac_en/project?pid=824582",target="_blank"))
                  ),
          tags$tr(tags$td(HTML('&emsp;'),"NLCS"),
                  tags$td(HTML('&emsp;'),"Netherlands"),
            tags$td(tags$a(href="https://epi.grants.cancer.gov/cohort-consortium/members/nlcs.html","Netherlands Cohort Study",target="_blank")),
            tags$td("No link available")
            ),
          tags$tr(tags$td(HTML('&emsp;'),"Generations"),
                  tags$td(HTML('&emsp;'),"UK"),
                  tags$td(tags$a(href="https://www.breakthroughgenerations.org.uk/home","Breakthrough Generations Study ",target="_blank")),
                  tags$td(tags$a(href="https://github.com/UK-Generations-Study/Study-Documents","https://github.com/UK-Generations-Study/Study-Documents",target="_blank"))
                  ),
          #---Mostly Asia----;
          tags$tr(style="height:30px;",tags$th("Mostly Asia")),
          tags$tr(tags$td(HTML('&emsp;'),"CKB"),
                  tags$td(HTML('&emsp;'),"China"),
                  tags$td(tags$a(href="https://www.ckbiobank.org/","China Kadoorie Biobank",target="_blank")),
                  tags$td(tags$a(href="https://www.ckbiobank.org/study-resources/survey-data","https://www.ckbiobank.org/study-resources/survey-data",target="_blank"))
                  ),
          tags$tr(tags$td(HTML('&emsp;'),"PURE"),
                  tags$td(HTML('&emsp;'),"Global"),
                  tags$td(tags$a(href="https://www.phri.ca/research/pure/","Prospective Urban Rural Epidemiology Study ",target="_blank"),br(),"(Some results n/a because models did not converge due to small no. of events)"),
                  
                  ),
          tags$tr(tags$td(HTML('&emsp;'),"KoGES"),
                  tags$td(HTML('&emsp;'),"Korea"),
                  tags$td(tags$a(href="http://www.cdc.go.kr/contents.es?mid=a50401010100","Korean Genome and Epidemiology Study",target="_blank")),
                  
                  ),
          tags$tr(tags$td(id="td2",HTML('&emsp;'),"JPHC"),
                  tags$td(HTML('&emsp;'),"Japan"),
                  tags$td(id="td2",tags$a(href="https://epi.ncc.go.jp/en/jphc/","Japan Public Health Center-based Prospective Study",target="_blank")),
                  tags$td(id="td2",tags$a(href="https://epi.ncc.go.jp/files/00_common/questionnaire/JPHC_Q05_eng.pdf","https://epi.ncc.go.jp/files/00_common/questionnaire/JPHC_Q05_eng.pdf",target="_blank")),
                  ),
          tags$tr(tags$td(HTML('&emsp;'),"Shanghai: SMHS", br(),  HTML('&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;'),"SWHS"),
                  tags$td(HTML('&emsp;'),"China/Shanghai"),
                  tags$td(tags$a(href="https://www.vumc.org/global-health/shanghai-mens-health-study","Shanghai Men’s Health Study",target="_blank"),br(), tags$a(href="https://dceg.cancer.gov/research/who-we-study/cohorts/shanghai-prospective-study-women-china","Shanghai Women’s Health Study",target="_blank")),
                  tags$td(tags$a(href="https://swhs-smhs.app.vumc.org/Cohort_Description.php","https://swhs-smhs.app.vumc.org/Cohort_Description.php",target="_blank"))
                  ),
          ),
          br(),br(),
        ),
      ),
      #---end information---
      ###start Baseline characteristics 2024###
      tabPanel("Dietary factor characteristics", br(), 
         sidebarLayout(
            sidebarPanel(width=3,
               p( class= "solid", strong("Baseline and resurvey characteristics")),br(),
               selectInput("baselinefood2024",label= "Dietary factor:", 
                           choice = list("Processed meat"="processmeat",
                                       "Red meat (not processed)"="redmeat",
                                       "Sugary drinks (sugar-sweetened cold drinks)"="sugarybeverages",
                                       "Fruit (excluding fruit juice)"="fruit",
                                       "Fibre (mainly from fruit, vegetables, and wholegrain foods)"="fibre",
                                       "Wholegrain foods"="wholegrain",
                                       "Vegetables (excluding starchy carbohydrates)"="veg",
                                       "Nuts (preferably excluding peanuts)"="nuts",
                                       "Soy foods"="soyfood",
                                       "Beans"="beans",
                                       "Peas"="peas",
                                       "Dietary index (study-specific index of overall dietary quality)"="index")
               ),
                              
               p('For the chosen dietary factor (among all participants*), you will see a 5-page PDF:'),
               tags$ul(class='first-ul',
                  tags$li("A table of the high and the low baseline-defined groups including the definitions of each intake category as provided by the PIs and an estimated mean intake in grams/day for the chosen dietary factor at baseline and at re-survey survey (if a partial re-survey was available)  in those groups."),
                  tags$li("A plot of these estimated means at baseline and at re-survey (if a partial re-survey was available) among those categorised at baseline as low or high."),
                  tags$li("Separate plots of the within-study associations for the chosen dietary factor with (i) % current smoking, (ii) % deprived, and (iii) % obese."),
               ),
               p(HTML('&emsp;'),"* Baseline dietary characteristics were only requested for the ‘all participants’ dataset",style = "font-size: 1.0359rem"),
               p("Further details about the analyses are given on the ",actionLink("link_to_info6", "Information")," page.")
            ),
                 
            mainPanel(width = 9,
               uiOutput("baseline_2024")
            )
         )
      ),
      ###end of Baseline characteristics 2024##
      ###Outcome Analyses 2024###
      tabPanel("Outcome analyses", br(),
         sidebarLayout(
            sidebarPanel(width=3,
               selectInput("fooditem2024", label="Dietary factor:",
                           choice = list("All dietary factors"="allfactor",
                                       "Processed meat"="processmeat",
                                       "Red meat (not processed)"="redmeat",
                                       "Sugary drinks (sugar-sweetened cold drinks)"="sugarybeverages",
                                       "Fruit (excluding fruit juice)"="fruit",
                                       "Fibre (mainly from fruit, vegetables, and wholegrain foods)"="fibre",
                                       "Wholegrain foods"="wholegrain",
                                       "Vegetables (excluding starchy carbohydrates)"="veg",
                                       "Nuts (preferably excluding peanuts)"="nuts",
                                       "Soy foods"="soyfood",
                                       "Beans "="beans",
                                       "Peas"="peas",
                                       "Dietary index (study-specific index of overall dietary quality)"="index")
               ),
               selectInput("outcome2024", label="Outcome:",
                           choices= c("IHD mortality (ICD-10: I20–25)"="ihd",
                                       "MI incidence (ICD-10: I21 ONLY)"="miincidence",
                                       "Stroke mortality (ICD-10: I60–69)"="stroke",
                                       "Stroke incidence (ICD-10: I60-64 ONLY)"="strokeincidence",
                                       "Diabetes incidence (ICD-10: E10-14)"="diabetesincidence",
                                       "Lung cancer mortality (ICD-10: C34)"="lungcancer",
                                       "Lung cancer incidence (ICD-10: C34)"="lungcancerincidence",
                                       "Diabetes incidence (ICD-10: E10-14)"="diabetesincidence")
                                          
               ),
               selectInput("participant2024",label= "Inclusion criteria:",
                           choice =c("Never-smokers, follow-up to age 90"="nosmoke90",
                                    "All participants, follow-up to age 90" = "allsmoke90",
                                    "All participants, follow-up to age 75"="allsmoke75")
               ),
               p('For the "All dietary factors" dietary option for a chosen outcome and inclusion criteria, you will see a 4-page PDF:'),
               tags$ul(class='first-ul',
                  tags$li("A forest plot of the associations for all dietary factors (high vs. low baseline-defined category) and an outcome within the inclusion criteria dataset. If the partial correlation coefficient (r) between the true value T and noisy value N of the confounder within the baseline-defined high and low categories of the dietary factor of interest was 0.8 or 0.6, then after adjustment for N, the log RR is expected to jump about two-thirds or only about one-third of the way, from its unadjusted value towards what its value should have been on adjustment for T (see",actionLink("link_to_info7", "Information")," page for more details)."),
                  tags$li("A table of the associations for all dietary factors (high vs. low baseline-defined category) and an outcome within the inclusion criteria dataset."),
                  tags$li("A table summarising the estimated mean intake at baseline and at re-survey (if a partial re-survey was available) in the high and the low baseline-defined groups, for all dietary factors among all participants*."),
                  tags$li("A table of the within-study associations among all participants* for all dietary factors with (i) % current smoking, (ii) % deprived, and (iii) % obese.")
                ),
               p(HTML('&emsp;'),"* Baseline dietary characteristics were only requested for the ‘all participants’ dataset",style = "font-size: 1.0359rem"),
               p("For each combination of dietary factor, outcome and inclusion criteria, you will see a 4-page PDF:"),
               tags$ul(class='first-ul',
                  tags$li("A plot showing the effect of sequential adjustment for confounders and then for BMI on the association between a dietary factor and an outcome within the inclusion criteria dataset."),
                  tags$li("A forest plot of the study-specific associations of a dietary factor (high vs. low baseline-defined category) and an outcome within the inclusion criteria dataset, showing the effect of sequential adjustment for confounders and then for BMI."),
                  tags$li("A plot of the estimated mean intake at baseline and at re-survey (if a partial re-survey was available) in the high and the low baseline-defined groups, among all participants*."),
                  tags$li("A plot of the within-study associations for a dietary factor with (i) % current smoking, (ii) % deprived, and (iii) % obese, among all participants*."),  
               ),
               p(HTML('&emsp;'),"* Baseline dietary characteristics were only requested for the ‘all participants’ dataset",style = "font-size: 1.0359rem"),
               p("Further details about the analyses are given on the ",actionLink("link_to_info5", "Information")," page.")
                              
            ),
            mainPanel(width = 9,
               uiOutput("results_2024")
            )
         )
      ),
      #####end of Outcome Analyses 2024###
      #----New added by Thomas for calculator---
      tabPanel("Calculator",  br(), style="text-align:justify;color:black;background-color:#f2efea;padding:15px;border-radius:10px；font-family:Arial ;font-size: 1.3359rem;",
               #Instruction
               card(
                 theme = "info",
                 full_screen = TRUE,
                 card_header("INSTRUCATIONS"),
                 card_body(
                   markdown("
                    <p>RRbasic = RR adjusted for age, sex and (where relevant) region <br />RRadj = RR adjsuted for measured confounders </p>
                    <ol>
                      <li>Enter RRbasic and RRadj from RDC website</li>
                      <li>Enter either:</li>
                        <p>Estimate of RRadj <br />
                        Estimate of correlation between measured confounders and Perfect Confounder Score</p>
                  ")
                 )
               ),
               
               
               # Application title
               #titlePanel("Enter RRs from RDC website"),
               p("Enter RRs from RDC website"),
               p("r0 is the value of r that results in null association"),
               p("RRexact is the RR that would have been observed on adjustment for the Perfect Confounder Score"),
               
               layout_column_wrap(
                 width = 1/2,  # two columns in one row
                 gap = "1rem",
                  layout_column_wrap(
                    width = 1/3,  # two columns in one row
                    gap = "1rem",
                    numericInput("rr_basic", NULL, value = 1.74, step = 0.01),
                    actionButton("dec_basic", "-", class = "btn-sm", width="3rem"),
                    actionButton("inc_basic", "+", class = "btn-sm")
                     # h5("Basic:"),
                     # div(class = "d-flex",
                     #     numericInput("rr_basic", NULL, value = 1.74, step = 0.01),
                     #     actionButton("dec_basic", "-", class = "btn-sm"),
                     #     actionButton("inc_basic", "+", class = "btn-sm")
                     # )
                   ),
                 card(
                   card_body(
                     # Use a heading as the label, then an inline flex row with bootstrap utilities
                     h5("Adjusted:"),
                     div(class = "d-flex align-items-center gap-2",
                         numericInput("rr_adj", NULL, value = 1.56, step = 0.01, width = "8.5rem"),
                         actionButton("inc_adj", "-", class = "btn-sm"),
                         actionButton("dec_adj", "+", class = "btn-sm")
                     )
                   )
                 )
               ),
               br(),
               layout_column_wrap(
                 fill = FALSE,
                 spacing = "1rem",
                 # Second row: 5 boxes
                 layout_column_wrap(
                   width = 1/5,  # 5 per row
                   gap = "1rem",
                   value_box(value = textOutput("B_basic"), title = "B", theme = "success", p("Basic"))
                 )
               ),
               br(),
               layout_column_wrap(
                 fill = FALSE,
                 spacing = "1rem",
                 # Second row: 5 boxes
                 layout_column_wrap(
                   width = 1/5,  # 5 per row
                   gap = "1rem",
                   value_box(value = uiOutput("B_adj"), title = "B", theme = "success", p("Adjusted")),
                   value_box(value = uiOutput("r02_adj"), title = "% reduction (r02)", theme = "success", p("Adjusted")),
                   value_box(value = uiOutput("r0_adj"), title = "r0", theme = "success", p("Adjusted")),
                   value_box(value = uiOutput("Bexact_adj"), title = "Bexact", theme = "success", p("Adjusted")),
                   value_box(value = uiOutput("RRexact_adj"), title = "RRexact", theme = "success", p("Adjusted"))
                 )
               )
               
      ),
      #--end calculator----
      
      nav_menu( "Archive", 
         tabPanel("Confidential preliminary results July 2022", br(), 
            sidebarLayout(
               sidebarPanel(width=3,
                  selectInput("fooditem", label="Dietary factor:", 
                              choice = list("Fruit (excluding fruit juice)"="fruit",
                                          "Vegetables (excluding starchy carbohydrates)"="veg",
                                          "Wholegrain foods"="wholegrain",
                                          "Fibre (mainly from fruit, vegetables, and wholegrain foods)"="fibre",
                                          "Legumes: Beans "="beans",
                                          "Legumes: Peas"="peas",
                                          "Legumes: Soy foods"="soyfood",
                                          "Red meat (not processed)"="redmeat",
                                          "Processed meat"="processmeat",
                                          "Nuts (preferably excluding peanuts)"="nuts",
                                          "Sugary drinks (sugar-sweetened cold drinks)"="sugarybeverages",
                                          "Diet index (study-specific index of overall dietary quality)"="index")
                  ),
                  selectInput("outcome", label="Outcome:", 
                              choices= c("IHD mortality (ICD-10: I20–25)"="ihd",
                                          "MI incidence (ICD-10: I21)"="miincidence",
                                          "Stroke mortality (ICD-10: I60–69)"="stroke",
                                          "Stroke incidence (ICD-10: I60-64)"="strokeincidence",
                                          "Lung cancer mortality (ICD-10: C34)"="lungcancer",
                                          "Lung cancer incidence (ICD-10: C34)"="lungcancerincidence",
                                          "Diabetes incidence (ICD-10: E10-14)"="diabetesincidence")
                  ),
                  selectInput("participant",label= "Inclusion criteria:", 
                              choice =c("Never-smokers, age at event < 90"="nosmoke90",
                                       "All participants, age at event < 90" = "allsmoke90",
                                          "All participants, age at event < 75"="allsmoke75") 
                  ),
                  p("For each combination of dietary factor, outcome and inclusion criteria, you will see a 4-page PDF:"),
                  tags$ul(class='first-ul',
                     tags$li("Summary results"),
                     tags$li("Forest plots of the study-specific results."),
                     tags$li("Within-study associations of the chosen dietary factor with confounders, among all participants."),
                     tags$li("Table of the associations of every dietary factor with confounders, among all participants.")
                  ),
                  p("Further details about the analyses are given on the ",actionLink("link_to_info2", "Information")," page.")
               ),
               mainPanel(width = 9,
                  uiOutput("results_2022")
               )
            )
         ),
         #---end July 2022---
         "----",
         tabPanel("Confidential preliminary results March 2023", br(), 
            sidebarLayout(
               sidebarPanel(width=3,
                  selectInput("fooditem2023", label="Dietary factor:", 
                      choice = list("All dietary factors"="AllFactor",
                                "Fruit (excluding fruit juice)"="fruit",
                                "Vegetables (excluding starchy carbohydrates)"="veg",
                                "Wholegrain foods"="wholegrain",
                                "Fibre (mainly from fruit, vegetables, and wholegrain foods)"="fibre",
                                "Legumes: Beans "="beans",
                                "Legumes: Peas"="peas",
                                "Legumes: Soy foods"="soyfood",
                                "Red meat (not processed)"="redmeat",
                                "Processed meat"="processmeat",
                                "Nuts (preferably excluding peanuts)"="nuts",
                                "Sugary drinks (sugar-sweetened cold drinks)"="sugarybeverages",
                                "Diet index (study-specific index of overall dietary quality)"="index")
                  ),
                  selectInput("outcome2023", label="Outcome:", 
                        choices= c("IHD mortality (ICD-10: I20–25)"="ihd",
                                 "MI incidence (ICD-10: I21)"="miincidence",
                                 "Stroke mortality (ICD-10: I60–69)"="stroke",
                                 "Stroke incidence (ICD-10: I60-64)"="strokeincidence",
                                 "Lung cancer mortality (ICD-10: C34)"="lungcancer",
                                 "Lung cancer incidence (ICD-10: C34)"="lungcancerincidence",
                                 "Diabetes incidence (ICD-10: E10-14)"="diabetesincidence")
                  ),
                  selectInput("participant2023",label= "Inclusion criteria:", 
                        choice =c( "Never-smokers, age at event < 90"="nosmoke90",
                                 "All participants, age at event < 90" = "allsmoke90",
                                "All participants, age at event < 75"="allsmoke75") 
                  ),
                  p("For each combination of dietary factor, outcome and inclusion criteria, you will see a 4-page PDF:"),
                  tags$ul(class='first-ul',
                     tags$li("Summary results"),
                     tags$li("Forest plots of the study-specific results."),
                     tags$li("Within-study associations of the chosen dietary factor with confounders, among all participants."),
                     tags$li("Table of the associations of every dietary factor with confounders, among all participants.")
                  ),
                  p('The "All dietary factors" dietary option provides a forest plot of all the dietary factors (highest vs. lowest baseline-defined category) of a chosen outcome and inclusion criteria.' ),
                  p("Further details about the analyses are given on the ",actionLink("link_to_info3", "Information")," page.")
               ),
               mainPanel(width = 9,
                  uiOutput("results_2023")
               )
            )
         ),
         #----end March 2023---
         "----",
         tabPanel("Dietary factor characteristics 2023", br(), 
            sidebarLayout(
               sidebarPanel(width=3,
                  selectInput("baselineOutput", label="Output:", 
                              choices= c("Baseline and resurvey estimates"="characteristics",
                                       "Confounder plots"="confounder")
                  ),
                  selectInput("baselinefood",label= "Food:", 
                              choice = list("Fruit (excluding fruit juice)"="Fruit",
                                       "Vegetables (excluding starchy carbohydrates)"="Vegetables",
                                       "Wholegrain foods"="Wholegrain",
                                       "Fibre (mainly from fruit, vegetables, and wholegrain foods)"="Fibre",
                                       "Legumes: Beans "="Beans",
                                       "Legumes: Peas"="Peas",
                                       "Legumes: Soy foods"="Soy",
                                       "Red meat (not processed)"="Redmeat",
                                       "Processed meat"="Processedmeat",
                                       "Nuts (preferably excluding peanuts)"="Nuts",
                                       "Sugary drinks (sugar-sweetened cold drinks)"="Sugardrinks",
                                       "Diet index (study-specific index of overall dietary quality)"="Index")
                  ),
                              
                  p('For each dietary factor, the following outputs can be selected: "Baseline and resurvey estimates" and "Confounder plots".'),
                  tags$ul(class='first-ul',
                     tags$li('"Baseline and resurvey estimates" provides a characteristics table of the highest and the lowest baseline-defined groups, including the definitions of each intake category as provided by the PIs and the estimated mean intake in grams/day, and a plot showing the ranges of within-country comparisons of the USUAL mean intake during follow-up in the lowest and highest baseline-defined categories of intake for a chosen dietary factor.'),
                     tags$li('The "Confounder plots" provide the study-specific associations of a chosen dietary factor with each confounder and the overall medians of the within-study associations for all dietary factors with smoking, deprivation and obesity. '),
                  ),
                  p("Further details about the analyses are given on the ",actionLink("link_to_info4", "Information")," page.")
               ),
               mainPanel(width = 9,
                  uiOutput("baseline_2023")
               )
            )
         ),
      ), 
   )
)

