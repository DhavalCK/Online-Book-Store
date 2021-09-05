
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Books</title>
        <link rel="stylesheet" href="css/books_style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        

    </head>
    <body>

        <%@include file="navuser.jsp" %>
        <% String ctg = request.getParameter("ctg"); %>
        <div style="height: 18vh;"></div>
        <div style="display: flex;">
            <!--Category-->
            <div class="ctgbar">
                <h1 class="p-2 text-info">Select Category</h1>
                <ul class="list-group col-lg-12 pr-0" style="color:black;">
                    <li class="list-group-item lgi1 <% if(ctg.equals("All")){out.print("active");}%> p-2" style="background-color:lightgray;"><a href="books.jsp?ctg=All">All</a></li>
                    <%
                        try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store","root","");
            PreparedStatement ps1;
            String sql1 = "select * from category";
            
            ps1 = con.prepareStatement(sql1);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next())
            {
               
             %>
                    <li class="list-group-item lgi1 <% if(ctg.equals(rs1.getString(2))){out.print("active");}%> p-2" style="background-color:lightgray;"><a href="books.jsp?ctg=<%=rs1.getString(2)%>"><%=rs1.getString(2)%></a></li>

<% }//end of while who listed out category
%>               </ul>
               
            </div>
                
            <!--bookbox-->    
            <div class="row ml-0 bookbox" >
            <div class="col-lg-12 p-2 mb-2 text-center btitle"><h1><%=ctg%> Books </h1></div>
                
                <%  PreparedStatement ps;
            String sql;
            
            if(ctg.equals("All"))
            {
                sql = "select * from books";
            }
            else
            {
                sql = "select * from books where category ='"+ctg+"'";
                
            }
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
            %>
                <div class="col-lg-3 mb-4" >
                    <div class="card-deck" >
                        <div class="card" style="border:2px solid lightsteelblue;">
                            
                            <img class="imgbook" src=<%out.print(rs.getString(8));%> style="height:290px;" class="card-img-top">
                           
                            <div class="card-body pr-2" style="color: black; height: 243px;">
                                <h3 class="text-center"><span class="hid_text font-weight-bold"><%out.print(rs.getString(2));%></span> </h3>
                                <div>
                                    <span><strong>Category :</strong></span><span class="p-2 text-right"><%out.print(rs.getString(3));%></span>
                                </div>
                                <div>
                                    <span><strong>Author :</strong></span><span class="p-2 text-right"><%out.print(rs.getString(4));%></span><br>
                                </div>
                                <div>
                                    <span><strong>Publisher :</strong></span><span class="p-2 text-right"><%out.print(rs.getString(5));%></span><br>
                                </div>
                                <div>    
                                    <span><strong>Quantity :</strong></span><span class="p-2 text-right"><%out.print(rs.getString(6));%></span><br>
                                </div>
                                <div>
                                    <span><strong>Price :</strong></span><span class="p-2 text-right"><%out.print(rs.getString(7));%></span><br>
                                </div>  
                                
                            </div>
                                    <%
                                        PreparedStatement psb;
                                        String sqlb = "select * from cart";
                                        psb = con.prepareStatement(sqlb);
                                        ResultSet rsb = psb.executeQuery();
                                        boolean flag = false;
                                        while(rsb.next())
                                        {
                                        if(rsb.getInt(2)==rs.getInt(1))
                                        {
                                            flag = true;
                                        }
                                        }
                                        if(flag)
                                        {
                                     %>
                                        <a href="addCart.jsp?bid=<%=rs.getInt(1)%>&AMP;bookurl=<%=request.getRequestURI()+"?ctg="+ctg%>&AMP;add=no" class="bg-danger text-white p-2 text-center">Remove</a>
                            
                                     <%
                                        }
                                        else
                                        {
                                     %>
                                            <a href="addCart.jsp?bid=<%=rs.getInt(1)%>&AMP;bookurl=<%=request.getRequestURI()+"?ctg="+ctg%>&AMP;add=yes" class="bg-success text-white p-2 text-center">Add To Cart</a>
                                     <%
                                        }
                                     %>
                                   
                                    
                                    <%--<%!void add(){  out.println(cart);    }%>--%>
                            
                        </div>
                    </div>
                </div>
            <%
            }//end of while
            }//end of try
            catch(Exception e)
            {
                out.print(e);
            }
            %>

            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>