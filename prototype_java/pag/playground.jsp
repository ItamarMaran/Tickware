<%-- 
    Document   : playground
    Created on : 21/10/2019, 02:05:45
    Author     : maran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!--My config-->
    <link rel="shortcut icon" href="../img/tkwr_favicon.png" />
    <link rel="stylesheet" type="text/css" href="../css/index_css.css">
    <script src='main.js'></script>
    <!--My config-->

    <!--BootStrap-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!--BootStrap-->

    <title>Tickware</title>
</head>

<body>
    <header>
        <nav class="navbar navbar-dark bg-dark">
            <ul class="nav">
                <li>
                    <a href="http://www.tickware.com.br"><img class="tkwr-img" src="../img/tkwr_white.png"></a>
                </li>
                <li class="nav-item">
                    <a href="tecno.jsp" class="nav-link active">Technologies</a>
                </li>
                <li class="nav-item">
                    <a href="about.jsp" class="nav-link active">About</a>
                </li>
                <li class="nav-item light">
                    <a href="../index.jsp" class="nav-link" href="#">Sign in</a>
                </li>
                <li class="nav-item">
                    <a href="login.jsp">
                        <button type="button" class="btn btn-outline-light">Sign up</button>
                    </a>
                </li>
            </ul>
        </nav>
    </header>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-8">
                    <a href="http://www.tickware.com.br"><img class="tkwr-img" src="../img/tkwr_white.png"></a>
                </div>
                <div class="col-4">
                    <h4>Our Product</h4>

                    <ul style="list-style-type: none;">
                        <li>Beer'n'Match</li>
                        <li>Home Nail</li>
                        <li>Show de Quadra</li>
                    </ul>
                    <h4>Join us</h4>
                    <ul style="list-style-type: none;">
                        <li>Back-end</li>
                        <li>Front-end</li>
                        <li>Data cientist</li>
                    </ul>

                    <h4>Follow us</h4>
                    <ul class="list-style-none d-flex flex-items-center mb-3 mb-sm-0 lh-condensed-ultra nav">
                        <li class="mr-3">
                            <a href="#" data-ga-click="Footer, go to Twitter, text:twitter" title="Tickware on Twitter" style="color: #959da5;">
                                <svg viewBox="0 0 273.5 222.3" class="d-block" height="18">
                                    <path d="M273.5 26.3a109.77 109.77 0 0 1-32.2 8.8 56.07 56.07 0 0 0 24.7-31 113.39 113.39 0 0 1-35.7 13.6 56.1 56.1 0 0 0-97 38.4 54 54 0 0 0 1.5 12.8A159.68 159.68 0 0 1 19.1 10.3a56.12 56.12 0 0 0 17.4 74.9 56.06 56.06 0 0 1-25.4-7v.7a56.11 56.11 0 0 0 45 55 55.65 55.65 0 0 1-14.8 2 62.39 62.39 0 0 1-10.6-1 56.24 56.24 0 0 0 52.4 39 112.87 112.87 0 0 1-69.7 24 119 119 0 0 1-13.4-.8 158.83 158.83 0 0 0 86 25.2c103.2 0 159.6-85.5 159.6-159.6 0-2.4-.1-4.9-.2-7.3a114.25 114.25 0 0 0 28.1-29.1" fill="currentColor"></path>
                                </svg>
                            </a>
                        </li>
                        <li class="mr-3">
                            <a href="#" data-ga-click="Footer, go to Facebook, text:facebook" title="Tickware on Facebook" style="color: #959da5;">
                                <svg viewBox="0 0 15.3 15.4" class="d-block" height="18">
                                    <path d="M14.5 0H.8a.88.88 0 0 0-.8.9v13.6a.88.88 0 0 0 .8.9h7.3v-6h-2V7.1h2V5.4a2.87 2.87 0 0 1 2.5-3.1h.5a10.87 10.87 0 0 1 1.8.1v2.1h-1.3c-1 0-1.1.5-1.1 1.1v1.5h2.3l-.3 2.3h-2v5.9h3.9a.88.88 0 0 0 .9-.8V.8a.86.86 0 0 0-.8-.8z" fill="currentColor"></path>
                                </svg>
                            </a>
                        </li>
                        <li class="mr-3">
                            <a href="#" data-ga-click="Footer, go to Linkedin, text:linkedin" title="Tickware on Linkedin" style="color: #959da5;">
                                <svg viewBox="0 0 19 18" class="d-block" height="18">
                                    <path d="M3.94 2A2 2 0 1 1 2 0a2 2 0 0 1 1.94 2zM4 5.48H0V18h4zm6.32 0H6.34V18h3.94v-6.57c0-3.66 4.77-4 4.77 0V18H19v-7.93c0-6.17-7.06-5.94-8.72-2.91z" fill="currentColor"></path>
                                </svg>
                            </a>
                        </li>
                        <li class="mr-3">
                            <a href="#" data-ga-click="Footer, go to YouTube, text:youtube" title="Tickware on YouTube" style="color: #959da5;">
                                <svg viewBox="0 0 19.17 13.6" class="d-block" height="16">
                                    <path d="M18.77 2.13A2.4 2.4 0 0 0 17.09.42C15.59 0 9.58 0 9.58 0a57.55 57.55 0 0 0-7.5.4A2.49 2.49 0 0 0 .39 2.13 26.27 26.27 0 0 0 0 6.8a26.15 26.15 0 0 0 .39 4.67 2.43 2.43 0 0 0 1.69 1.71c1.52.42 7.5.42 7.5.42a57.69 57.69 0 0 0 7.51-.4 2.4 2.4 0 0 0 1.68-1.71 25.63 25.63 0 0 0 .4-4.67 24 24 0 0 0-.4-4.69zM7.67 9.71V3.89l5 2.91z" fill="currentColor"></path>
                                </svg>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="copyRight">
            &copy; 2019 Tickware, Inc.
        </div>
    </footer>
</body>

</html>
