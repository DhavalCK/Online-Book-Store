<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home Page</title>
    </head>
    <body>
        <%@include file="navuser.jsp" %>
        
        <section class="slider_section">
            <div id="myCarousel" class="carousel slide banner-main" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="first-slide" src="images/banner.jpg" alt="First slide">
                        <div class="container">
                            <div class="carousel-caption relative">
                                <h1>Welcome to Our Website</h1>
                                <p></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <%@include file="footer.html" %>
    </body>
</html>
