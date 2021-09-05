<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Poppins:300,400,500,700" rel="stylesheet">
    </head>
    <body style="background: url('images/bg4.jpg'); background-size: cover;">
        <%@include file="navuser.jsp" %>
        <%  try
            {
            String userid = (String) session.getAttribute("userid");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store","root","");
            PreparedStatement ps;
            userid = "'"+userid+"'";
            String sql = "select * from user where email="+userid+"";
            
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
        %>
        <div style="height: 15vh"></div>
        <div class='container target mt-5 mb-5'>
            <br>
            <div class='row'>
                <div class='col-lg-6 m-auto'>
                    <ul class='list-group p-4 border border-dark rounded' style='color:black; background-image: linear-gradient(to right,#6190e8,#a7bfe8);  font-family: "Open Sans";'>
                        <li class='p-3 text-muted'><h1 class='text-center font-weight-bold border-bottom' style='color:black;'>My Profile</h1></li>
                        <li class='p-3 text-muted lead font-weight-normal' contenteditable='false'>Personal details</li>
                        <li class='p-3 text-right'><span class='pull-left'><strong>First Name:
                                </strong></span><% out.println(rs.getString(1)); %></li>
                        <li class='p-3 text-right'><span class='pull-left'><strong>Last Name:
                                </strong></span><% out.println(rs.getString(2)); %></li>
                        <li class='p-3 text-right'><span class='pull-left'><strong>Email:
                                </strong></span><% out.println(rs.getString(4)); %></li>
                        
                        <li class='p-3 text-muted lead font-weight-normal' contenteditable='false'>Contact details</li>
                        <li class='p-3 text-right'><span class='pull-left'><strong>Phone Number:
                                </strong></span><% out.println(rs.getString(3)); %></li>
             
                    </ul>
                </div> 
            </div>
        </div>
        <%
            }
            catch(Exception e)
            {
                out.print(e);
            }
        %>
        <%@include file="footer.html" %>
    </body>
</html>
