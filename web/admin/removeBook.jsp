
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    String a = request.getParameter("rmbookurl");
    String mburl = a.substring(15, a.length());
    String bid = request.getParameter("bid");
    String admin = (String) session.getAttribute("admin");
    out.print("url "+a + " " + mburl + "bid" + bid);
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store", "root", "");
        PreparedStatement ps1;
        if(admin.equals("admin"))
        {
            ps1 = con.prepareStatement("delete from books where bookid = ?");
            ps1.setString(1, bid);
            ps1.executeUpdate();
            response.sendRedirect(mburl+"?msg=remove");
        }
        else
        {
            response.sendRedirect("../adminpanel.html");
        }
        
    } catch (Exception e) {
        out.print(e);
    }
    
%>