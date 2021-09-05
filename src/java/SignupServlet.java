import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class SignupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        request.getRequestDispatcher("navhome.html").include(request,response);
        request.getRequestDispatcher("home.html").include(request,response);
      
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        int contact = Integer.parseInt(request.getParameter("contact"));
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store", "root", "");
            out.println("<h3>Database Connection Successfully</h3><br><br>");
            PreparedStatement ps;
            ps = con.prepareStatement("insert into user values(?,?,?,?,?)");
            ps.setString(1,fname);
            ps.setString(2,lname);
            ps.setInt(3,contact);
            ps.setString(4,email);
            ps.setString(5,password);
            int q = ps.executeUpdate();
            out.println("<h3>"+q + " Records Inserted.\n</h3>");
        } 
        catch (Exception e) {
            out.print(e);
        }
        request.getRequestDispatcher("footer.html").include(request,response);
        
    }
}
