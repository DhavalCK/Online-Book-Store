
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us Page</title>
    </head>
    <body class="home_page" style="background:url('images/banner.jpg'); background-size: cover;">
               <%--<%@include file="navhome.html" %>--%>
<header style="height: 20vh;">
            <div class="header">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-3 col-lg-2 col-md-3 col-sm-3 col">
                            <div class="full">
                                <div>
                                    <div class="logo"> <h1><a href="index.html">Online Book Store</a></h1> </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-11 col-lg-9 col-md-9 col-sm-9">
                            <div>
                                <div>
                                    <nav class="main-menu">
                                        <ul class="menu-area-main">
                                            <li> <a href="index.html">Home</a> </li>
                                            <li><a href="sign_up.html">Sign Up</a></li>
                                            <li class="active"><a href="about.jsp">About us</a> </li>
                                            <li><a href="contactus.jsp">Contact us</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </header>

               
<main id="main">

    <!--==========================
      About Us Section
    ============================-->
    <section id="about">
      <div class="container my-5">
        <div class="row about-container bg-light border border">

          <div class="col-lg-6 content order-lg-1 order-2 p-3">
            <h2 class="title mb-2">Few Words About Us</h2>
            <p>
                Bookshop is an online bookstore with a mission to financially support local, independent bookstores.<br><br>
                We believe that bookstores are essential to a healthy culture. They’re where authors can connect with readers, where we discover new writers, where children get hooked on the thrill of reading that can last a lifetime. They’re also anchors for our downtowns and communities.<br><br>
                As more and more people buy their books online, we wanted to create an easy, convenient way for you to get your books and support bookstores at the same time.<br>
            </p>
          </div>

            <div class="col-lg-6 background order-lg-2 order-1 wow fadeInRight">
                <img src="images/about.png" class="mx-5">
            </div>
        </div>

      </div>
    </section><!-- #about -->
</main>
               <!--<div style="height: 3vh;"></div>-->
              <%@include file="footer.html" %>

    </body>
</html>
