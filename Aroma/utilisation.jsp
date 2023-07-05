<%@page import="assets.Ressource"%>
<%@page import="assets.Fournisseur"%>
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
                                <h1 class="section-title white-color">Ajout Ressource</h1>
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
                                <h4 class="title-2">Ajout ressource</h4>
                                <div class="ltn__checkout-single-content-info">
                                    <form action="/Aroma/ajoutressource" method="Get">
                                        <% if (request.getAttribute("error") != null) { %>
                                            <p><%= (request.getAttribute("error")) %></p>
                                        <% } %>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h6>Ressource</h6>
                                                <div class="input-item">
                                                    <select class="nice-select" style="display: block;" name="ressource">
                                                        <option>Selectionnez une ressource</option>
                                                        <% ArrayList<Ressource> allRessource = (ArrayList) request.getAttribute("ressources"); %>
                                                            <% for (int i=0 ; i < allRessource.size(); i ++ ) { %>
                                                        <option value="<% out.print(allRessource.get(i).getId());%>"><% out.println(allRessource.get(i).getNom());%></option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Date d'ajout</h6>
                                                <div class="input-item input-item-date">
                                                    <input type="date" name="dateajout" placeholder="date d'Utilisatiob" >
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Date de peremtion</h6>
                                                <div class="input-item input-item-date">
                                                    <input type="date" name="dateperemption" placeholder="date d'Utilisatiob" >
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Quantite</h6>
                                                <div class="input-item input-item-website ltn__custom-icon">
                                                    <input type="text" name="quantiter" placeholder="Quantite utilisée" value="0" >
                                                </div>
                                   
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Prix unitaire</h6>
                                                <div class="input-item input-item-website ltn__custom-icon">
                                                    <input type="text" name="prixUnitaire" placeholder="" value="0" >

                                            </div>
                                            </div>
                                            <div class="input-item">
                                                <select class="nice-select" style="display: block;" name="fournisseur">
                                                        <option>Selectionnez un Fournisseur</option>
                                                        <% ArrayList<Fournisseur> allFournisseur = (ArrayList) request.getAttribute("fournisseurs"); %>
                                                            <% for (int i=0 ; i < allFournisseur.size(); i ++ ) { %>
                                                        <option value="<% out.print(allFournisseur.get(i).getId());%>"><% out.println(allFournisseur.get(i).getDescription());%></option>
                                                        <% } %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="btn-wrapper">
                                            <input type="submit" placeholder="Quantite ajoutee" value="Ajouter" >
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
