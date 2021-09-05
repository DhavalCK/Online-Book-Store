<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Poppins:300,400,500,700" rel="stylesheet">
    </head>
    <body style="background: url('images/bg4.jpg'); background-size: cover;">
        <%@include file="navuser.jsp" %>
        <div style="height:20vh"></div>
        <%  try
            {
            String userid = (String) session.getAttribute("userid");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store","root","");
            PreparedStatement ps;
            userid = "'"+userid+"'";
            String sql = "select * from cart where userid="+userid+"";
            
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            String books_name="";
            float grand_total = 0;
            int i = 1;
        %>
        <% while(rs.next())
           {
               books_name = books_name + i++ + ". " + rs.getString(5) + "  ";
               grand_total = grand_total + rs.getFloat(7);
           }
        %>
                        
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-6 px-4 pb-4">
                    <h3 class="text-center text-info p-2">Complete Your Order!</h3>
                    
                    <div class="jumbotron p-3 mb-2 text-center">
                        <h4><strong>Books : </strong><%=books_name%></h4>
                        
                        <h4><b>Delivery Charge : </b>Free</h4>
                        <h4><b>Total Payable Amount : </b> <%=grand_total%>/-</h4>
                    </div>
                    <form action="orderplaced.jsp" method="post" id="placeOrder">
                        <input type="hidden" name="books" value="<%=books_name%>">
                        <input type="hidden" name="grand_total" value="<%=grand_total%>">
                        <div class="form-group">
                            <input type="text" name="name" class="form-control" placeholder="Enter Name" required>
                        </div>
                        <div class="form-group">
                            <input type="text" name="email" class="form-control" placeholder="Enter Email" required>
                        </div>
                        <div class="form-group">
                            <input type="number" name="contact" class="form-control" placeholder="Enter Contact Number" required>
                        </div>
                        <div class="form-group">
                            <textarea name="address" class="form-control" rows="3" cols="10" placeholder="Enter Delivery Address Here..."></textarea>
                        </div>
                        <h6 class="text-center lead">Select Payment Mode </h6>
                        <div class="form-group">
                            <select name="pmode" class="form-control p-0">
                                <option value="hi" selected disabled>-Select Payment Method-</option>
                                <option value="Cash On Delivery">Cash On Delivery</option>
                                <option value="Net Banking">Net Banking</option>
                                <option value="Debit/Credit Cards">Debit/Credit Cards</option>
                                
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" value="Place Order" class="btn btn-danger btn-block">
                        </div>   
                            
                    </form>
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
