<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body class="main-layout home_page">
    <header>
        <div class="header">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-3 col-lg-2 col-md-3 col-sm-3 col logo_section">
                            <div class="full">
                                <div class="center-desk">
                                    <div class="logo"> <h1><a href="index.html">Online Book Store</a></h1> </div>
                                </div>
                            </div>
                        </div>
                        <% 
                            String cururl = request.getRequestURI();
                        %>
                        <div class="col-xl-11 col-lg-9 col-md-9 col-sm-9">
                            <div class="menu-area">
                                <div class="limit-box">
                                    <nav class="main-menu">
                                        <ul class="menu-area-main">
                                            <li class="<% if(cururl.equals("/Project/user.jsp")){out.print("active");} %>"><a href="user.jsp">Home</a></li>
                                            <li class="<% if(cururl.equals("/Project/profile.jsp")){out.print("active");} %>"><a href="profile.jsp">Profile</a></li>
                                            <li class="<% if(cururl.equals("/Project/books.jsp")){out.print("active");} %>"><a href="books.jsp?ctg=All">Available Books</a></li>
                                            <li class="<% if(cururl.equals("/Project/cart.jsp")){out.print("active");} %>"><a href="cart.jsp?msg=nomsg">My Cart</a></li>
                                            <li class="<% if(cururl.equals("/Project/checkout.jsp")){out.print("active");} %>"><a href="checkout.jsp">Checkout</a></li>
                                            
                                            <li class="<% if(cururl.equals("/Project/about.jsp")){out.print("active");} %>"><a href="about.jsp">About us</a> </li>
                                            <li class="<% if(cururl.equals("/Project/contactus.jsp")){out.print("active");} %>"><a href="contactus.jsp">Contact us</a></li>
                                            <li><a href="LogoutServlet">Logout</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        