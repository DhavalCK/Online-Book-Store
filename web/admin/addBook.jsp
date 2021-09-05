<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            td{
                margin: 10px 0;

            }
        </style>

    </head>
    <body style="background: url('../images/bg4.jpg'); background-size: cover;">
        <%@include file="header.jsp" %>
        <div class="d-flex ">
            <%@include file="sidebar.jsp" %>
            <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store", "root", "");
                    PreparedStatement psctg;
                    psctg = con.prepareStatement("select * from category");
                    ResultSet rsctg = psctg.executeQuery();
                    
                String bid = request.getParameter("bid");
                    PreparedStatement ps;
                    ps = con.prepareStatement("select * from books where bookid = " + bid);
                    ResultSet rs = ps.executeQuery();
                    rs.next();
                    
                    
            %>
            <div class="col-lg-10 m-0 p-0">
                <div class="col-lg-8 mx-auto mt-3 border border-dark">
                    <%
                    String msg = request.getParameter("msg");
                    if(msg.equals("add"))
                    {
                    out.println("<div class='alert alert-success alert-dismissible fade show' role='alert'>");
                    out.println("<strong>New Book is Added</strong>");
                    out.println("</div>");
                    }
                    %>
                    <form action="../updatebook" method="post" enctype="multipart/form-data">
                        <table class="w-100" style="font-size: 20px">
                            <tr colspan="2">
                            <h2 class="text-center">Add Book Details</h2>
                            </tr>
                            <tr>
                                <td class="w-25 my-2"><span>Title : </span></td>
                                <td><input type="text" name="title" class="w-75 h-25 my-2" value="<%if(bid!=null){out.print(rs.getString(2));}%>" required></td>
                            </tr>
                            <tr>
                                 <!--" + if(bid!=null && ctgn.equals(rsctg.getString(2))){ out.print("seleccted");}+"-->
                                <td class="w-25 my-2"><span>Category : </span></td>
                                <td><select name="ctg" class="w-75 h-25 my-2" required>
                                        <%if(bid==null){
                                            out.print("<option value='' selected disabled>-Select Category-</option>");
                                            while (rsctg.next()) {
                                                out.print("<option value=" + rsctg.getString(2) + ">" + rsctg.getString(2) + "</option>");
                                            }
                                        }
                                        else if(bid!=null){
                                            while (rsctg.next()) {
                                                if(rsctg.getString(2).equals(rs.getString(3)))
                                                {
                                                    out.print("<option value=" + rsctg.getString(2) + " selected>" + rsctg.getString(2) + "</option>");
                                                
                                                }
                                                else
                                                {
                                                out.print("<option value=" + rsctg.getString(2) + ">" + rsctg.getString(2) + "</option>");
                                                }
                                            }
                                        }
                                            
                                        %>
                                    </select></td>
                            </tr>
                            <tr>
                                <td class="w-25 my-2"><span >Author : </span></td>
                                <td><input type="text" name="author" class="w-75 h-25 my-2" value="<%if(bid!=null){out.print(rs.getString(4));}%>" required></td>
                            </tr>
                            <tr>
                                <td class="w-25 my-2"><span >Publisher : </span></td>
                                <td><input type="text" name="publisher" class="w-75 h-25 my-2" value="<%if(bid!=null){out.print(rs.getString(5));}%>" required></td>
                            </tr>
                            <tr>
                                <td class="w-25my-2"><span>Quantity : </span></td>
                                <td><input type="number" name="quantity"class="w-75 h-25 my-2" value="<%if(bid!=null){out.print(rs.getString(6));}%>" required></td>
                            </tr>
                            <tr>
                                <td class="w-25 my-2"><span>Price : </span></td>
                                <td><input type="number" name="price" class="w-75 h-25 my-2" value="<%if(bid!=null){out.print(rs.getString(7));}%>" required></td>
                            </tr>
                            <%
                                if(bid==null)
                                {%>
                            <tr>
                                <td class="w-25 my-2"><span style="font-size: 20px;">Upload Image : </span></td>
                                <td><input type="file" name="imgbook" class="w-75 h-25 my-2" value="" required></td>
                            </tr>
                                <%}%>


                        </table>
                        <%if(bid!=null)
                        {%>
                        <input type="hidden" name="bid" value=<%=bid%> >
                        <input class="w-100 my-4 btn btn-success" type="submit" name="add" value="Update">
                        <%}
                        else
                        {
                        %>
                        <input class="w-100 my-4 btn btn-success" type="submit" name="add" value="Add">
                        <%
                        }
                        %>

                    </form>
                </div>
            </div>
        </div>
        <%             } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
<script type="text/javascript">
//$(function()
//{
//    $('#fileUpload').on('change',function ()
//    {
//        var filePath = $(this).val();
//        alert(filePath);
//        consol.log(filePath);
//    });
//});

var path = URL.createObjectURL(event.target.files[0]);
console.log(path);
alert(path);
</script>