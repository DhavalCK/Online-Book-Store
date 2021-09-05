<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Placed</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Poppins:300,400,500,700" rel="stylesheet">
        <style>
            .tbox{
                background: antiquewhite;
                border-radius: 10px;
                margin-bottom: 50px;
                padding: 20px;
            }
        </style>
    </head>
    <body style="background: url('images/bg4.jpg'); background-size: cover;">
        <%@include file="navuser.jsp" %>
        <div style="height: 20vh"></div>
        <%  try {
                int i = 1;
                String userid = (String) session.getAttribute("userid");
                userid = "'" + userid + "'";
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String contact = request.getParameter("contact");
                String address = request.getParameter("address");
                String pmode = request.getParameter("pmode");
                String books = request.getParameter("books");
                String grand_total = request.getParameter("grand_total");

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store", "root", "");
                PreparedStatement ps;
                String sql = "insert into orders (userid,name,email,contact,address,pmode,books,grand_total) values(?,?,?,?,?,?,?,?)";
                ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

                ps.setString(1, userid);
                ps.setString(2, name);
                ps.setString(3, email);
                ps.setString(4, contact);
                ps.setString(5, address);
                ps.setString(6, pmode);
                ps.setString(7, books);
                ps.setString(8, grand_total);
                int q = ps.executeUpdate();
        %> 
        <div class="container">
            <div class="row justify-content-center">
                <div class="tbox col-6 px-4 pb-4">
                    <div class="text-center">
                        <h1 class="display-4 mt-2 text-danger">Thank You!</h1>
                        <h2 class="text-success">Your Order Placed Successfully!</h2>
                        <h4 class="bg-danger text-light rounded p-2 mb-2">Books Purchased :<%=books%> </h4>
                        <h4>Your Name : <%=name%></h4>
                        <h4>Your Email : <%=email%></h4>
                        <h4>Your Contact : <%=contact%></h4>
                        <h4>Your Total Amount Paid : <%=grand_total%></h4>
                        <h4>Your Payment Mode : <%=pmode%></h4>
                    </div>
                </div>
            </div>
        </div>
        <%
            } catch (Exception e) {
                out.print(e);
            }
        %>
        <div style="height: 20vh;"></div>
        <%@include file="footer.html" %>
    </body>
</html>