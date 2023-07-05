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
                                <h1 class="section-title white-color">Liste cr&eacute;ance</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMB AREA END -->

        <!-- LOGIN AREA START (Register) -->
        <div class="ltn__checkout-area mb-120">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__checkout-inner">
                            <div class="ltn__checkout-single-content mt-50">
                                <h4 class="title-2">Liste cr&eacute;ance</h4>
                                <div class="col-md-12">
                                    <div class="ltn__checkout-single-content" style="height: 40vh; overflow-y: scroll;">
                                        <table class="styled-table" 1px border>
                                        <thead>
                                            <tr>
                                                <th>Type</th>
                                                <th>Entit&eacute;</th>
                                                <th>Montant</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for(int i = 0; i < 50; i++){ %>
                                            <tr>
                                                <th>Redistribution</th>
                                                <th>Jean Paul</th>
                                                <th>200 000</th>
                                                <th class="colonnehafakely"><button onclick="showPopup('<% out.print(i);%>')">D&eacute;tails</button></th>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                        </table>
                                        </div>
                                        <div id="popup" class="popup">
                                            <span class="close" onclick="closePopup()">&times;</span>
                                            <h3>D&eacute;tails de la transaction</h3>
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
                background-color: #344648;
                color: #ffffff;
                text-align: left;
              }
              .styled-table th,
              .styled-table td {
                padding: 12px 15px;
              }
              .colonnehafakely {
                width: 250px;
              }
              .styled-table th button {
                margin-left: 50px;
                background: #ffb400;
                color: #ffffff;
                font-size: 0.9em;
                font-family: sans-serif;
                width: 120px;
                height: 35px;
                border-radius: 10px;
              }
              .styled-table tbody tr {
                border-bottom: 1px solid #dddddd;
              }
              .popup {
                display: none;
                position: fixed;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                background-color: #fefefe;
                border: 1px solid #888;
                border-radius: 10px;
                padding: 16px;
                z-index: 9999;
                }
                
                .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
                }
                
                .close:hover {
                color: #000;
                }
        </style>
        <script>
        function showPopup(indice) {
            var popup = document.getElementById('popup');
            popup.style.display = 'block';
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "/vola/liste_creance", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var response = xhr.responseText;
                alert("Réponse du serveur : " + response);
            }
            };
            xhr.send("indice=" + encodeURIComponent(indice));
        }
        
        function closePopup() {
            var popup = document.getElementById('popup');
            popup.style.display = 'none';
        }
        </script>
        <%@ include file="feature.jsp" %>

        <%@ include file="footer.jsp" %>
