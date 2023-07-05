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
                                <h1 class="section-title white-color">Liste transactions</h1>
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
                                <div class="ltn__checkout-single-content-info">
                                    <form action="#">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h6>Liste des transactions du</h6>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="input-item input-item-date">
                                                    <input type="date" name="dateDebut" placeholder="dateDebut" required>
                                                </div>
                                            </div>
                                            <div class="col-md-1" style="display: flex; flex-direction:row; justify-content:space-around;">
                                                <center style="transform:translateY(20%);">au</center>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="input-item input-item-date">
                                                    <input type="date" name="dateFin" placeholder="dateFin" required>
                                                </div>
                                            </div>
                                            <div class="col-md-4" style="height: fit-content;">
                                                <div class="btn-wrapper">
                                                    <button type="submit"
                                                        class="theme-btn-3 btn btn-effect-4 text-uppercase" style=" transform: translateY(-70%);">Valider</button>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
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
                                                            <% for(int i = 0; i < 50; i++){ %>
                                                                <tr>
                                                                    <th>Transaction societe X</th>
                                                                    <th>30 / 05 /2023</th>
                                                                    <th>200 000</th>
                                                                    <th>0</th>
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