    <!-- FOOTER AREA START -->
    <footer class="ltn__footer-area  ">
        <div class="footer-top-area  section-bg-5">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-md-6 col-sm-6 col-12">
                        <div class="footer-widget footer-about-widget">
                            <div class="footer-logo">
                                <div class="site-logo">
                                    <img src="<% out.print(request.getAttribute("baseUrl")); %>/assets/images/logo.png" alt="Logo">
                                </div>
                            </div>
                            <p>Sublimez vos sens avec nos parfums et huiles essentielles d'exception. Eveillez votre bien-etre.</p>
                            <div class="footer-address">
                                <ul>
                                    <li>
                                        <div class="footer-address-icon">
                                            <i class="fa fa-location-arrow"></i>
                                        </div>
                                        <div class="footer-address-info">
                                            <p>Andoharanofotsy, Antananarivo, Madagascar</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="footer-address-icon">
                                            <i class="fa fa-phone"></i>
                                        </div>
                                        <div class="footer-address-info">
                                            <p><a href="tel:+0123-456789">034 86 803 69</a></p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="footer-address-icon">
                                            <i class="fa fa-mail-bulk"></i>
                                        </div>
                                        <div class="footer-address-info">
                                            <p><a href="mailto:example@example.com">aroma@gmail.com</a></p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="ltn__social-media mt-20">
                                <ul>
                                    <li><a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a></li>
                                    <li><a href="#" title="Twitter"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="#" title="Linkedin"><i class="fab fa-linkedin"></i></a></li>
                                    <li><a href="#" title="Youtube"><i class="fab fa-youtube"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-sm-6 col-12">
                    </div>
                    <div class="col-xl-5 col-md-6 col-sm-12 col-12">
                        <div class="footer-widget footer-newsletter-widget">
                            <h4 class="footer-title">Boite aux lettres</h4>
                            <p>Abonnez-vous a notre lettre d'information hebdomadaire et recevez des mises a jour par courrier electronique.</p>
                            <div class="footer-newsletter">
                                <form action="#">
                                    <input type="email" name="email" placeholder="Email*">
                                    <div class="btn-wrapper">
                                        <button class="theme-btn-1 btn" type="submit"><i class="fas fa-location-arrow"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="footer-widget footer-newsletter-widget">   
                            <h4 class="footer-title">A propos de nous</h4>
                            <div class="ltn__social-media mt-20">
                                <ul>
                                    <li><i class="fa fa-user"></i>&nbsp;&nbsp;ETU 1793 RABARIJAONA Harena Juan</a></li>
                                    <li><i class="fa fa-user"></i>&nbsp;&nbsp;ETU 1892 RAVALISON Andrianomentsoa Rebeka</a></li>
                                    <li><i class="fa fa-user"></i>&nbsp;&nbsp;ETU 1840 RAKOTONIRINA Tiavina Irintsoa Nancyah</a></li>
                                    <li><i class="fa fa-user"></i>&nbsp;&nbsp;ETU 1863 RANDRIAMBOLOLONA Tafita Ana&euml;l</a></li>
                                    <li><i class="fa fa-user"></i>&nbsp;&nbsp;ETU 1796 RABEARIZOA Tolojanahary Micka&euml;l</a></li>
                                    <li><i class="fa fa-user"></i>&nbsp;&nbsp;ETU 1777 HERILALAO Ny Avo Lucas</a></li>
                                    <li><i class="fa fa-user"></i>&nbsp;&nbsp;ETU 1906 RAZAFINJAKA Ralph Yoan</a></li>
                                    <li><i class="fa fa-user"></i>&nbsp;&nbsp;ETU 1865 RANDRIANAIVO Mialivola</a></li>
                                    <li><i class="fa fa-user"></i>&nbsp;&nbsp;ETU 1880 RASOANAIVO Tolotriniavo Sariaka</a></li>
                                    <li><i class="fa fa-user"></i>&nbsp;&nbsp;ETU 1845 RAMANANTSIHOARANA Kanto Ny Aina Loann</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ltn__copyright-area ltn__copyright-2 section-bg-5">
            <div class="container ltn__border-top">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="ltn__copyright-design clearfix">
                            <p>Tous droits reserves @ Aroma <span class="current-year">2023</span></p>
                        </div>
                    </div>
                    <div class="col-md-6 col-12 align-self-center">
                        <div class="ltn__copyright-menu text-right">
                            <ul>
                                <li><a href="#">Termes &amp; Conditions</a></li>
                                <li><a href="#">Reclamation</a></li>
                                <li><a href="#">Vie privee &amp; Politique</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- FOOTER AREA END -->

    <!-- MODAL AREA START (Quick View Modal) -->
    <div class="ltn__modal-area ltn__quick-view-modal-area">
        <div class="modal fade" id="quick_view_modal" tabindex="-1" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                            <!-- <i class="fas fa-times"></i> -->
                        </button>
                    </div>
                    <div class="modal-body">
                         <div class="ltn__quick-view-modal-inner">
                             <div class="modal-product-item">
                                <div class="row">
                                    <div class="col-lg-6 col-12">
                                        <div class="modal-product-img">
                                            <img src="<% out.print(request.getAttribute("baseUrl")); %>/assets/images/4.png" alt="#">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="modal-product-info">
                                            <div class="product-ratting">
                                                <ul>
                                                    <li><a href="#"><i class="fas fa-star"></i></a></li>
                                                    <li><a href="#"><i class="fas fa-star"></i></a></li>
                                                    <li><a href="#"><i class="fas fa-star"></i></a></li>
                                                    <li><a href="#"><i class="fas fa-star-half-alt"></i></a></li>
                                                    <li><a href="#"><i class="far fa-star"></i></a></li>
                                                    <li class="review-total"> <a href="#"> ( 95 Reviews )</a></li>
                                                </ul>
                                            </div>
                                            <h3 class="animated fadeIn">Brand new product</h3>
                                            <div class="product-price">
                                                <span>$149.00</span>
                                                <del>$165.00</del>
                                            </div>
                                            <div class="modal-product-meta ltn__product-details-menu-1">
                                                <ul>
                                                    <li>
                                                        <strong>Categories:</strong>
                                                        <span>
                                                            <a href="#">Beard</a>
                                                            <a href="#">Oil</a>
                                                            <a href="#">Grooming</a>
                                                            <a href="#">Tools</a>
                                                        </span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="ltn__product-details-menu-2">
                                                <ul>
                                                    <li>
                                                        <div class="cart-plus-minus"><div class="dec qtybutton">-</div>
                                                            <input type="text" value="02" name="qtybutton" class="cart-plus-minus-box">
                                                        <div class="inc qtybutton">+</div></div>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="theme-btn-1 btn btn-effect-1" title="Add to Cart" data-toggle="modal" data-target="#add_to_cart_modal">
                                                            <i class="fas fa-shopping-cart"></i>
                                                            <span>ADD TO CART</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="ltn__product-details-menu-3">
                                                <ul>
                                                    <li>
                                                        <a href="#" class="" title="Wishlist" data-toggle="modal" data-target="#liton_wishlist_modal">
                                                            <i class="far fa-heart"></i>
                                                            <span>Add to Wishlist</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="" title="Compare" data-toggle="modal" data-target="#quick_view_modal">
                                                            <i class="fas fa-exchange-alt"></i>
                                                            <span>Compare</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <hr>
                                            <div class="ltn__social-media">
                                                <ul>
                                                    <li>Share:</li>
                                                    <li><a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a></li>
                                                    <li><a href="#" title="Twitter"><i class="fab fa-twitter"></i></a></li>
                                                    <li><a href="#" title="Linkedin"><i class="fab fa-linkedin"></i></a></li>
                                                    <li><a href="#" title="Instagram"><i class="fab fa-instagram"></i></a></li>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                             </div>
                         </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- MODAL AREA END -->

    <!-- MODAL AREA START (Add To Cart Modal) -->
    <div class="ltn__modal-area ltn__add-to-cart-modal-area">
        <div class="modal fade" id="add_to_cart_modal" tabindex="-1" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                         <div class="ltn__quick-view-modal-inner">
                             <div class="modal-product-item">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="modal-product-img">
                                            <img src="<% out.print(request.getAttribute("baseUrl")); %>/assets/images/1.png" alt="#">
                                        </div>
                                         <div class="modal-product-info">
                                            <h5><a href="#">Brand new product</a></h5>
                                            <p class="added-cart"><i class="fa fa-check-circle"></i>  Successfully added to your Cart</p>
                                            <div class="btn-wrapper">
                                                <a href="#" class="theme-btn-1 btn btn-effect-1">View Cart</a>
                                                <a href="#" class="theme-btn-2 btn btn-effect-2">Checkout</a>
                                            </div>
                                         </div>
                                         <!-- additional-info -->
                                         <div class="additional-info d-none">
                                            <p>We want to give you <b>10% discount</b> for your first order, <br>  Use discount code at checkout</p>
                                            <div class="payment-method">
                                                <img src="<% out.print(request.getAttribute("baseUrl")); %>/assets/images/payment.png" alt="#">
                                            </div>
                                         </div>
                                    </div>
                                </div>
                             </div>
                         </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- MODAL AREA END -->

    <!-- MODAL AREA START (Wishlist Modal) -->
    <div class="ltn__modal-area ltn__add-to-cart-modal-area">
        <div class="modal fade" id="liton_wishlist_modal" tabindex="-1">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                         <div class="ltn__quick-view-modal-inner">
                             <div class="modal-product-item">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="modal-product-img">
                                            <img src="<% out.print(request.getAttribute("baseUrl")); %>/assets/images/7.png" alt="#">
                                        </div>
                                         <div class="modal-product-info">
                                            <h5><a href="#">Brand new product</a></h5>
                                            <p class="added-cart"><i class="fa fa-check-circle"></i>  Successfully added to your Wishlist</p>
                                            <div class="btn-wrapper">
                                                <a href="#" class="theme-btn-1 btn btn-effect-1">View Wishlist</a>
                                            </div>
                                         </div>
                                         <!-- additional-info -->
                                         <div class="additional-info d-none">
                                            <p>We want to give you <b>10% discount</b> for your first order, <br>  Use discount code at checkout</p>
                                            <div class="payment-method">
                                                <img src="<% out.print(request.getAttribute("baseUrl")); %>/assets/images/payment.png" alt="#">
                                            </div>
                                         </div>
                                    </div>
                                </div>
                             </div>
                         </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- MODAL AREA END -->

