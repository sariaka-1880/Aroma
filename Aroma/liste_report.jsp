<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.TextStyle" %>
<%@ page import="java.util.Locale, assets.Report" %>
<style type="text/css">
/* .paging-nav {
  text-align: right;
  padding-top: 10px;
  margin-bottom: 25px;
}

.paging-nav a {
  margin: auto 1px;
  text-decoration: none;
  display: inline-block;
  padding: 1px 7px;
  background: #ffbd1f;
  color: white;
  border-radius: 3px;
  width: 40px;
  height: 30px;
}

.paging-nav .selected-page {
  background: #ffbd1f;
  font-weight: bold;
} */
</style>
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
                                <h1 class="section-title white-color">Liste report</h1>
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
                                <h4 class="title-2">Liste report</h4>
                                <div class="ltn__checkout-single-content-info">
                                    <h6>Recherche par mois/ann&eacute;e</h6>
                                    
                                    <form action="/Aroma/listereport" method="post">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="input-item">
                                                    <select name="mois_recherche" class="nice-select">
                                                        <% 
                                                        LocalDate currentDate = LocalDate.now();
                                                        Locale locale = Locale.FRENCH; // Utilisation de la locale française
                                                        for (int i = 1; i <= 12; i++) { 
                                                            String mois = currentDate.withMonth(i).getMonth().getDisplayName(TextStyle.FULL, locale);
                                                            %>
                                                            <option value="<%= i %>"><%= mois %></option>
                                                            <%
                                                        }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-item input-item-website ltn__custom-icon">
                                                    <input type="text" name="annee_recherche" placeholder="Quantite ajoutee" value="2023" required>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <input type="submit" class="theme-btn-3 btn btn-effect-4 text-uppercase" value="Rechercher">
                                            </div>
                                    </form>
                                    <% Report[] reports=(Report[])request.getAttribute("reports"); %>
                                            </div class="col-md-12">
                                                <table id="tableData" class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>Num&eacute;ro report</th>
                                                            <th>Date</th>
                                                            <th>Montant</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <% for(Report r:reports){ %>
                                                        <tr>
                                                            <td><%= r.getId() %></td>
                                                            <td><%= r.getDateString() %></td>
                                                            <td><%= r.getValeur() %></td>
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
        <%@ include file="feature.jsp" %>

        <%@ include file="footer.jsp" %>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="<% out.print(request.getAttribute("baseUrl")); %>/assets/js/paging.js"></script> 
<script type="text/javascript">
    $(document).ready(function() {
        $('#tableData').paging({limit:5});
    });
</script>
<script type="text/javascript">