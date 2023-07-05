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
                                <h1 class="section-title white-color">Insertion coordonn&eacute;es clients</h1>
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
                                <h4 class="title-2">Insertion coordonn&eacute;es clients</h4>
                                <div class="ltn__checkout-single-content-info">
                                    <form action="/Aroma/vente/lien_facture" method="post">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h6>Nom </h6>
                                                <div class="input-item input-item-date">
                                                    <input type="text" name="nom_client" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Num&eacute;ro de t&eacute;l&eacute;phone </h6>
                                                <div class="input-item input-item-website ltn__custom-icon">
                                                    <input type="text" name="numero_phone" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Adresse</h6>
                                                <div class="input-item input-item-website ltn__custom-icon">
                                                    <input type="text" name="adresse" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="btn-wrapper">
                                            <button type="submit" class="theme-btn-3 btn btn-effect-4 text-uppercase">CONFIRMER</button>
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
