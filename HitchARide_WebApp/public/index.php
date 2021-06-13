<!DOCTYPE html>
<html>

<head lang="it" dir="ltr">

    <!--============================= TITLE =============================-->

    <title>HitchARide: Search a Ride</title>
    <link rel="shortcut icon" href="TODO" />
    <link rel="icon" href="assets/img/LaPortaDAcquaImg.svg" />

    <!--============================= CSS =============================-->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets//css//style.css" />

</head>

<body>

    <!--============================= NAVBAR =============================-->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="collapse navbar-collapse" id="nav">
            <ul class="navbar-nav  m-0 p-3 p-lg-0">
                <li class="d-inline d-lg-none">
                    <button id='close-sidebar' data-toggle="collapse" data-target="#nav" class="close float-right">&times;</button>
                </li>
                <li class="nav-item">
                    <a class="text-truncate it-en-margin" draggable="false" href="#">IT|EN</a>
                </li>
                <li class="nav-item">
                    <a draggable="false" class="selected-link" href="index.html">Home</a>
                </li>
                <li class="nav-item">
                    <a draggable="false" href="menu.html">Menù</a>
                </li>
                <li class="nav-item">
                    <a draggable="false" href="aboutUs.html">Chi siamo</a>
                </li>
            </ul>
        </div>

        <button id="open-sidebar" class="navbar-toggler" type="button" data-toggle="collapse" data-target="#nav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <img style="height:30px;" src="assets/img/lpdaImg/menu-solid-512.png" alt="logo-icon">
        </button>

        <img id="logo-icon" class="logo" src="assets/img/LaPortaDAcquaImg.svg" alt="logo-icon">
        <img id="logo-text" class="logo" src="assets/img/Name.svg" alt="logo-text">

        <img src="public\assets\img\user.svg" alt="">
        <a id="button-navbar" class="btn button-style button-visibility" type="button" href="">
            Prenota ora
        </a>

    </nav>
    <!--============================= SEZIONI =============================-->

    <!--=================== INTRO SECTION =================-->
    <div id="index" class="not-draggable">
        <div class="background-img" id="imgFirstSection">
            <div class="container" id="firstSection">
                <div class="row">
                    <div class="col-xl-7 col-lg-7 col-md-12 col-xs-12 col-sm-12">
                        <h1>
                            Hitch A Ride
                        </h1>

                        <h3>
                            Dal 2021 mettiamo in contatto chi cerca e chi offre viaggi
                        </h3>
                    </div>
                    <div class="col-xl-5 col-lg-5 col-md-12 col-xs-12 col-sm-12 " id="form">
                        <form action="" method="get">
                            <div class="form-group">
                                <input type="text" name="from" class="form-control shadow-sm" placeholder="Parto da... ">
                            </div>
                            <div class="form-group">
                                <input type="text" name="to" class="form-control shadow-sm" placeholder="Vado a... ">
                            </div>

                            <div class="form-group">
                                <input type="date" name="date" class="form-control shadow-sm" min="2021/01/19" max="2022-04-30">
                            </div>

                            <div class="row ">
                                <div class="form-group col-6 ">
                                </div>

                                <div class="form-group col-6 pl-0">
                                    <input type="number" name="nPassengers" class="form-control shadow-sm" placeholder="Nr persone" min="1" max="999">
                                </div>
                            </div>
                            <div class="col-12 px-0">
                                <!-- <a class="btn button-style" id="res_button" type="button " style="width: 100%;" href="reservation.html">
                                Continua la prenotazione
                                </a> -->
                                <a class="btn button-style shadow-sm" id="res_button" type="button " style="width: 100%;">
                                    Cerca viaggi
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--=================== FOOTER =================-->

        <div class="container" id="resultSection">
            <div class="column">
                <?php
                include('public/components_gen/results_gen.php');
                ?>
            </div>
        </div>


        <!--=================== FOOTER =================-->

        <footer class="page-footer font-small mdb-color lighten-3 pt-4 " style="background-color: #F5ECD2; ">
            <div class="container ">
                <div class="row row-cols-1 row-cols-lg-3 g-4 ">
                    <div class="col ">
                        <img id="lpdaLogo " class="not-draggable" src="assets/img/lpda.svg " alt="lpdaLogo ">
                        <a href="mailto:info@laportadacqua.com">
                            <p class="padding " id="mailAddress">info@hitcharide.it</p>
                        </a>
                        <div class="row mx-auto ">
                            <div class="col-4 col-sm-4 col-md-5 col-lg-2 my-auto p-0 ">
                                <a href="">
                                    <img class="not-draggable float-right social-icon " src="assets/img/whatsapp-logo.svg " alt="whatsapp ">
                                </a>
                            </div>
                            <div class="col-8 col-sm-8 col-md-7 col-lg-10 my-auto p-0 ">
                                <a href="tel:+390412412124">
                                    <p id="phoneNumber" class="float-left my-auto ">+39 041 269 2222</p>
                                </a>
                            </div>
                        </div>
                        <div class="row mx-auto ">
                            <div class="col ">
                                <a href="https://www.instagram.com/laportadacqua/">
                                    <img id="instagram-footer" class="not-draggable social-icon " src="assets/img/instagram-logo.svg" alt="instagram ">
                                </a>
                                <a href="https://it-it.facebook.com/Laportadacqua/">
                                    <img id="facebook-footer" class="not-draggable social-icon " src="assets/img/facebook-logo.svg" alt="facebook ">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="footer-copyright text-center py-3 ">
                    <span id="copyright"></span> <a href="#! ">Privacy</a> - <a href="#! ">Terms of
                        Use</a> - <a href="#! ">Disclaimers</a>
                </div>
            </div>
        </footer>
    </div>
    <!--============================= JS =============================-->

    <script src="https://code.jquery.com/jquery-3.5.1.min.js "></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js "></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js "></script>
    <script src="assets/js/reservations.js"></script>

    <!--============================= VARI SCRIPTS =============================-->

    <script>
    </script>



</body>

</html>