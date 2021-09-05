
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    String bid = request.getParameter("bid");
    String maxqty = request.getParameter("maxqty");
    String incdec = request.getParameter("incdec");
    String strqval = request.getParameter("qval");
    float price = Float.parseFloat(request.getParameter("price"));
    float total = 0;
    int qval = Integer.parseInt(strqval);
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store", "root", "");
        PreparedStatement ps, ps1;
        String user = (String) session.getAttribute("userid");
        
        if (strqval.equals(maxqty) && incdec.equals("inc"))
        {
            response.sendRedirect("cart.jsp?msg=max");
        }
        else if(incdec.equals("inc"))
        {
            qval = (qval + 1) ;
            total = price * qval ;
            
            ps = con.prepareStatement("update cart set qty = ? , totalprice = ? where bookid = ? and userid = ?");
            ps.setInt(1, qval);
            ps.setFloat(2, total);
            ps.setString(3, bid );
            ps.setString(4,user);
            ps.executeUpdate();
            out.println(price+"  Total :"+total + " Quntity" +qval+"MAxquntity"+maxqty +"Bookid " +bid+ " USer " + user+ " incdec:" +incdec);
            response.sendRedirect("cart.jsp?msg=nomsg");
        }
        if (strqval.equals("1") && incdec.equals("dec")) {
            response.sendRedirect("cart.jsp?msg=only1");
        }
        else if(incdec.equals("dec")){
            qval = (qval - 1) ;
            total = price * qval ;
            ps1 = con.prepareStatement("update cart set qty = ? , totalprice = ? where bookid = ? and userid = ?");
            ps1.setInt(1, qval);
            ps1.setFloat(2, total);
            ps1.setString(3, bid );
            ps1.setString(4,user);
            ps1.executeUpdate();
            out.println(price+"  "+total + " " +qval+" " +bid+ " " + user+ " " +incdec);
            response.sendRedirect("cart.jsp?msg=nomsg");
        }
    } catch (Exception e) {
        out.print(e);
    }
    
%>