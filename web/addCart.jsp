
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AddCart Page</title>
    </head>
    <body>


    </body>
</html>
<%
    String a = request.getParameter("bookurl");
    String curl = a.substring(9, a.length());
    String bid = request.getParameter("bid");
    String add = request.getParameter("add");
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store", "root", "");
        PreparedStatement ps, ps1,psbd;
        psbd = con.prepareStatement("select * from books where bookid = ?");
        psbd.setString(1,bid);
        ResultSet rsbd = psbd.executeQuery();
        rsbd.next();
        out.print(rsbd.getString(2));
        String user = (String) session.getAttribute("userid");
        if (add.equals("yes")) {
            ps = con.prepareStatement("insert into cart values(?,?,?,?,?,?,?)");
            ps.setString(1, user);
            ps.setString(2, bid);
            ps.setInt(3,1);
            ps.setInt(4,rsbd.getInt(6));
            ps.setString(5,rsbd.getString(2));
            ps.setFloat(6,rsbd.getInt(7));
            ps.setFloat(7,rsbd.getInt(7));
            ps.executeUpdate();
            out.println(add);
            response.sendRedirect(curl);
        }
        if (add.equals("no")) {
            ps1 = con.prepareStatement("delete from cart where bookid = ? and userid = ?");
            ps1.setString(1, bid);
            ps1.setString(2, user);
            ps1.executeUpdate();
            out.println(add);
            if(curl.equals("cart.jsp"))
            {
                response.sendRedirect(curl+"?msg=nomsg");
            }
            else
            {
                response.sendRedirect(curl);
            }
        }
    } catch (Exception e) {
        out.print(e);
    }
    
%>