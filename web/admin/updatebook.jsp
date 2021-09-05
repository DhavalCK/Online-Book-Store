
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.annotation.MultipartConfig" %>
<%@page import="javax.servlet.http.Part" %>
<%
//    @WebServlet("/updatebook.jsp")
    @MultipartConfig(fileSizeThreshold = 1024 *1024 * 2,
            maxFileSize = 1024 *1024 * 10,
            maxRequestSize = 1024 *1024 * 50)
    %>
<%--<%@page import="org.apache.commons.fileupload.*" %>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Book</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            Part part = request.getPart("imgbook");
            //String fileName = extractFileName(part);
            out.print(part);
            
            
            //upload.setSizeMax(maxFileSize);
//            String str = request.getParameter("imgbook");
//            out.print(str);
//            File bimg = new File(request.getParameter("imgbook"));
//            String path = bimg.getAbsolutePath();   
//            out.print(path);
            
            
            //File img = request.getParameter("bookimg");
            //out.print(str);
            
            %>
            
    </body>
</html>
