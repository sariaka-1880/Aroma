<%@ include file="header.jsp" %>

    <%@ include file="menu.jsp" %>

    <%-- Reto avy no zavatra novaiko  --%>
    <%@ page import="java.util.List" %>
    <%@ page import="servlet.vente.*" %>
    <%@ page import="assets.*" %>

        <!-- BREADCRUMB AREA START -->
        <div class="ltn__breadcrumb-area ltn__breadcrumb-area-4 bg-overlay-theme-10--- bg-image" data-bg="img/bg/4.png"
            style="background-image: url(&quot;img/bg/4.png&quot;);">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
                            <div class="section-title-area">
                                <h1 class="section-title white-color">Panier</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMB AREA END -->

        <!-- LOGIN AREA START (Register) -->
        <div class="liton__shoping-cart-area mb-120">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping-cart-inner">
                            <div class="shoping-cart-table table-responsive">
                                <table class="table">
                                    <tbody>
                                        <%-- Récupérer la listePanier depuis la session --%>
                                        <% List<Panier> listePanier = (List<Panier>) session.getAttribute("listePanier"); %>

                                        <%-- Afficher les éléments du panier --%>
                                        <% if (listePanier != null && !listePanier.isEmpty()) { %>
                                            <form action="<%= request.getContextPath() %>/vente/updatePanier" method="post">
                                                <ul>
                                                <% 
                                                    for (Panier panier : listePanier) { 
                                                %>
                                                    <tr>
                                                        <%-- <td class="cart-product-image">
                                                            <a href="#"><img src="<%= request.getContextPath() %>/assets/images/<%= fiche.getImage() %>" alt="#"></a>
                                                        </td> --%>
                                                        <td class="cart-product-info">
                                                            <h4><a href="#"><%= panier.getProduitFini().getNom() %></a></h4>
                                                        </td>
                                                        <td class="cart-product-price">Ar <%= panier.getProduitFini().getPrix() %></td>
                                                        <td class="cart-product-quantity">
                                                            <input type="hidden" name="idPanier[]" value="<%= panier.getProduitFini().getId() %>">
                                                            <input type="number" value="<%= panier.getQuantite() %>" name="quantite[]" id="qte1" required>
                                                        </td>
                                                        <td class="cart-product-subtotal">Ar <%= panier.getPrixProduit() %></td>
                                                        <td class="cart-product-remove"><a href="/Aroma/vente/deletePanier?idPanier=<%= panier.getProduitFini().getId() %>">X</a></td>
                                                    </tr>
                                                <% } %>
                                                </ul>
                                                <tr class="cart-coupon-row">
                                                    <td>
                                                        <button type="submit" class="btn theme-btn-2 btn-effect-2--">Mettre à jour panier</button>
                                                    </td>
                                                </tr>
                                            </form>
                                        <% } else { %>
                                            <p>Votre panier est vide.</p>
                                        <% } %>
                                    </tbody>

                                </table>
                            </div>
                            <div class="shoping-cart-total mt-50">
                                <h4>Cart Totals</h4>
                                <table class="table">
                                    <tbody>
                                        <% if (listePanier != null && !listePanier.isEmpty()) { %>
                                            <% 
                                                for (Panier panier : listePanier) { 
                                            %>
                                        <tr>
                                            <td><%= panier.getProduitFini().getNom() %></td>
                                            <td>Ar <%= panier.getPrixProduit() %></td>
                                        </tr>
                                        <%
                                                }
                                            }   
                                        %>
                                    </tbody>
                                </table>
                                <div class="btn-wrapper text-right">
                                    <a href="<% out.print(request.getAttribute("baseUrl")); %>/vente/confirmerAchat" class="theme-btn-1 btn btn-effect-1">Confirmer mon achat</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="feature.jsp" %>

            <%@ include file="footer.jsp" %>
