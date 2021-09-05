
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/style.css">

        <title>Admin Panel</title>
        <style>
            .dbox{
                background-image: linear-gradient(
45deg
, rgb(100 25 241), #ec11c7ab);
                border-radius: 10px;
                width: 30%;
                border: 1px solid black;
                padding: 40px;
                margin: 45px 80px;
                text-align: center;
            }
            h2{
                color: white!important;
            }
        </style>
    </head>
    <body style="background: url('../images/bg4.jpg'); background-size: cover;">
        <%@include file="header.jsp" %>
        <div class="d-flex ">
            <%@include file="sidebar.jsp" %>
            <div class="col-lg-10 m-0 p-0">
                <div class="w-100 text-center p-3 mb-2 border-bottom">
                    <h1>Welcome Admin</h1>
                </div>
            <%    try
            {
            String admin = (String) session.getAttribute("admin");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store","root","");
            PreparedStatement ps ,ps1 ,ps2;
            ResultSet rs ,rs1,rs2;
            
            ps = con.prepareStatement("select count(*) from user");
            rs = ps.executeQuery();
            rs.next();
            ps1 = con.prepareStatement("select count(*) from orders");
            rs1 = ps1.executeQuery();
            rs1.next();
            ps2 = con.prepareStatement("select count(*) from books");
            rs2 = ps2.executeQuery();
            rs2.next();
            %>
                <div class="d-flex">
                    <div class="dbox">
                        <h2><b>Total Users : </b><%=rs.getInt(1)%></h2>
                    </div>
                    <div class="dbox">
                        <h2><b>Total Orders : </b><%=rs1.getInt(1)%></h2>
                    </div>
                </div>
                <div class="d-flex">
                    <div class="dbox">
                        <h2><b>Total Books : </b><%=rs2.getInt(1)%></h2>
                    </div>
                </div>
                <%
            }
            catch(Exception e)
                    {
                    out.println(e);
                    }
                    %>
            </div>
        </div>
    </body>
</html>
