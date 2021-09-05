
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)

public class updatebook extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        ServletContext context = getServletContext();
        String driver = context.getInitParameter("driver");
        String dbcon = context.getInitParameter("db_connection");
        String imgpath = context.getInitParameter("img-path");

        //get value of submit button
        String btn = request.getParameter("add");
        out.print(btn);

        String title = request.getParameter("title");
        String ctg = request.getParameter("ctg");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        int quntity = Integer.parseInt(request.getParameter("quantity"));
        float price = Float.parseFloat(request.getParameter("price"));

        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(dbcon, "root", "");
            PreparedStatement ps, ps1;

//            out.print(part + "<br>");
//            out.println("Img :" + fileName + "<br>");
            //String savePath = "C:\\Users\\Raj kamariya\\Documents\\NetBeansProjects\\Project\\web\\images\\book\\" + File.separator + fileName;
//            String savePath = imgpath + File.separator + fileName;
            //           File fileSaveDir = new File(savePath);
            //   part.write(savePath + File.separator);
//            out.print(savePath);
            if (btn.equals("Add")) {
                Part part = request.getPart("imgbook");
                String fileName = extractFileName(part);

                ps = con.prepareStatement("insert into books (title,category,author,publisher,quantity,price,image) values(?,?,?,?,?,?,?)");
                ps.setString(1, title);
                ps.setString(2, ctg);
                ps.setString(3, author);
                ps.setString(4, publisher);
                ps.setInt(5, quntity);
                ps.setFloat(6, price);
                ps.setString(7, "image/book/" + fileName);
                ps.executeUpdate();
                out.println("New Book is Added");
                response.sendRedirect("admin/addBook.jsp?msg=add");
            } else if (btn.equals("Update")) {
                int bid = Integer.parseInt(request.getParameter("bid"));
                ps1 = con.prepareStatement("update books set title = ?, category = ?, author = ?, publisher = ?, quantity = ?, price = ? where bookid = " + bid);
                ps1.setString(1, title);
                ps1.setString(2,ctg);
                ps1.setString(3,author);
                ps1.setString(4,publisher);
                ps1.setInt(5,quntity);
                ps1.setFloat(6,price);
                ps1.executeUpdate();
                out.print("Book Details Updated");
                response.sendRedirect("admin/managebooks.jsp?msg=update");
            }
        } catch (Exception e) {
            out.print(e);
        }

    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
