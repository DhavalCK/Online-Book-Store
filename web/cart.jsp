
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <style>
            body{
                //background-image: url("images/bg3.jpg")!important;
                background-size: cover;
            }    
        </style>
    </head>
    <body>
        <%@include file="navuser.jsp" %>
        <div style="height: 18vh;"></div>
        <div class="row text-center">
            
                
            <% String msg = request.getParameter("msg");
                if(msg.equals("only1"))
                {
                    out.print("<div class='col-12 bg-warning p-3'><h3 class='p-0'>There is only one Quntity! So click on remove!</h3></div>");
                }
                if(msg.equals("max"))
                {
                    out.print("<div class='col-12 bg-warning p-3'><h3 class='p-0'>There is no more Quntity availble of that Book!</h3></div>");
                }
             %>   
        </div>
        <div class="container mt-3 mb-5">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="table-responsive mt-2">
                        <table class="table table-bordered table-striped text-center table-secondary">

                            <thead>
                                <tr>
                                    <td colspan="7"><h4 class="text-center text-info m-0">Books in Your Cart</h4></td>
                                </tr>
                                <tr>
                                    <th>Serial No.</th>
                                    <th>Book Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total Price</th>
                                    <th>
                                        <a href="" class="badge-danger badge p-1"><i class="fas fa-trash"></i>&nbsp;&nbsp;Clear Cart</a>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                
                                <%
                                    String userid = (String) session.getAttribute("userid");
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store", "root", "");
                                        PreparedStatement psbid, psbd;
                                        String sqlbid = "select * from cart where userid ='" + userid + "'";
                                        psbid = con.prepareStatement(sqlbid);
                                        ResultSet rsbid, rsbd;
                                        rsbid = psbid.executeQuery();
                                        int i = 0;
                                        float grand_total = 0, total;
                                        while (rsbid.next()) {
                                            //String sqlbd = "select * from books where bookid = " + rsbid.getInt(2);
                                            //psbd = con.prepareStatement(sqlbd);
                                            //rsbd = psbd.executeQuery();
                                            //rsbd.next();
                                            out.println("<tr>");
                                            out.println("<td>" + ++i + "</td>");
                                            out.println("<td>" + rsbid.getString(5) + "</td>");
                                            out.println("<td><i class='fas fa-rupee-sign'></i>&nbsp" + rsbid.getString(6) + "</td>");

                                            out.println("<td><a href='quntitychange.jsp?bid="+rsbid.getString(2)+ "&maxqty="+rsbid.getString(4)+"&qval="+rsbid.getString(3)+"&price="+rsbid.getString(6)+"&incdec=dec'><i class='fas fa-minus-circle'></i></a>&nbsp&nbsp"
                                                    + rsbid.getInt(3) 
                                                    + "&nbsp&nbsp<a href='quntitychange.jsp?bid="+rsbid.getString(2)+ "&maxqty="+rsbid.getString(4)+"&qval="+rsbid.getString(3)+"&price="+rsbid.getString(6)+"&incdec=inc'><i class='fas fa-plus-circle'></i></a></td>");
                                            
                                            total = rsbid.getFloat(7) ;
                                            out.println("<td><i class='fas fa-rupee-sign'></i>&nbsp" + rsbid.getString(7) + "</td>");
                                            out.println("<td><a href='addCart.jsp?bid=" + rsbid.getString(2) + "&AMP;bookurl=" + request.getRequestURI() + "&add=no' class='text-danger lead'>Remove&nbsp&nbsp<i class='fas fa-trash-alt'></i></a></td>");

                                            out.println("</tr>");
                                            grand_total = grand_total + total;
                                        }
                                %>
                                
                                <tr>
                                    <td colspan="2"><a href="books.jsp?ctg=All" class="btn btn-success"><i class="fa fa-cart-plus"></i>&nbsp;&nbsp;Continue Shopping</a></td>
                                    <td colspan="2"><b>Grand Total</b></td>
                                    <td><b><i class="fas fa-rupee-sign"></i>&nbsp;<%=grand_total%></b></td>
                                    <td><a href="checkout.jsp" class="btn btn-info"><i class="fas fa-credit-card"></i>&nbsp Checkout</a></td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
                            
        <div style="height: <%
        int h = 35;
        if(i==0){
        out.print(h);    
        }
        else if(i>0 && i<5)
        {
            h = h - i*8;
            out.print(h);
        }
        %>vh;">
                                
        </div>
        <%

                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                %>
        <%@include file="footer.html" %>
    </body>
</html>