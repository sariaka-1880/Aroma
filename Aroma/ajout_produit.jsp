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
                                <h1 class="section-title white-color">Ajout produit</h1>
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
                                <h4 class="title-2">Ajoutez un produit</h4>
                                <div class="ltn__checkout-single-content-info">
                                    <form action="#">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h6>Type du produit</h6>
                                                <div class="input-item">
                                                    <select class="nice-select" style="display: none;">
                                                        <option>Selectionnez un type</option>
                                                        <option value="1">Ressource</option>
                                                        <option value="2">Produit intermediaire</option>
                                                        <option value="3">Produit fini</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Nom du produit</h6>
                                                <div class="input-item">
                                                    <select class="nice-select" style="display: none;">
                                                        <option>Selectionnez un produit</option>
                                                        <option value="1">nom 1</option>
                                                        <option value="2">nom 2</option>
                                                        <option value="3">nom 3</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Date d'ajout</h6>
                                                <div class="input-item input-item-date">
                                                    <input type="date" name="ltn__date" placeholder="date d'ajout" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Quantite</h6>
                                                <div class="input-item input-item-website ltn__custom-icon">
                                                    <input type="text" name="ltn__number" placeholder="Quantite ajoutee" value="1" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Prix unitaire</h6>
                                                <div class="input-item input-item-website ltn__custom-icon">
                                                    <input type="text" name="ltn__number" placeholder="" value="0" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>Fournisseur</h6>
                                                <div class="input-item">
                                                    <select class="nice-select" style="display: none;">
                                                        <option>Selectionnez un fournisseur</option>
                                                        <option value="1">fournisseur 1</option>
                                                        <option value="2">fournisseur 2</option>
                                                        <option value="3">fournisseur 3</option>
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
