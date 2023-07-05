<%@ page import = "assets.produit.*" %>
<%@ page import = "location.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% Entrepot[] entrepots = (Entrepot[]) request.getAttribute("entrepots"); 
ProduitFini[] produits = (ProduitFini[]) request.getAttribute("produits"); 
String erreur = "";
if(request.getAttribute("erreur")!=null){
    erreur = (String) request.getAttribute("erreur");
}
%>
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
                                <h1 class="section-title white-color">Production</h1>
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
                                <h4 class="title-2">Production</h4>
                                
                                <div class="ltn__checkout-single-content-info">
                                    <span style="color:red;margin-bottom:4vh;">
                                        <% out.print(erreur); %>
                                    </span>
                                    <form action="ajout/submit" method = 'POST'>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h6>Nom du produit</h6>
                                                <div class="input-item">
                                                    <select class="nice-select" name="produit">
                                                        <option>Selectionnez un produit</option>
                                                        <% for(int i =0;i<produits.length;i++){%>
                                                            <option value="<%out.print(produits[i].getId());%>"><%out.print(produits[i].getNom());%></option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Date d'ajout</h6>
                                                <div class="input-item input-item-date">
                                                    <input type="datetime-local" name="date" placeholder="date d'ajout" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Quantite</h6>
                                                <div class="input-item input-item-website ltn__custom-icon">
                                                    <input type="text" name="quantite" placeholder="Quantite ajoutee" value="1" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Entrepôt</h6>
                                                <div class="input-item">
                                                    <select class="nice-select" name="entrepot">
                                                        <option>Selectionnez un entrepôt</option>
                                                        <% for(int i =0;i<entrepots.length;i++){%>
                                                            <option value="<%out.print(entrepots[i].getIdentrepot());%>"><%out.print(entrepots[i].getNom());%></option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="btn-wrapper">
                                            <button type="submit" class="theme-btn-3 btn btn-effect-4 text-uppercase">Ajouter</button>
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
