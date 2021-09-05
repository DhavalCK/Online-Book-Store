
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store", "root", "");
            PreparedStatement ps;
            ps = con.prepareStatement("select * from user");
            ResultSet rs = ps.executeQuery();
            boolean flag = false;
            while (rs.next()) {
                if (email.equals(rs.getString(4)) && password.equals(rs.getString(5))) {
                    flag = true;
                    HttpSession session = request.getSession();
                    session.setAttribute("userid", email);
                    response.sendRedirect("user.jsp");
                    break;
                }
            }
            if (!flag) {
                request.getRequestDispatcher("navhome.html").include(request, response);

                out.println("<div class='alert alert-danger alert-dismissible fade show' role='alert'>");
                out.println("<strong>Sorry !!!</strong> Useraname or Password Are Invalid!!!");
                out.println("</div>");
                request.getRequestDispatcher("home.html").include(request, response);
            }
            request.getRequestDispatcher("footer.html").include(request, response);
        } catch (Exception e) {
//            out.println("<div style='height:5vh;'></div>");
            request.getRequestDispatcher("navhome.html").include(request, response);
            out.println("<div class='alert alert-warning alert-dismissible fade show' role='alert'>");
            out.println("<strong>Sorry !!!</strong>We hav Some issue with Connection ,Please Again After Few Minutes. ");
//            out.println("<button type='button' class='close' data-dismiss='alert' aria-label='Close'>");
//            out.println("<span aria-hidden='true'>&times;</span>");
//            out.println("</button>");
            out.println("</div>");
            request.getRequestDispatcher("home.html").include(request, response);
            request.getRequestDispatcher("footer.html").include(request, response);
        }

//        if (email.equals("abc@gmail.com") && password.equals("1234")) {
//            
//            request.getRequestDispatcher("navuser.html").include(request, response);
//            request.getRequestDispatcher("user.html").include(request, response);
//            request.getRequestDispatcher("footer.html").include(request, response);
//        } else {
//            request.getRequestDispatcher("navhome.html").include(request,response);
//            out.println("<div class='alert alert-warning alert-dismissible fade show' role='alert'>");
//            out.println("<strong>Sorry !!!</strong> You should check in on some of those fields below.");
//            out.println("<button type='button' class='close' data-dismiss='alert' aria-label='Close'>");
//            out.println("<span aria-hidden='true'>&times;</span>");
//            out.println("</button>");
//            out.println("</div>");
//            request.getRequestDispatcher("home.html").include(request,response);    
//        }
//        request.getRequestDispatcher("footer.html").include(request, response);
        out.close();
    }
}
