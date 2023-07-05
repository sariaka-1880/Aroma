<%@page import="assets.Ressource"%>
<%@page import="assets.Fournisseur"%>

<%@page import="assets.ProduitIntermediaire"%>
<%@page import="java.util.ArrayList"%>

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
                                <h1 class="section-title white-color">Plantation</h1>
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
                                <h4 class="title-2">Plantation</h4>
                                <div class="ltn__checkout-single-content-info">
                                    <form action="/Aroma/ajoutplantation" method="Get">
                                        <% if (request.getAttribute("error") != null) { %>
                                            <p><%= (request.getAttribute("error")) %></p>
                                        <% } %>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h6>Produit Intermediaire</h6>
                                                <div class="input-item">
                                                    <select class="nice-select" style="display: block;" name="produitIntermediaire">
                                                        <option>Selectionnez un Produit Intermediaire</option>
                                                        <% ArrayList<ProduitIntermediaire> allProduitIntermediriare= (ArrayList) request.getAttribute("produitIntermediaires"); %>
                                                            <% for (int i=0 ; i < allProduitIntermediriare.size(); i ++ ) { %>
                                                        <option value="<% out.print(allProduitIntermediriare.get(i).getId());%>"><% out.println(allProduitIntermediriare.get(i).getNom());%></option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Date d'utilisation</h6>
                                                <div class="input-item input-item-date ltn__custom-icon">
                                                    <input type="date" name="date" placeholder="date"  >
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Quantite</h6>
                                                <div class="input-item input-item-website ltn__custom-icon">
                                                    <input type="text" name="quantiter" placeholder="Quantite utilisée" value="1" >
                                                </div>
                                   
                                            </div>
    
                                            </div>

                                        <div class="btn-wrapper">
                                            <input type="submit" placeholder="Quantite ajoutee" value="Planter" >
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="feature.jsp" %>

        <%@ include file="footer.jsp" %>
