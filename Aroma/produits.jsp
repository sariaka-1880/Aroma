<%@ include file="header.jsp" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "utils.Constantes" %>
<%@ page import = "utils.MaConnection" %>
<%@ page import = "assets.produit.ProduitFini" %>
<%@ page import = "assets.produit.FicheProduit" %>
    <%@ include file="menu.jsp" %>
        <div class="container">
            <div class="ltn__checkout-single-content-info">
                <form action="<% out.print(request.getAttribute("baseUrl")); %>/vente/switchProduit" method="get">
                    <div class="col-md-6">
                        <h6>Type du produit</h6>
                        <div class="input-item">
                        <select name="idProduit" class="nice-select">
                            <option>Selectionnez un produit</option>
                        <%
                            try {
                                Connection connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
                                if( connex != null) {
                                    ProduitFini produitFinis = new ProduitFini();
                                    ArrayList<ProduitFini> listproduitFinis = produitFinis.getListProduitFini(connex);
                                    for(int i = 0; i < listproduitFinis.size(); i++) { 
                        %>
                            <option value="<%= listproduitFinis.get(i).getId() %>"><%= listproduitFinis.get(i).getNom() %></option>
                        <%          }
                                }
                            } catch (Exception e) {
                                System.out.println(e.getMessage());
                            }
                        %>
                        </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="theme-btn-3 btn btn-effect-4 text-uppercase">choisir</button>
                    </div>
                </form>
            </div>
            <div class="row">
                <!-- SLIDER AREA START (slider-1) -->
                <div class="ltn__slider-area ltn__slider-6 ">
                    <div class="ltn__slide-one-active slick-slide-arrow-1 slick-slide-dots-1 slick-initialized slick-slider slick-dotted"
                        role="toolbar">
                        <!-- ltn__slide-item -->
                        <div aria-live="polite" class="slick-list draggable">
                            <div class="slick-track" style="opacity: 1; width: 4560px;" role="listbox">
                                <div class="ltn__slide-item section-bg-1 bg-image plr--2 slick-slide slick-current slick-active"
                                    data-bg='<% out.print(request.getAttribute("baseUrl")); %>/assets/images/1-1.png'
                                    data-slick-index="0"
                                    style='background-image: none; width: 1520px; position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1;  height:max-content;'
                                    aria-hidden="false" tabindex="-1" role="option" aria-describedby="slick-slide00">
                                    <div class="ltn__slide-item-inner">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-5 col-sm-5 align-self-center">
                                                <%
                                                    if(request.getAttribute("idproduit_Fini") != null ) {
                                                        try {
                                                            Connection connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
                                                            FicheProduit fiche = new FicheProduit();
                                                            int idproduit_Fini = Integer.parseInt(request.getAttribute("idproduit_Fini").toString());
                                                            int idproduit = 0;

                                                            ArrayList<FicheProduit> listphoto = fiche.getListFicheProduitsPhoto(connex,idproduit_Fini);
                                                %>
                                                <section class="carousel" aria-label="Gallery">
                                                <ol class="carousel__viewport">
                                                <%
                                                            for(int bouclephoto = 0; bouclephoto < listphoto.size(); bouclephoto++) {
                                                                String[] photo = listphoto.get(bouclephoto).getImage();
                                                                for(int img = 0; img < photo.length; img++) {
                                                %>
                                                <li id="carousel__slide<%= img %>"
                                                    tabindex="0"
                                                    class="carousel__slide">
                                                    <div class="carousel__snapper">
                                                        <a href="#carousel__slide<%= (img == 1) ? photo.length : (img - 1) %>"
                                                            class="carousel__prev">Go to previous slide</a>
                                                        <a href="#carousel__slide<%= (img == photo.length ) ? 1 : (img + 1) %>"
                                                            class="carousel__next">Go to next slide</a>
                                                        <img src="<% out.print(request.getAttribute("baseUrl")); %>/assets/images/<%= photo[img] %>" style="width: 506px;"%>
                                                    </div>
                                                </li>
                                                <%-- <div>
                                                    <a href="#" tabindex="0"><img src='<% out.print(request.getAttribute("baseUrl")); %>/assets/images/<%= photo[img] %>' style="width: 506px;" alt="#"></a>
                                                </div> --%>
                                                <aside class="carousel__navigation">
                                                    <ol class="carousel__navigation-list">
                                                        <% for (int i = 1; i <= photo.length; i++) { %>
                                                            <li class="carousel__navigation-item">
                                                                <a href="#carousel__slide<%= i %>"
                                                                    class="carousel__navigation-button"><%= i %></a>
                                                            </li>
                                                        <% } %>
                                                    </ol>
                                                </aside>
                                                <%
                                                                }
                                                            }
                                                        }   catch (Exception e) {
                                                            out.println(e.getMessage());
                                                        }
                                                    }
                                                %>
                                                    <div>
                                                        <a href="#" tabindex="0"><img
                                                                src='<% out.print(request.getAttribute("baseUrl")); %>/assets/images/1-1.png'
                                                                alt="#"></a>
                                                    </div>
                                                </div>
                                                <div class="col-lg-5 col-md-7 col-sm-7 align-self-center">
                                                    <div class="slide-item-info">
                                                        <div class="slide-item-info-inner ltn__slide-animation">
                                                        <%
                                                            if(request.getAttribute("idproduit_Fini") != null ) {
                                                            try {
                                                                Connection connex = MaConnection.getConnection(Constantes.database, Constantes.username, Constantes.password);
                                                                FicheProduit fiche = new FicheProduit();
                                                                int idproduit_Fini = Integer.parseInt(request.getAttribute("idproduit_Fini").toString());
                                                                int idproduit = 0;

                                                                ProduitFini produitFinis = new ProduitFini();
                                                                ArrayList<ProduitFini> listproduitFinisById = produitFinis.getListProduitFiniById(connex,idproduit_Fini);
                                                                for(int boucleprodfini = 0; boucleprodfini < listproduitFinisById.size(); boucleprodfini++) { 
                                                                    idproduit = listproduitFinisById.get(boucleprodfini).getId();
                                                        %>
                                                                    <h5 class="slide-title animated"><%= listproduitFinisById.get(boucleprodfini).getNom() %></h5>
                                                                    <h6 class="slide-title animated"><%= listproduitFinisById.get(boucleprodfini).getPrix() %> Ar</h6>
                                                        <%
                                                                }

                                                                ArrayList<FicheProduit> listfiche = fiche.getListFicheProduits(connex,idproduit_Fini);
                                                                for(int j = 0; j < listfiche.size(); j++) {
                                                                    String[] vertu = listfiche.get(j).getVertu();
                                                                    for(int a = 0;  a < vertu.length; a++) { %>
                                                                        <h4 class="slide-sub-title animated"><%= vertu[a] %></h4>
                                                        <%          }
                                                                }
                                                        %>
                                                            <div class="btn-wrapper animated">
                                                                <a href="<% out.print(request.getAttribute("baseUrl")); %>/vente/panier?idProduit=<%= idproduit %>" class="btn btn-round btn-black" tabindex="0">Ajouter au panier</a>
                                                            </div>    
                                                        <%    }   catch (Exception e) {
                                                                out.println(e.getMessage());
                                                            }
                                                            } else {
                                                        %>
                                                            <div class="col-lg-5 col-md-7 col-sm-7 align-self-center">
                                                                <div class="slide-item-info">
                                                                    <div class="slide-item-info-inner ltn__slide-animation">
                                                                        <h2 class="slide-sub-title animated">S&eacute;l&eacute;ctionnez un produit</h2>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        <%
                                                            }
                                                        %>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ltn__slide-item -->

                        <!-- ltn__slide-item -->
                    </div>
                </div>
                <!-- SLIDER AREA END -->
            </div>
        </div>

        <%@ include file="footer.jsp" %>
