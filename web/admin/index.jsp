

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
    <head>
        <title>Admin Login</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/signup_style.css">
    </head>
    <body>
<% 
    try{
        String msg = request.getParameter("msg");
        if(msg.equals("notvalid"))
        {
            out.println("<div class='alert alert-danger alert-dismissible fade show' role='alert'>");
            out.println("<strong>Sorry !!!</strong> Useraname or Password Are Invalid!!!");
            out.println("<button type='button' class='close' data-dismiss='alert' aria-label='Close'>");
            out.println("<span aria-hidden='true'>&times;</span>");
            out.println("</button>");
            out.println("</div>");
        }
    }
    catch(Exception e)
    {}
        %>

        <div class="container mt-4" style="height:470px;">
            <div class="login_f col m-auto w-75" style="background-color:linen">
                <form action="../AdminLogin" method="post" id="fileForm" role="form" class="m-auto w-75">
                    <h2 class="title text-center fs-30 mb-10">Admin Login</h2>
                    <div class="form-group">
                        <label for="email"><span class="req">* </span> Name : </label> 
                        <input class="form-control border-primary" required type="text" name="aname" id = "aname" placeholder="Name"/>   
                        <div class="status" id="status"></div>
                    </div>

                    <div class="form-group">
                        <label for="password"><span class="req">* </span> Password: </label>
                        <input required name="password" type="password" class="form-control border-primary inputpass" placeholder="Password" id="pass1" /> 
                    </div>

                    <div class="form-group">
                        <div class="d-inline mr-5">
                            <input class="btn btn-success px-4 py-2" type="submit" name="submit_login" value="Submit">
                        </div>
                        <div class="d-inline mr-5">
                            <input class="btn btn-danger px-4 py-2" type="reset" name="reset_login" value="Reset">

                        </div>
                    </div>
                </form>
            </div>

        </div>
        </body>
</html>