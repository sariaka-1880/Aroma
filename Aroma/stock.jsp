<%@ include file="header.jsp" %>
    <%@ include file="menu.jsp" %>
    <%@ page import = "assets.Stock" %>
    <%@ page import = "java.util.Vector" %>
    <% 
        Vector<Stock> listStock = (Vector)request.getAttribute("liste_stock");
    
    %>
        <!-- BREADCRUMB AREA START -->
        <div class="ltn__breadcrumb-area ltn__breadcrumb-area-4 bg-overlay-theme-10--- bg-image" data-bg="img/bg/4.png"
            style="background-image: url(&quot;img/bg/4.png&quot;);">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
                            <div class="section-title-area">
                                <h1 class="section-title white-color">Stock</h1>
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
                                <h4 class="title-2">Stock</h4>
                                <div class="ltn__checkout-single-content-info">
                                    <div class="col-md-6">
                                        <h6>Ressource</h6>
                                        <div class="input-item">
                                            <select class="nice-select" style="display: none;">
                                                <option>Selectionnez une ressource</option>
                                                <option value="1">nom 1</option>
                                                <option value="2">nom 2</option>
                                                <option value="3">nom 3</option>
                                            </select>
                                        </div>
                                    </div>
                                <table class="styled-table" 1px border>
                                    <thead>
                                        <tr>
                                            <th>Nom</th>
                                            <th>Quantit&eacute; Restante</th>
                                            <th>Unit&eacute;</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  
                                            for(Stock stock : listStock){
                                            %>
                                                <tr>
                                                    <td><% out.print(stock.getProduit().getNom()); %></td>
                                                    <td><% out.print(stock.getQuantite()); %></td>
                                                    <td><% out.print(stock.getProduit().getUnite().getNom()); %></td>
                                                </tr>
                                            <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="feature.jsp" %>

        <%@ include file="footer.jsp" %>
<style>
    .styled-table {
        border-collapse: collapse;
        margin: 25px 0;
        font-size: 0.9em;
        font-family: sans-serif;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        min-width: 1000px;
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