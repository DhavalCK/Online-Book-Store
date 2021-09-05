
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us Page</title>
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
                                            <li><a href="about.jsp">About us</a> </li>
                                            <li class="active"><a href="contactus.jsp">Contact us</a></li>
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
      Contact Section
    ============================-->
    <section id="contact" style="background-color: windowframe" class="col-8 m-auto">
      <div class="container wow fadeInUp">
        <div class="section-header">
          <h1 class="section-title text-center p-3">Contact</h1>
          <p class="section-description"></p>
        </div>
      </div>
      <div class="container wow fadeInUp">
        <div class="row justify-content-center">

          <div class="col-lg-5 col-md-4">

              <div class="info" >
              <div class="p-2">
                <i class="fa fa-map-marker"></i>
                <p style="font-size: 20px;">Online Book Store<br>Gujarat, India</p>
              </div>

              <div class="p-2">
                <i class="fa fa-envelope"></i>
                <p style="font-size: 20px;">onlinebookstore@gmail.com</p>
              </div>

              <div class="p-2">
                <i class="fa fa-phone"></i>
                <p style="font-size: 20px;">+91 5589 55488 55</p>
              </div>
            </div>
          </div>

          <div class="col-lg-5 col-md-8">
            <form action="insContactUs" method="post">
            <div class="form-group">
                  <input type="text" name="name" class="form-control" placeholder="Your Name" >
            </div>
            <div class="form-group">
                  <input type="email" class="form-control" name="email"placeholder="Your Email">
                  
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="subject" placeholder="Subject">
                 
                </div>
                <div class="form-group">
                  <textarea class="form-control" name="message" rows="5"placeholder="Message"></textarea>
                 </div>
            <div class="form-group">
              <input type="submit" name="submit" value="Send Message" style="
  background: #2dc997;
  border: 0;
  padding: 10px 24px;
  color: #fff;
  transition: 0.4s;"> 
            </div>
                
            </form>
            
          </div>

        </div>

      </div>
    </section><!-- #contact -->

  </main>
<!--<div style="height: 3vh;"></div>-->
              <%@include file="footer.html" %>

    </body>
</html>
