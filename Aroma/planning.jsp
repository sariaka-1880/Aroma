<%@ include file="header.jsp" %>

    <%@ include file="menu.jsp" %>
    <% 
        String listActivite = (String)request.getAttribute("listActivite");
    %>
        <!-- BREADCRUMB AREA START -->
        <div class="ltn__breadcrumb-area ltn__breadcrumb-area-4 bg-overlay-theme-10--- bg-image" data-bg="img/bg/4.png"
            style="background-image: url(&quot;img/bg/4.png&quot;);">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
                            <div class="section-title-area">
                                <h1 class="section-title white-color">Calendrier stock</h1>
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
                                <h4 class="title-2">Calendrier stock</h4>

                                <div class="ltn__checkout-single-content-info">
                                    <div id='calendar-container'>
                                        <div id='calendar'></div>
                                    </div>
                                        <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/js/jquery-3.3.1.min.js'></script>
                                        <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/js/popper.min.js'></script>
                                        <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/js/bootstrap.min.js'></script>

                                        <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/fullcalendar/packages/core/main.js'></script>
                                        <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/fullcalendar/packages/interaction/main.js'></script>
                                        <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/fullcalendar/packages/daygrid/main.js'></script>
                                        <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/fullcalendar/packages/timegrid/main.js'></script>
                                        <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/fullcalendar/packages/list/main.js'></script>
                                        <script>
                                        document.addEventListener('DOMContentLoaded', function() {
                                        var calendarEl = document.getElementById('calendar');

                                        var calendar = new FullCalendar.Calendar(calendarEl, {
                                        plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
                                        height: 'parent',
                                        header: {
                                            left: 'prev,next ',
                                            center: 'title',
                                            right: 'dayGridMonth'
                                        },
                                        defaultView: 'dayGridMonth',
                                        defaultDate: '2023-02-12',
                                        navLinks: true, // can click day/week names to navigate views
                                        editable: true,
                                        eventLimit: true, // allow "more" link when too many events
                                        events: [
                                            <% 
                                                out.print(listActivite);
                                            %>
                                            
                                        ]
                                        });

                                        calendar.render();
                                    });

                                    </script>
                                    <script src='<% out.print(request.getAttribute("baseUrl")); %>/assets/js/main.js'></script>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="feature.jsp" %>

        <%@ include file="footer.jsp" %>
