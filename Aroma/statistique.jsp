<%@ include file="header.jsp" %>

    <%@ include file="menu.jsp" %>
    <%@ page import = "assets.StatistiqueCulture" %>
    <% 
      StatistiqueCulture statYlangPlante = (StatistiqueCulture)request.getAttribute("statYlangPlante");
      StatistiqueCulture statYlangRecolte = (StatistiqueCulture)request.getAttribute("statYlangRecolte");
      StatistiqueCulture statGeraniumPlante = (StatistiqueCulture)request.getAttribute("statGeraniumPlante");
      StatistiqueCulture statGeraniumRecolte = (StatistiqueCulture)request.getAttribute("statGeraniumRecolte");

      double hausse_YlangPlante_mois = statYlangPlante.getHausse_mois();
      double hausse_GeraniumPlante_mois = statGeraniumPlante.getHausse_mois();
      double hausse_YlangRecolte_mois = statYlangRecolte.getHausse_mois();
      double hausse_GeraniumRecolte_mois = statGeraniumRecolte.getHausse_mois();

      double hausse_YlangPlante_annee = statYlangPlante.getHausse_annee();
      double hausse_GeraniumPlante_annee = statGeraniumPlante.getHausse_annee();
      double hausse_YlangRecolte_annee = statYlangRecolte.getHausse_annee();
      double hausse_GeraniumRecolte_annee = statGeraniumRecolte.getHausse_annee();
      
    %>
    
        <!-- BREADCRUMB AREA START -->
        <div class="ltn__breadcrumb-area ltn__breadcrumb-area-4 bg-overlay-theme-10--- bg-image" data-bg="img/bg/4.png"
            style="background-image: url(&quot;img/bg/4.png&quot;);">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
                            <div class="section-title-area">
                                <h1 class="section-title white-color">Statistique culture</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
                                      <input type="hidden" id="annee" name="annee" oninput="validateNumberInput(this)" maxlength="4">                                       
                                      
        <!-- BREADCRUMB AREA END -->
        <!-- modifier/supprimer assets/dashboard/js/app.js ra hanova anle chart -->
        <div class="row justify-content-center" style="height: max-content;">
            <div class="col-10" style="margin-bottom: 10vh;">
                <div class="row">
                    <div class="col-md-6 mb-4">
                        <div class="card shadow">
                          <div class="card-header">
                            <strong class="card-title mb-0">Statistique : Total plante par mois</strong>
                          </div>
                          <div class="chart">
                            <canvas id="chart-line" class="chart-canvas" height="300"></canvas>
                          </div>
                        </div> <!-- /.card -->
                      </div>
                      <div class="col-md-6 mb-4">
                        <div class="card shadow">
                          <div class="card-header">
                            <strong class="card-title mb-0">Statistique : Total recolte par mois</strong>
                          </div>
                          <div class="chart">
                            <canvas id="chart-line2" class="chart-canvas" height="300"></canvas>
                          </div>
                        </div> <!-- /.card -->
                      </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center" style="height: max-content;">
          <div class="col-md-5 my-4" style="margin-bottom: 10vh;">
            <div class="card shadow">
              <div class="card-body">
                <div class="row align-items-center">
                  <div class="col" style="height: 100%;">
                    <strong class="card-title" style="font-size: x-small;">Ylang Ylang plante par rapport mois precedent</strong>
                    <p class="small mb-0"><span class="<%= StatistiqueCulture.getIcon(hausse_YlangPlante_mois) %>"></span><span> <%= statYlangPlante.getHausse_mois_String() %>%</span></p>
                  </div>
                  <!-- ----------------------------- -->
                  <div class="col-4 text-right">
                    <span class="sparkline inlineline"><canvas width="45" height="32" style="display: inline-block; width: 45.6719px; height: 32px; vertical-align: top;"></canvas></span>
                  </div>
                </div> <!-- /. row -->
              </div> <!-- /. card-body -->
            </div> <!-- /. card -->
          </div> <!-- /. col -->
          <div class="col-md-5 my-4" style="margin-bottom: 10vh;">
            <div class="card shadow">
              <div class="card-body">
                <div class="row align-items-center">
                  <div class="col" style="height: 100%;">
                    <strong class="card-title" style="font-size: x-small;">Geranium plante par rapport mois precedent</strong>
                    <p class="small mb-0"><span class="<%= StatistiqueCulture.getIcon(hausse_GeraniumPlante_mois) %>"></span><span> <%= statGeraniumPlante.getHausse_mois_String() %>%</span></p>
                  </div>
                  <div class="col-4 text-right">
                    <span class="sparkline inlineline"><canvas width="45" height="32" style="display: inline-block; width: 45.6719px; height: 32px; vertical-align: top;"></canvas></span>
                  </div>
                </div> <!-- /. row -->
              </div> <!-- /. card-body -->
            </div> <!-- /. card -->
          </div> <!-- /. col -->
          <!-- ------------------------------------------------- -->
          <div class="col-md-5 my-4" style="margin-bottom: 10vh;">
            <div class="card shadow">
              <div class="card-body">
                <div class="row align-items-center">
                  <div class="col" style="height: 100%;">
                    <strong class="card-title" style="font-size: x-small;">Ylang Ylang plante par rapport annee precedente</strong>
                    <p class="small mb-0"><span class="<%= StatistiqueCulture.getIcon(hausse_YlangPlante_annee) %>"></span><span> <%= statYlangPlante.getHausse_annee_String() %>%</span></p>
                  </div>
                  <div class="col-4 text-right">
                    <span class="sparkline inlineline"><canvas width="45" height="32" style="display: inline-block; width: 45.6719px; height: 32px; vertical-align: top;"></canvas></span>
                  </div>
                </div> <!-- /. row -->
              </div> <!-- /. card-body -->
            </div> <!-- /. card -->
          </div> <!-- /. col -->
          <div class="col-md-5 my-4" style="margin-bottom: 10vh;">
            <div class="card shadow">
              <div class="card-body">
                <div class="row align-items-center">
                  <div class="col" style="height: 100%;">
                    <strong class="card-title" style="font-size: x-small;">Geranium plante par rapport annee precedent</strong>
                    <p class="small mb-0"><span class="<%= StatistiqueCulture.getIcon(hausse_GeraniumPlante_annee) %>"></span><span> <%= statGeraniumPlante.getHausse_annee_String() %>%</span></p>
                  </div>
                  <div class="col-4 text-right">
                    <span class="sparkline inlineline"><canvas width="45" height="32" style="display: inline-block; width: 45.6719px; height: 32px; vertical-align: top;"></canvas></span>
                  </div>
                </div> <!-- /. row -->
              </div> <!-- /. card-body -->
            </div> <!-- /. card -->
          </div> <!-- /. col -->
          <!-- --------------------------------------------------------------- -->
          <div class="col-md-5 my-4" style="margin-bottom: 10vh;">
            <div class="card shadow">
              <div class="card-body">
                <div class="row align-items-center">
                  <div class="col" style="height: 100%;">
                    <strong class="card-title" style="font-size: x-small;">Ylang Ylang recolte par rapport mois precedent</strong>
                    <p class="small mb-0"><span class="<%= StatistiqueCulture.getIcon(hausse_YlangRecolte_mois) %>"></span><span>  <%= statYlangRecolte.getHausse_mois_String() %>%</span></p>
                  </div>
                  <div class="col-4 text-right">
                    <span class="sparkline inlineline"><canvas width="45" height="32" style="display: inline-block; width: 45.6719px; height: 32px; vertical-align: top;"></canvas></span>
                  </div>
                </div> <!-- /. row -->
              </div> <!-- /. card-body -->
            </div> <!-- /. card -->
          </div> <!-- /. col -->
          <div class="col-md-5 my-4" style="margin-bottom: 10vh;">
            <div class="card shadow">
              <div class="card-body">
                <div class="row align-items-center">
                  <div class="col" style="height: 100%;">
                    <strong class="card-title" style="font-size: x-small;">Geranium recolte par rapport mois precedent</strong>
                    <p class="small mb-0"><span class="<%= StatistiqueCulture.getIcon(hausse_GeraniumRecolte_mois) %>"></span><span> <%= statGeraniumRecolte.getHausse_mois_String() %>%</span></p>
                  </div>
                  <div class="col-4 text-right">
                    <span class="sparkline inlineline"><canvas width="45" height="32" style="display: inline-block; width: 45.6719px; height: 32px; vertical-align: top;"></canvas></span>
                  </div>
                </div> <!-- /. row -->
              </div> <!-- /. card-body -->
            </div> <!-- /. card -->
          </div> <!-- /. col -->
          <!-- ----------------------------------------------------------------- -->
          <div class="col-md-5 my-4" style="margin-bottom: 10vh;">
            <div class="card shadow">
              <div class="card-body">
                <div class="row align-items-center">
                  <div class="col" style="height: 100%;">
                    <strong class="card-title" style="font-size: x-small;">Ylang Ylang recolte par rapport annee precedente</strong>
                    <p class="small mb-0"><span class="<%= StatistiqueCulture.getIcon(hausse_YlangRecolte_annee) %>"></span><span> <%= statYlangRecolte.getHausse_annee_String() %>%</span></p>
                  </div>
                  <div class="col-4 text-right">
                    <span class="sparkline inlineline"><canvas width="45" height="32" style="display: inline-block; width: 45.6719px; height: 32px; vertical-align: top;"></canvas></span>
                  </div>
                </div> <!-- /. row -->
              </div> <!-- /. card-body -->
            </div> <!-- /. card -->
          </div> <!-- /. col -->
          <div class="col-md-5 my-4" style="margin-bottom: 10vh;">
            <div class="card shadow">
              <div class="card-body">
                <div class="row align-items-center">
                  <div class="col" style="height: 100%;">
                    <strong class="card-title" style="font-size: x-small;">Geranium recolte par rapport annee precedent</strong>
                    <p class="small mb-0"><span class="<%= StatistiqueCulture.getIcon(hausse_GeraniumRecolte_annee) %>"></span><span> <%= statGeraniumRecolte.getHausse_annee_String() %>%</span></p>
                  </div>
                  <div class="col-4 text-right">
                    <span class="sparkline inlineline"><canvas width="45" height="32" style="display: inline-block; width: 45.6719px; height: 32px; vertical-align: top;"></canvas></span>
                  </div>
                </div> <!-- /. row -->
              </div> <!-- /. card-body -->
            </div> <!-- /. card -->
          </div> <!-- /. col -->
        </div>
        

        <%@ include file="footer.jsp" %>
        <script>
          function validateNumberInput(input) {
            // Remplacer les caractères non numériques par une chaîne vide
            input.value = input.value.replace(/[^0-9]/g, '');
          }
          var inputAnnee = document.getElementById("annee");
        var anneeActuelle = new Date().getFullYear();
        
        inputAnnee.min = 2022;
        inputAnnee.max = anneeActuelle;
          function obtenirMoisDeLAnnee() {
            const mois = [
              "Janvier",
              "Fevrier",
              "Mars",
              "Avril",
              "Mai",
              "Juin",
              "Juillet",
              "Aout",
              "Septembre",
              "Octobre",
              "Novembre",
              "Decembre"
            ];
          
            return mois;
          }
          
          // Exemple d'utilisation
          const moisDeLAnnee = obtenirMoisDeLAnnee();
          config = {
            type:"line",
            data:{
                labels: moisDeLAnnee,
                datasets:[
                    {
                        label:"Ylang Ylang plante",
                        fill:false,
                        backgroundColor:"#6BFBCE",
                        borderColor: "#6BFBCE",
                        data: <%= statYlangPlante.get_total_plante_mois_annee_string() %>
                    },
                    {
                        label:"Geranium plante",
                        fill:false,
                        backgroundColor:"black",
                        borderColor: "black",
                        data: <%= statGeraniumPlante.get_total_plante_mois_annee_string() %>

                    }
                ]
            },
            options:{
                scales: {
                    xAxes:[
                        {
                            scaleLabel: {
                                display:true,
                                labelString:"Mois"
                            }
                        }
                    ],
                    yAxes:[
                        {
                            scaleLabel: {
                                display:true,
                                labelString:"Gain"
                            }
                        }
                    ]
                }
            }
        };
        
        //context
        var canva=document.getElementById("chart-line");
        canva.width=500;
        canva.height=300;
        ctx=canva.getContext('2d');   
        //creation du graphique
        var chart = new Chart(ctx,config);
        chart.options.scales.yAxes[0].ticks.userCallback = function(value) {
        return Number(value).toLocaleString();
        };
        
        chart.update();
        
        config2 = {
          type:"line",
          data:{
              labels: moisDeLAnnee,
              datasets:[
                  {
                      label:"Ylang Ylang recolte",
                      fill:false,
                      backgroundColor:"#6BFBCE",
                      borderColor: "#6BFBCE",
                      data: <%= statYlangRecolte.get_total_recolte_mois_annee_string() %>
                  }
                  ,
                    {
                        label:"Geranium recolte",
                        fill:false,
                        backgroundColor:"black",
                        borderColor: "black",
                        data: <%= statGeraniumRecolte.get_total_recolte_mois_annee_string() %>
                    }
              ]
          },
          options:{
              scales: {
                  xAxes:[
                      {
                          scaleLabel: {
                              display:true,
                              labelString:"Mois"
                          }
                      }
                  ],
                  yAxes:[
                      {
                          scaleLabel: {
                              display:true,
                              labelString:"Gain"
                          }
                      }
                  ]
              }
          }
        };
        
        //context
        var canva2=document.getElementById("chart-line2");
        canva2.width=500;
        canva2.height=300;
        ctx2=canva2.getContext('2d');   
        //creation du graphique
        var chart2 = new Chart(ctx2,config2);
        chart2.options.scales.yAxes[0].ticks.userCallback = function(value) {
        return Number(value).toLocaleString();
        };
        
        chart2.update();
        </script>
