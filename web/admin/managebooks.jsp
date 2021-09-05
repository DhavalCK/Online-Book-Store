
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        
    </head>
    <body style="background: url('../images/bg4.jpg'); background-size: cover;">
        <%@include file="header.jsp" %>
        <div class="d-flex ">

            <%@include file="sidebar.jsp" %>
            <div class="col-lg-10 m-0 p-0">
                <div class="container mt-3 mb-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <%
                    String msg = request.getParameter("msg");
                    if(msg.equals("update"))
                    {
                    out.println("<div class='alert alert-success alert-dismissible fade show' role='alert'>");
                    out.println("<strong>Book Details is Successfully Updated.</strong>");
                    out.println("</div>");
                    }
                    else if(msg.equals("remove"))
                    {
                    out.println("<div class='alert alert-primary alert-dismissible fade show' role='alert'>");
                    out.println("<strong>Book is Successfully Remove.</strong>");
                    out.println("</div>");
                    }
                    %>
                            <div class="table-responsive mt-2">
                                <table class="table table-bordered table-striped text-center table-light table-hover">
                                    <thead style="font-size: 18px;">
                                        <tr>
                                            <td colspan="10"><h1 class="text-center text-info m-0">All Books</h1></td>
                                        </tr>
                                        <tr>
                                            <th>Image</th>
                                            <th>Book Id</th>
                                            <th>Book Title</th>
                                            <th>Category</th>
                                            <th>Author</th>
                                            <th>Publisher</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                            <th colspan="2">
                                                <a href="" class=""><i class="fas fa-pen"></i>&nbsp;&nbsp;Action</a>
                                            </th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    <%
                                    String admin = (String) session.getAttribute("admin");
//                                    out.print(admin);
//                                    if(admin.equals(null))
//                                    {
//                                        respond.sendRedirect("../index.html");
//                                    }
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store", "root", "");
                                        PreparedStatement psbd;
                                        psbd = con.prepareStatement("select * from books");
                                        ResultSet rsbd;
                                        rsbd = psbd.executeQuery();
                                        while(rsbd.next())
                                        {
                                    %>
                                        <tr>
                                            <td><img src="../<%=rsbd.getString(8)%>" width="125px;"></td>
                                    <td><%=rsbd.getString(1)%></td>
                                    <td><%=rsbd.getString(2)%></td>
                                    <td><%=rsbd.getString(3)%></td>
                                    <td><%=rsbd.getString(4)%></td>
                                    <td><%=rsbd.getString(5)%></td>
                                    <td><%=rsbd.getString(6)%></td>
                                    <td><%=rsbd.getString(7)%></td>
                                    <td><a class="btn btn-primary" href="addBook.jsp?msg=nothing&bid=<%=rsbd.getString(1)%>">Edit</a></td>
                                    <td><a class="btn btn-danger" href="removeBook.jsp?bid=<%=rsbd.getString(1)%>&AMP;rmbookurl=<%=request.getRequestURI()%>">Remove</a></td>
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
