<%@ include file="header.jsp" %>
    <%@ include file="menu.jsp" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "java.util.Vector" %>

    <%@ page import = "assets.ProduitIntermediaire" %>
    <%@ page import = "assets.TypeActivite" %>
    <%
        Vector<TypeActivite> listTypeActivite = (Vector)request.getAttribute("listTypeActivite");
        ArrayList<ProduitIntermediaire> listProduit = (ArrayList)request.getAttribute("listProduit");
    %>
        <!-- BREADCRUMB AREA START -->
        <div class="ltn__breadcrumb-area ltn__breadcrumb-area-4 bg-overlay-theme-10--- bg-image" data-bg="img/bg/4.png"
            style="background-image: url(&quot;img/bg/4.png&quot;);">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
                            <div class="section-title-area">
                                <h1 class="section-title white-color">Insertion &eacute;v&egrave;nement</h1>
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
                                <h4 class="title-2">Ins&eacute;rez un &eacute;v&egrave;nement</h4>
                                <div class="ltn__checkout-single-content-info">
                                    <form action="#">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h6>Nom du produit</h6>
                                                <div class="input-item">
                                                    <select class="nice-select">
                                                        <% 
                                                            for(ProduitIntermediaire produit : listProduit){
                                                            %>
                                                                <option><% out.print(produit.getNom()); %></option>
                                                            <%
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Dur&eacute;e en jour</h6>
                                                <div class="input-item input-item-website ltn__custom-icon">
                                                    <input type="text" name="ltn__number" placeholder="Quantite ajoutee" value="1" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Type d'activit&eacute;</h6>
                                                <div class="input-item">
                                                    <select class="nice-select">
                                                        <option>Selectionnez un produit</option>
                                                        <option value="1">nom 1</option>
                                                        <option value="2">nom 2</option>
                                                        <option value="3">nom 3</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Date d&eacute;but</h6>
                                                <div class="input-item input-item-date ltn__custom-icon">
                                                    <input type="date" name="ltn__date" placeholder="date debut"  required>
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
