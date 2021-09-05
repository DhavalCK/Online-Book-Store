import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class insContactUs extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        try{
        Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store", "root", "");
            PreparedStatement ps;
            ps = con.prepareStatement("insert into contactus(name,email,subject,message) values(?,?,?,?)");
            ps.setString(1,name);
            ps.setString(2,email);
            ps.setString(3,subject);
            ps.setString(4,message);
            ps.executeUpdate();
            response.sendRedirect("contactus.jsp");
        }
        catch(Exception e)
        {
            out.print(e);
        }

    }

}
