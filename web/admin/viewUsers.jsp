
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background: url('../images/bg4.jpg'); background-size: cover;">
        <%@include file="header.jsp" %>
        <div class="d-flex ">
            <%@include file="sidebar.jsp" %>
            <div class="col-lg-10 m-0 p-0">
                <div class="container mt-3 mb-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="table-responsive mt-2">
                                <table class="table table-bordered table-striped text-center table-light table-hover">
                                    <thead style="font-size: 18px;">
                                        <tr>
                                            <td colspan="10"><h1 class="text-center text-info m-0">All Users</h1></td>
                                        </tr>
                                        <tr>
                                            <th colspan="2">Name</th>
                                            <th rowspan="2">Contact</th>
                                            <th rowspan="2">Email</th>
                                            <th rowspan="2">Password</th>
                                        </tr>
                                        <tr>
                                            <th>First</th>
                                            <th>Last</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                    String admin = (String) session.getAttribute("admin");

                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store", "root", "");
                                        PreparedStatement psu;
                                        psu = con.prepareStatement("select * from user");
                                        ResultSet rsu;
                                        rsu = psu.executeQuery();
                                        while(rsu.next())
                                        {
                                    %>
                                        <tr>
                                            <td><%=rsu.getString(1)%></td>
                                    <td><%=rsu.getString(2)%></td>
                                    <td><%=rsu.getString(3)%></td>
                                    <td><%=rsu.getString(4)%></td>
                                    
                                    <td><%=rsu.getString(5)%></td>
                                        </tr>
                                    
                                    <%
                                        }
                                    }
                                    catch(Exception e)
                                    {
                                    out.print(e);
                                    }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </body>
</html>