</div>
<!-- Body main wrapper end -->

    <!-- preloader area start -->
    <div class="preloader d-none" id="preloader">
        <div class="preloader-inner">
            <div class="spinner">
                <div class="dot1"></div>
                <div class="dot2"></div>
            </div>
        </div>
    </div>
    <!-- preloader area end -->

    <!-- All JS Plugins -->
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/js/plugins.js"></script>
    <!-- Main JS -->
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/js/main.js"></script>

    <script src="https://kit.fontawesome.com/180064e518.js" crossorigin="anonymous"></script>

    <%-- DASHBOARD --%>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/jquery.min.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/popper.min.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/moment.min.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/bootstrap.min.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/simplebar.min.js"></script>
    <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/daterangepicker.js'></script>
    <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/jquery.stickOnScroll.js'></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/tinycolor-min.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/config.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/d3.min.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/topojson.min.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/datamaps.all.min.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/datamaps-zoomto.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/datamaps.custom.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/Chart.min.js"></script>
    <script>
      /* defind global options */
      Chart.defaults.global.defaultFontFamily = base.defaultFontFamily;
      Chart.defaults.global.defaultFontColor = colors.mutedColor;
    </script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/gauge.min.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/jquery.sparkline.min.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/apexcharts.min.js"></script>
    <script src="<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/apexcharts.custom.js"></script>
    <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/jquery.mask.min.js'></script>
    <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/select2.min.js'></script>
    <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/jquery.steps.min.js'></script>
    <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/jquery.validate.min.js'></script>
    <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/jquery.timepicker.js'></script>
    <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/dropzone.min.js'></script>
    <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/uppy.min.js'></script>
    <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/dashboard/js/quill.min.js'></script>
    <script>
      $('.select2').select2(
      {
        theme: 'bootstrap4',
      });
      $('.select2-multi').select2(
      {
        multiple: true,
        theme: 'bootstrap4',
      });
      $('.drgpicker').daterangepicker(
      {
        singleDatePicker: true,
        timePicker: false,
        showDropdowns: true,
        locale:
        {
          format: 'MM/DD/YYYY'
        }
      });
      $('.time-input').timepicker(
      {
        'scrollDefault': 'now',
        'zindex': '9999' /* fix modal open */
      });
      /** date range picker */
      if ($('.datetimes').length)
      {
        $('.datetimes').daterangepicker(
        {
          timePicker: true,
          startDate: moment().startOf('hour'),
          endDate: moment().startOf('hour').add(32, 'hour'),
          locale:
          {
            format: 'M/DD hh:mm A'
          }
        });
      }
      var start = moment().subtract(29, 'days');
      var end = moment();

      function cb(start, end)
      {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
      }
      $('#reportrange').daterangepicker(
      {
        startDate: start,
        endDate: end,
        ranges:
        {
          'Today': [moment(), moment()],
          'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days': [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month': [moment().startOf('month'), moment().endOf('month')],
          'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
      }, cb);
      cb(start, end);
      $('.input-placeholder').mask("00/00/0000",
      {
        placeholder: "__/__/____"
      });
      $('.input-zip').mask('00000-000',
      {
        placeholder: "____-___"
      });
      $('.input-money').mask("#.##0,00",
      {
        reverse: true
      });
      $('.input-phoneus').mask('(000) 000-0000');
      $('.input-mixed').mask('AAA 000-S0S');
      $('.input-ip').mask('0ZZ.0ZZ.0ZZ.0ZZ',
      {
        translation:
        {
          'Z':
          {
            pattern: /[0-9]/,
            optional: true
          }
        },
        placeholder: "___.___.___.___"
      });
      // editor
      var editor = document.getElementById('editor');
      if (editor)
      {
        var toolbarOptions = [
          [
          {
            'font': []
          }],
          [
          {
            'header': [1, 2, 3, 4, 5, 6, false]
          }],
          ['bold', 'italic', 'underline', 'strike'],
          ['blockquote', 'code-block'],
          [
          {
            'header': 1
          },
          {
            'header': 2
          }],
          [
          {
            'list': 'ordered'
          },
          {
            'list': 'bullet'
          }],
          [
          {
            'script': 'sub'
          },
          {
            'script': 'super'
          }],
          [
          {
            'indent': '-1'
          },
          {
            'indent': '+1'
          }], // outdent/indent
          [
          {
            'direction': 'rtl'
          }], // text direction
          [
          {
            'color': []
          },
          {
            'background': []
          }], // dropdown with defaults from theme
          [
          {
            'align': []
          }],
          ['clean'] // remove formatting button
        ];
        var quill = new Quill(editor,
        {
          modules:
          {
            toolbar: toolbarOptions
          },
          theme: 'snow'
        });
      }
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function()
      {
        'use strict';
        window.addEventListener('load', function()
        {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');
          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form)
          {
            form.addEventListener('submit', function(event)
            {
              if (form.checkValidity() === false)
              {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
    <script>
      var uptarg = document.getElementById('drag-drop-area');
      if (uptarg)
      {
        var uppy = Uppy.Core().use(Uppy.Dashboard,
        {
          inline: true,
          target: uptarg,
          proudlyDisplayPoweredByUppy: false,
          theme: 'dark',
          width: 770,
          height: 210,
          plugins: ['Webcam']
        }).use(Uppy.Tus,
        {
          endpoint: 'https://master.tus.io/files/'
        });
        uppy.on('complete', (result) =>
        {
          console.log('Upload complete! We’ve uploaded these files:', result.successful)
        });
      }
    </script>
    <script src="js/apps.js"></script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];

      function gtag()
      {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      gtag('config', 'UA-56159088-1');
    </script>
    <%-- FIN DASHBOARD --%>

<a id="scrollUp" href="#" style="position: fixed; z-index: 2147483647; display: none;"><i class="fa fa-angle-up"></i></a></body></html>
