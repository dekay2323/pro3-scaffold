<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Material Admin</title>

        <!-- Vendor CSS -->
        <link href="/assets/vendors/bower_components/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
        <link href="/assets/vendors/bower_components/animate.css/animate.min.css" rel="stylesheet">
        <link href="/assets/vendors/bower_components/sweetalert/dist/sweetalert.css" rel="stylesheet">
        <link href="/assets/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css" rel="stylesheet">
        <link href="/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet">

        <!-- CSS -->
        <link href="/assets/css/app_1.min.css" rel="stylesheet">
        <link href="/assets/css/app_2.min.css" rel="stylesheet">

    </head>
    <body>
        <header id="header" class="clearfix" data-ma-theme="blue">
            <ul class="h-inner">
                <li class="hi-trigger ma-trigger" data-ma-action="sidebar-open" data-ma-target="#sidebar">
                    <div class="line-wrap">
                        <div class="line top"></div>
                        <div class="line center"></div>
                        <div class="line bottom"></div>
                    </div>
                </li>

                <li class="hi-logo hidden-xs">
                    <a href="index.html">Pro 3</a>
                </li>

                <li class="pull-right">
                    <ul class="hi-menu">

                        <li data-ma-action="search-open">
                            <a href=""><i class="him-icon zmdi zmdi-search"></i></a>
                        </li>

                        <li class="dropdown">
                            <a data-toggle="dropdown" href="">
                                <i class="him-icon zmdi zmdi-notifications"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-lg pull-right">
                                <div class="list-group him-notification">
                                </div>
                            </div>
                        </li>
                        <li class="dropdown">
                            <a data-toggle="dropdown" href=""><i class="him-icon zmdi zmdi-more-vert"></i></a>
                            <ul class="dropdown-menu dm-icon pull-right">
                                <li class="skin-switch hidden-xs">
                                    <span class="ss-skin bgm-lightblue" data-ma-action="change-skin" data-ma-skin="lightblue"></span>
                                    <span class="ss-skin bgm-bluegray" data-ma-action="change-skin" data-ma-skin="bluegray"></span>
                                    <span class="ss-skin bgm-cyan" data-ma-action="change-skin" data-ma-skin="cyan"></span>
                                    <span class="ss-skin bgm-teal" data-ma-action="change-skin" data-ma-skin="teal"></span>
                                    <span class="ss-skin bgm-orange" data-ma-action="change-skin" data-ma-skin="orange"></span>
                                    <span class="ss-skin bgm-blue" data-ma-action="change-skin" data-sma-kin="blue"></span>
                                </li>
                                <li class="divider hidden-xs"></li>
                                <li class="hidden-xs">
                                    <a data-ma-action="fullscreen" href=""><i class="zmdi zmdi-fullscreen"></i> Toggle Fullscreen</a>
                                </li>
                                <li>
                                    <a data-ma-action="clear-localstorage" href=""><i class="zmdi zmdi-delete"></i> Clear Local Storage</a>
                                </li>
                                <li>
                                    <a href=""><i class="zmdi zmdi-face"></i> Privacy Settings</a>
                                </li>
                                <li>
                                    <a href=""><i class="zmdi zmdi-settings"></i> Other Settings</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>

            <!-- Top Search Content -->
            <div class="h-search-wrap">
                <div class="hsw-inner">
                    <i class="hsw-close zmdi zmdi-arrow-left" data-ma-action="search-close"></i>
                    <input type="text">
                </div>
            </div>
        </header>

        <section id="main">
            <aside id="sidebar" class="sidebar c-overflow">
                <div class="s-profile">
                    <a href="" data-ma-action="profile-menu-toggle">
                        <div class="sp-pic">
                            <img src="/assets/profile-pics/demian.jpg" alt="">
                        </div>

                        <div class="sp-info">
                            Demian Krige

                            <i class="zmdi zmdi-caret-down"></i>
                        </div>
                    </a>

                    <ul class="main-menu">
                        <li>
                            <a href="profile-about.html"><i class="zmdi zmdi-account"></i> View Profile</a>
                        </li>
                        <li>
                            <a href=""><i class="zmdi zmdi-input-antenna"></i> Privacy Settings</a>
                        </li>
                        <li>
                            <a href=""><i class="zmdi zmdi-settings"></i> Settings</a>
                        </li>
                        <li>
                            <a href=""><i class="zmdi zmdi-time-restore"></i> Logout</a>
                        </li>
                    </ul>
                </div>

                <ul class="main-menu">
                    <li class="active">
                        <a href="index.html"><i class="zmdi zmdi-home"></i> Home</a>
                    </li>
                    <li class="sub-menu">
                        <a href="" data-ma-action="submenu-toggle"><i class="zmdi zmdi-view-compact"></i> Project List</a>

                        <ul>
                            <li><a href="textual-menu.html">Procurement Statistics</a></li>
                            <li><a href="image-logo.html">Project List</a></li>
                            <li><a href="top-mainmenu.html">Procurement Plan</a></li>
                            <li><a href="top-mainmenu.html">RFQ</a></li>
                            <li><a href="top-mainmenu.html">PO</a></li>
                            <li><a href="top-mainmenu.html">Expediting</a></li>
                        </ul>
                    </li>
                    <li><a href="typography.html"><i class="zmdi zmdi-account"></i> Vendors</a></li>
                    <li><a href="typography.html"><i class="zmdi zmdi-file"></i> Reporting</a></li>
                </ul>
            </aside>

            <section id="content">
                <g:layoutBody/>
            </section>
        </section>

        <footer id="footer">
            Copyright &copy; 2016 Pro3
        </footer>

        <!-- Page Loader
        <div class="page-loader">
            <div class="preloader pls-blue">
                <svg class="pl-circular" viewBox="25 25 50 50">
                    <circle class="plc-path" cx="50" cy="50" r="20" />
                </svg>

                <p>Please wait...</p>
            </div>
        </div>-->

        <!-- Older IE warning message -->
        <!--[if lt IE 9]>
            <div class="ie-warning">
                <h1 class="c-white">Warning!!</h1>
                <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
                <div class="iew-container">
                    <ul class="iew-download">
                        <li>
                            <a href="http://www.google.com/chrome/">
                                <img src="img/browsers/chrome.png" alt="">
                                <div>Chrome</div>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.mozilla.org/en-US/firefox/new/">
                                <img src="img/browsers/firefox.png" alt="">
                                <div>Firefox</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://www.opera.com">
                                <img src="img/browsers/opera.png" alt="">
                                <div>Opera</div>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.apple.com/safari/">
                                <img src="img/browsers/safari.png" alt="">
                                <div>Safari</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                                <img src="img/browsers/ie.png" alt="">
                                <div>IE (New)</div>
                            </a>
                        </li>
                    </ul>
                </div>
                <p>Sorry for the inconvenience!</p>
            </div>
        <![endif]-->

        <!-- Javascript Libraries -->
        <script src="/assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="/assets/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <script src="/assets/vendors/bower_components/flot/jquery.flot.js"></script>
        <script src="/assets/vendors/bower_components/flot/jquery.flot.resize.js"></script>
        <script src="/assets/vendors/bower_components/flot.curvedlines/curvedLines.js"></script>
        <script src="/assets/vendors/sparklines/jquery.sparkline.min.js"></script>
        <script src="/assets/vendors/bower_components/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>

        <script src="/assets/vendors/bower_components/moment/min/moment.min.js"></script>
        <script src="/assets/vendors/bower_components/fullcalendar/dist/fullcalendar.min.js "></script>
        <script src="/assets/vendors/bower_components/simpleWeather/jquery.simpleWeather.min.js"></script>
        <script src="/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>
        <script src="/assets/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
        <script src="/assets/vendors/bower_components/sweetalert/dist/sweetalert.min.js"></script>
        <script src="/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>

        <!-- Placeholder for IE9 -->
        <!--[if IE 9 ]>
            <script src="/assets/vendors/bower_components/jquery-placeholder/jquery.placeholder.min.js"></script>
        <![endif]-->

        <script src="/assets/js/app.min.js"></script>
    </body>
  </html>
