<%@ include file="header.jsp" %>
  <%@ page import = "assets.produit.ProduitFini" %>  
    <%@ page import = "assets.StatistiqueFinance" %>  

  <%@ page contentType="text/html; charset=UTF-8" %>
  <%@ include file="menu.jsp" %>
    <%
      StatistiqueFinance st = (StatistiqueFinance) request.getAttribute("stat_finance");  
      ProduitFini[] l_p = (ProduitFini[]) request.getAttribute("production_par_entrepot");
      String json_production = (String) request.getAttribute("stat_json_production");
    %>
    <%-- <%= json_production  %> --%>
    <!-- BREADCRUMB AREA START -->
    <div class="ltn__breadcrumb-area ltn__breadcrumb-area-4 bg-overlay-theme-10--- bg-image" data-bg="img/bg/4.png"
      style="background-image: url(&quot;img/bg/4.png&quot;);">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
              <div class="section-title-area">
                <h1 class="section-title white-color">Statistiques de la finance et de la production</h1>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- BREADCRUMB AREA END -->
    <!-- modifier/supprimer assets/dashboard/js/app.js ra hanova anle chart -->
    <div class="row justify-content-center" style="height: max-content;">
      <div class="col-10" style="margin-bottom: 10vh;">
        <div class="row">
          <div class="col-md-6 mb-4">
            <div class="col-md-12 mb-4">
              <div class="card shadow">
                <div class="card-header">
                  <strong class="card-title mb-0">Bénéfice par mois de cette année </strong>
                </div>
                <div class="chart">
                  <canvas  id="benefice_mois" class="chart-canvas" height="300"></canvas>
                </div>
              </div> <!-- /.card -->
            </div>
            <div class="col-md-12 mb-4">
              <div class="card shadow">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col">
                      <strong class="card-title">Evolution du bénéfice</strong>
                      <p class="small mb-0"><span class="fa fa-12 <%out.print(st.getIcone());%> <% out.print(st.getCssClass());%>"></span><span> <%out.print(st.getEvolutionPourcentage());%>% par
                          rapport au dernier mois</span></p>
                    </div>
                  </div> <!-- /. row -->
                </div> <!-- /. card-body -->
              </div> <!-- /. card -->
            </div>
            <div class="col-md-12 mb-4">
              <div class="card shadow">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col">
                      <strong class="card-title">Etat de caisse actuel : <%out.print(st.getCaisse().getValeurFormatted());%> Ariary</strong>
                    </div>
                  </div> <!-- /. row -->
                </div> <!-- /. card-body -->
              </div> <!-- /. card -->
            </div>
            <div class="col-md-12 mb-4 mt-4">
                  <div class="card shadow">
                    <div class="card-header">
                      <strong class="card-title mb-0">Hausse de production huile essentielle</strong>
                    </div>
                    <div class="chart">
                      <canvas id="chart-line3" class="chart-canvas" height="300"></canvas>
                    </div>
                  </div> <!-- /.card -->
              </div>
          </div>
          <div class="col-md-6 mb-4">
            <div class="row">
            <div class="col-md-12 mb-2">

              <div class="card shadow" style="width: 100%;">
                <div class="card-header">
                  <strong class="card-title mb-0">Rendement des produits finis par jour</strong>
                </div>
                <div class="col-md-12 mb-4 mt-4">
                  <% for(int i=0; i < l_p.length; i++) { %>
                    <div class="card shadow mt-4 mb-4">
                      <div class="card-body">
                        <div class="row align-items-center">
                          <div class="col">
                            <strong class="card-title"
                              style="display: flex; flex-direction:row; justify-content:space-between;"><span><%= l_p[i].getNom() %></span><span><%= l_p[i].getRendementString() %></span></strong>
                          </div>
                        </div> <!-- /. row -->
                      </div> <!-- /. card-body -->
                    </div> <!-- /. card -->
                    <% } %>
                </div>
              </div> <!-- /.card -->
                <div class="col-md-12 mb-4 mt-4">
                      <div class="card shadow">
                        <div class="card-header">
                          <strong class="card-title mb-0">Hausse de production parfum</strong>
                        </div>
                        <div class="chart">
                          <canvas id="chart-line2" class="chart-canvas" height="300"></canvas>
                        </div>
                      </div> <!-- /.card -->
                    </div>
                </div>
                
          </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <%@ include file="footer.jsp" %>
      <script>
        var stat = <%= json_production %>;
        console.log( "stat : "+stat );
        let huile_ylang_ylang = stat.find(function(element) {
          return element.nom === "Huile essentielle d\u0027Ylang-ylang";
        });
        let huile_geranium = stat.find(function(element) {
          return element.nom === "Huile essentielle de Geranium";
        });
        let parfum_ylang_ylang = stat.find(function(element) {
          return element.nom === "Parfum d\u0027Ylang-ylang";
        });
        let parfum_geranium = stat.find(function(element) {
          return element.nom === "Parfum de Geranium";
        });
        function listeStat( obj ){
            // Tableau des noms de mois dans l'ordre
            var moisOrdre = [
              "Janvier", "FÃ©vrier", "Mars", "Avril", "Mai", "Juin",
              "Juillet", "AoÃ»t", "Septembre", "Octobre", "Novembre", "DÃ©cembre"
            ];

            // Récupérer les valeurs de rendement_mois dans l'ordre des mois
            var rendementListe = moisOrdre.map(function(mois) {
              return obj[mois].rendement_mois;
            });
            return rendementListe;
        }
        // let obj =  parfum_geranium.statistique;

        // function validateNumberInput(input) {
        //   // Remplacer les caractères non numériques par une chaîne vide
        //   input.value = input.value.replace(/[^0-9]/g, '');
        // }
        // var inputAnnee = document.getElementById("annee");
        var anneeActuelle = new Date().getFullYear();

        // inputAnnee.min = 2022;
        // inputAnnee.max = anneeActuelle;
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
          type: "line",
          data: {
            labels: moisDeLAnnee,
            datasets: [
              {
                label: "Bénéfice",
                fill: false,
                backgroundColor: "#6BFBCE",
                borderColor: "#6BFBCE",
                data: <% out.print(st.getBeneficeString());%>
              }
            ]
          },
          options: {
            scales: {
              xAxes: [
                {
                  scaleLabel: {
                    display: true,
                    labelString: "Mois"
                  }
                }
              ],
              yAxes: [
                {
                  scaleLabel: {
                    display: true,
                    labelString: "Bénéfice en Ariary "
                  }
                }
              ]
            }
          }
        };

        //context
        var canva = document.getElementById("benefice_mois");
        canva.width = 500;
        canva.height = 300;
        ctx = canva.getContext('2d');
        //creation du graphique
        chart = new Chart(ctx, config);
        chart.options.scales.yAxes[0].ticks.userCallback = function (value) {
          return Number(value).toLocaleString();
        };

        // chart.update();
        config2 = {
          type: "line",
          data: {
            labels: moisDeLAnnee,
            datasets: [
              {
                      label:"Geranium",
                      fill:false,
                      backgroundColor:"#6BFBCE",
                      borderColor: "#6BFBCE",
                      data: listeStat( parfum_geranium.statistique )
                  }
                  ,
                    {
                        label:"Ylang Ylang",
                        fill:false,
                        backgroundColor:"black",
                        borderColor: "black",
                        data: listeStat( parfum_ylang_ylang.statistique )
              }
            ]
          },
          options: {
            scales: {
              xAxes: [
                {
                  scaleLabel: {
                    display: true,
                    labelString: "Mois"
                  }
                }
              ],
              yAxes: [
                {
                  scaleLabel: {
                    display: true,
                    labelString: "Gain"
                  }
                }
              ]
            }
          }
        };

        //context
        var canva2 = document.getElementById("chart-line2");
        canva2.width = 500;
        canva2.height = 300;
        ctx2 = canva2.getContext('2d');
        //creation du graphique
        chart2 = new Chart(ctx2, config2);
        chart2.options.scales.yAxes[0].ticks.userCallback = function (value) {
          return Number(value).toLocaleString();
        };

        chart2.update();

        // chart.update();
        config3 = {
          type: "line",
          data: {
            labels: moisDeLAnnee,
            datasets: [
              {
                      label:"Ylang Ylang",
                      fill:false,
                      backgroundColor:"#6BFBCE",
                      borderColor: "#6BFBCE",
                      data: listeStat( huile_ylang_ylang.statistique )
                  }
                  ,
                    {
                        label:"Genarium",
                        fill:false,
                        backgroundColor:"black",
                        borderColor: "black",
                        data: listeStat( huile_geranium.statistique )
              }
            ]
          },
          options: {
            scales: {
              xAxes: [
                {
                  scaleLabel: {
                    display: true,
                    labelString: "Mois"
                  }
                }
              ],
              yAxes: [
                {
                  scaleLabel: {
                    display: true,
                    labelString: "Gain"
                  }
                }
              ]
            }
          }
        };

        //context
        var canva3 = document.getElementById("chart-line3");
        canva3.width = 500;
        canva3.height = 300;
        ctx3 = canva3.getContext('2d');
        //creation du graphique
        chart3 = new Chart(ctx3, config3);
        chart3.options.scales.yAxes[0].ticks.userCallback = function (value) {
          return Number(value).toLocaleString();
        };

        chart3.update();
      </script>