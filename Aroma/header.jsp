<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0066)#index-2.html -->
<html class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths" lang="fr"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Aroma</title>
    <meta name="robots" content="noindex, follow">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Place favicon.png in the root directory -->
    <link rel="shortcut icon" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/images/logo.png" type="image/x-icon">
    <!-- Font Icons css -->
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/font-icons.css">
    <!-- plugins css -->
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/plugins.css">
    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/responsive.css">
    <!-- main css -->
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/main.css">
    <!-- plugins css -->
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/plugins.css">

    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/animation.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/breadcrumb.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/button.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/footer.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/global.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/gutenberg.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/header.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/mixins.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/portfolio.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/preloader.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/product.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/search_popup.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/slider.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/widgets.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/fontawesome-5/css/all.min.css">

    <%-- DASHBOARD --%>
    <link rel="stylesheet" href="css/simplebar.css">
    <%-- <!-- Fonts CSS -->
    <link href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/head_font.css" rel="stylesheet"> --%>
    <!-- Icons CSS -->
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/css/feather.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/css/select2.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/css/dropzone.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/css/uppy.min.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/css/jquery.steps.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/css/jquery.timepicker.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/css/quill.snow.css">
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/css/daterangepicker.css">
    <!-- App CSS -->
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/css/app-light.css" id="lightTheme">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/css/app-dark.css" id="darkTheme" disabled>
    <link href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/head_font2.css" rel="stylesheet">
    <link href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/head_font3.css" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icomoon/style.css"> 
    <link href='<% out.print(request.getAttribute("baseUrl")); %>/assets/fullcalendar/packages/core/main.css' rel='stylesheet' />
    <link href='<% out.print(request.getAttribute("baseUrl")); %>/assetsfullcalendar/packages/daygrid/main.css' rel='stylesheet' />
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/style.css">
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/demo.css" />
    <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/produit.css" />
    <%-- <link rel="stylesheet" href="<% out.print(request.getAttribute("baseUrl")); %>/assets/css/facture_style.css"> --%>
	<link rel="license" href="https://www.opensource.org/licenses/mit-license/">
	<script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/js/facture_script.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/js/chart.min.js"></script>

</head>


<body class="" style="">
    <!--[if lte IE 9]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
    <![endif]-->

    <!-- Add your site or application content here -->

<!-- Body main wrapper start -->
<div class="body-wrapper">

    <!-- HEADER AREA START (header-4) -->
    <header class="ltn__header-area ltn__header-4 ltn__header-6 ltn__header-transparent--- gradient-color-2---">
        <!-- ltn__header-top-area start -->
        <div class="ltn__header-top-area top-area-color-white d-none">
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                        <div class="ltn__top-bar-menu">
                            <ul>
                                <li><a href="#"><i class="icon-mail"></i> aroma@gmail.com</a></li>
                                <li><a href="#"><i class="icon-placeholder"></i> 15/A, Nest Tower, NYC</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="top-bar-right text-right">
                            <div class="ltn__top-bar-menu">
                                <ul>
                                    <li>
                                        <!-- ltn__language-menu -->
                                        <div class="ltn__drop-menu ltn__currency-menu ltn__language-menu">
                                            <ul>
                                                <li><a href="#" class="dropdown-toggle"><span class="active-currency">Francais</span></a>
                                                    <ul>
                                                        <li><a href="#">Arabe</a></li>
                                                        <li><a href="#">Bengali</a></li>
                                                        <li><a href="#">Chinois</a></li>
                                                        <li><a href="#">Anglais</a></li>
                                                        <li><a href="#">Francais</a></li>
                                                        <li><a href="#">Hindi</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <!-- ltn__social-media -->
                                        <div class="ltn__social-media">
                                            <ul>
                                                <li><a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a></li>
                                                <li><a href="#" title="Twitter"><i class="fab fa-twitter"></i></a></li>

                                                <li><a href="#" title="Instagram"><i class="fab fa-instagram"></i></a></li>
                                                <li><a href="#" title="Dribbble"><i class="fab fa-dribbble"></i></a></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ltn__header-top-area end -->

        <!-- ltn__header-middle-area start -->
        <div class="ltn__header-middle-area ltn__header-sticky">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="site-logo">
                            <a href="#"><img src="<% out.print(request.getAttribute("baseUrl")); %>/assets/images/logo.png" alt="Logo"></a>
                        </div>
                    </div>
                    <div class="col header-menu-column" style="display: flex; flex-direction: row; justify-content: space-evenly;">
                        <div class="header-menu d-none d-xl-block">
                            <nav>
                                <div class="ltn__main-menu">
                                    <ul>
                                        <li class="menu-icon"><a href="/Aroma/index.jsp">Accueil</a>
                                        </li>
                                        <li class="menu-icon"><a href="index.jsp">Culture</a>
                                            <ul>
                                                    <li><a href="<% out.print(request.getAttribute("baseUrl")); %>"></a></li>
                                                    <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/ressource">ajout ressources</a></li>
                                                    <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/produitintermediaire">Plantation</a></li>
                                                    <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/recolte">R&eacute;colte</a></li>
                                                    <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/stock">Stock</a></li>
                                                    <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/statistique">Statistiques</a></li>
                                                    <li><a href="<% out.print(request.getAttribute("baseUrl")); %>">Evenement <span class="float-right">&gt;&gt;</span></a>
                                                        <ul>
                                                            <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/planning">planning</a></li>
                                                            <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/evenement/ajout">ajouter evenement</a></li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                        </li>
                                        <li class="menu-icon"><a href="#">Finance</a>
                                            <ul>
                                                <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/listereport">Liste report</a></li>
                                                <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/ajoutreport">Ajout report</a></li>
                                                <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/statistique/production">Statistiques</a></li>
                                                <li><a href="<% out.print(request.getAttribute("baseUrl")); %>">Vente<span class="float-right">&gt;&gt;</span></a>
                                                    <ul>
                                                        <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/vente/panier?idProduit=0">Mon panier</a></li>
                                                        <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/vente/listeProduits">Nos produits</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="menu-icon"><a href="#">Production</a>
                                            <ul>
                                                <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/production/ajout">Ajout production</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-icon"><a href="#">Statistiques</a>
                                            <ul>
                                                <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/statistique">Culture</a></li>
                                                <li><a href="<% out.print(request.getAttribute("baseUrl")); %>/statistique/production">Finance et production</a></li>
                                            </ul> 
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                    <div class="col">
                        <div class="ltn__header-options">
                            <!-- mini-cart -->
                            <div class="mini-cart-icon">
                                <a href="#" class="ltn__utilize-toggle">
                                    <i class="fa fa-shopping-cart"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ltn__header-middle-area end -->
    </header>
    <!-- HEADER AREA END -->