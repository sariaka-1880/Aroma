<%@ include file="header.jsp" %>

    <%@ include file="menu.jsp" %>
        <style>
        *
        {
            border: 0;
            box-sizing: content-box;
            color: black;
            font-family: inherit;
            font-size: inherit;
            font-style: inherit;
            font-weight: inherit;
            line-height: inherit;
            list-style: none;
            margin: 0;
            padding: 0;
            text-decoration: none;
            vertical-align: top;
        }

        /* content editable */

        *[contenteditable] { border-radius: 0.25em; min-width: 1em; outline: 0; }

        *[contenteditable] { cursor: pointer; }

        *[contenteditable]:hover, *[contenteditable]:focus, td:hover *[contenteditable], td:focus *[contenteditable], img.hover { background: #DEF; box-shadow: 0 0 1em 0.5em #DEF; }

        span[contenteditable] { display: inline-block; }

        /* heading */

        h1 { font: bold 100% sans-serif; letter-spacing: 0.5em; text-align: center; text-transform: uppercase; }

        table { font-size: 75%; table-layout: fixed; width: 100%; }
        table { border-collapse: separate; border-spacing: 2px; }
        th, td { border-width: 1px; padding: 0.5em; position: relative; text-align: left; }
        th, td { border-radius: 0.25em; border-style: solid; }


        /* table meta & balance */

        table.meta, table.balance { float: right; width: 36%; }
        table.meta:after, table.balance:after { clear: both; content: ""; display: table; }

        /* table meta */

        table.meta th { width: 40%; }
        table.meta td { width: 60%; }

        /* table items */

        table.inventory { clear: both; width: 100%; }
        table.inventory th { font-weight: bold; text-align: center; }

        table.inventory td:nth-child(1) { width: 26%; }
        table.inventory td:nth-child(2) { width: 38%; }
        table.inventory td:nth-child(3) { text-align: right; width: 12%; }
        table.inventory td:nth-child(4) { text-align: right; width: 12%; }
        table.inventory td:nth-child(5) { text-align: right; width: 12%; }

        /* table balance */

        table.balance th, table.balance td { width: 50%; }
        table.balance td { text-align: right; }

        header h1 {
            background: #000;
            border-radius: 0.25em;
            color: #FFF;
            margin: 0 0 1em;
            padding: 0.5em 0;
        }
        </style>
        <!-- BREADCRUMB AREA START -->
        <div class="ltn__breadcrumb-area ltn__breadcrumb-area-4 bg-overlay-theme-10--- bg-image" data-bg="img/bg/4.png"
            style="background-image: url(&quot;img/bg/4.png&quot;);">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
                            <div class="section-title-area">
                                <h1 class="section-title white-color">Facture</h1>
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
                                <div class="col-md-12">
                                    <header>
                                        <h1>Facture</h1>
                                        <address contenteditable>
                                            <p>Aroma</p>
                                            <p>ITU Andoharanofotsy<br>Aroma Andoharanofotsy</p>
                                            <p>034 00 000 00</p>
                                        </address>
                                    </header>
                                    <article>
                                        <h1>Contenu</h1>
                                        <address contenteditable>
                                            <p>Nom Client<br>034 18 548 43</p>
                                        </address>
                                        <table class="meta">
                                            <tr>
                                                <th><span contenteditable>Facture n :</span></th>
                                                <td><span contenteditable>0001</span></td>
                                            </tr>
                                            <tr>
                                                <th><span contenteditable>Date</span></th>
                                                <td><span contenteditable>16 Juin 2023</span></td>
                                            </tr>
                                        </table>
                                        <table class="inventory">
                                            <thead>
                                                <tr>
                                                    <th><span contenteditable>Designation</span></th>
                                                    <th><span contenteditable>Quantit&eacute;</span></th>
                                                    <th><span contenteditable>Unit&eacute;</span></th>
                                                    <th><span contenteditable>Prix Unitaire</span></th>
                                                    <th><span contenteditable>Remise</span></th>
                                                    <th><span contenteditable>Total</span></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><span contenteditable>Parfum ylang ylang</span></td>
                                                    <td><span contenteditable>2</span></td>
                                                    <td><span contenteditable>4</span></td>
                                                    <td><span data-prefix>Ariary</span><span contenteditable>10000.00</span></td>
                                                    <td><span contenteditable>0</span></td>
                                                    <td><span data-prefix>Ariary</span><span>1000.00</span></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <a class="add">+</a>
                                        <table class="balance">
                                            <tr>
                                                <th><span contenteditable>Total HT</span></th>
                                                <td><span data-prefix>Ariary</span><span>10000.00</span></td>
                                            </tr>
                                            <tr>
                                                <th><span contenteditable>Remise</span></th>
                                                <td><span data-prefix>Ariary</span><span contenteditable>0.00</span></td>
                                            </tr>
                                            <tr>
                                                <th><span contenteditable>Total</span></th>
                                                <td><span data-prefix>Ariary</span><span>10000.00</span></td>
                                            </tr>
                                        </table>
                                    </article>
                                    <aside>
                                        <h1><span contenteditable>Additional Notes</span></h1>
                                        <div contenteditable>
                                            <p>Arret&eacute; a la somme de dix mille Ariary</p>
                                            <p>Signature</p>
                                        </div>
                                        <div class="btn-wrapper">
                                            <button type="submit" class="theme-btn-3 btn btn-effect-4 text-uppercase"><a href="/Aroma/vente/creation_facture">T&eacute;l&eacute;charger en PDF</a></button>
                                        </div>
                                    </aside>
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
