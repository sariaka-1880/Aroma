<%@page import="assets.RechercheTransaction, assets.Transaction, assets.Report, java.time.LocalDate, java.time.LocalTime" %>
<%@ include file="header.jsp" %>

    <%@ include file="menu.jsp" %>

        <!-- BREADCRUMB AREA START -->
        <div class="ltn__breadcrumb-area ltn__breadcrumb-area-4 bg-overlay-theme-10--- bg-image" data-bg="img/bg/4.png"
            style="background-image: url(&quot;img/bg/4.png&quot;);">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
                            <div class="section-title-area">
                                <h1 class="section-title white-color">Ajout report</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMB AREA END -->

        <!-- LOGIN AREA START (Register) -->
        <div class="ltn__checkout-area mb-120">
            <div class="container w-fill">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__checkout-inner">
                            <div class="ltn__checkout-single-content mt-50">
                                <% LocalDate dateactuelle=(LocalDate)request.getAttribute("dateactuel");
                                LocalTime heureactuelle=(LocalTime)request.getAttribute("heureactuel"); %>
                                <h4 class="title-2">Ajoutez un report</h4>
                                <h4 class="title-2">Ajourd'hui le <%= dateactuelle.toString() %> - <%= heureactuelle.toString() %></h4>
                                <div class="ltn__checkout-single-content-info">
                                    <form action="/Aroma/ajoutreport" method="post">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h6>Montant actuel dans la caisse</h6>
                                                <div class="input-item input-item-website ltn__custom-icon">
                                                    <input type="text" name="montant" placeholder="montant ajoutee"
                                                        value="2000000" required>
                                                </div>
                                            </div>
                                            <div class="col-md-4"></div>
                                            <div class="col-md-4" style="height: fit-content;">
                                                <div class="btn-wrapper">
                                                    <button type="submit"
                                                        class="theme-btn-3 btn btn-effect-4 text-uppercase" style=" transform: translateY(-70%);">Valider</button>
                                                </div>
                                            </div>
                                            <div class="col-md-8"></div>
                                            <div class="col-md-12"></div>
                                            <% Report dernier=(Report)request.getAttribute("dernier"); %>
                                            <div class="col-md-12">
                                                <p>Date du dernier report : <h6><%= dernier.getDateString() %></h6></p>
                                                <p>Montant du dernier report : <h6><%= dernier.getValeur() %> Ar</h6></p>
                                            </div>
                                            <div class="col-md-12">
                                                <h6>HIstorique des transactions depuis le dernier report</h6>
                                                <% RechercheTransaction rechercheTransact=(RechercheTransaction)request.getAttribute("recherche"); %>
                                                <div class="ltn__checkout-single-content" style="height: 40vh; overflow-y: scroll;">
                                                    <table class="styled-table" 1px border>
                                                        <thead>
                                                            <tr>
                                                                <th>Description</th>
                                                                <th>Date</th>
                                                                <th>Entr&eacute;e</th>
                                                                <th>Sortie</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <% for(Transaction t:rechercheTransact.getListe()){ %>
                                                                <tr>
                                                                    <th><%= t.getDescription() %></th>
                                                                    <th><%= t.getDateString() %></th>
                                                                    <th><%= t.getEntree() %></th>
                                                                    <th><%= t.getSortie() %></th>
                                                                </tr>
                                                                <% } %>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style>
            .styled-table {
                border-collapse: collapse;
                margin: 25px 0;
                font-size: 0.9em;
                font-family: sans-serif;
                /* box-shadow: 0 0 20px rgba(0, 0, 0, 0.15); */
                min-width: 100%;
                /* height: 40vh; */
              }
              .styled-table thead tr {
                background-color: #ecbd99;
                color: #ffffff;
                text-align: left;
              }
              .styled-table th,
              .styled-table td {
                  padding: 12px 15px;
              }
              .styled-table tbody tr {
                border-bottom: 1px solid #dddddd;
              }
        </style>
        <%@ include file="feature.jsp" %>

            <%@ include file="footer.jsp" %>