
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        ServletConfig config = getServletConfig();
        String a = config.getInitParameter("adminname");
        String pwd = config.getInitParameter("adminpass");
        out.println(a+" "+pwd);
        String name = request.getParameter("aname");
        String password = request.getParameter("password");
        
        try {
            if (name.equals(a) && password.equals(pwd)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("admin", name);
                    response.sendRedirect("admin/adminpanel.jsp");
            }
            else {
                //out.print(a+" "+pwd);
                response.sendRedirect("admin/index.jsp?msg=notvalid");
                
            }
            
        } catch (Exception e) {
            out.print(e);
            
        }


}
}
