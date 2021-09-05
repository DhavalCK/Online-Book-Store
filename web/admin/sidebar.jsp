<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/style.css">
        
        <title>Admin Panel</title>
        <style>
            .list-group-item{
                background-color: transparent!important;
                
            }
            .list-group-item:hover, .active{
                //background-color: #a8c0ff!important;
                //background-image:linear-gradient(to left, #a8c0ff, #3f2b96)!important;
                //color: black!important;
                border: 2px solid white;
            }
            .list-group-item a{
                color: white!important;
            }
        </style>
    </head>
    <body>
        <% 
                            String current_url = request.getRequestURI();
                        %>
            <div class="col-lg-2 m-0 p-0" style="background-image:linear-gradient(to right, #7b4397, #dc2430);">
                <div class="bg-light text-center p-3"><img src="../images/alogobg.png"></div>
                    <ul class="list-group">
                        <li class="list-group-item <% if(current_url.equals("/Project/admin/adminpanel.jsp")){out.print("active");} %>"><a class="pr-6 py-2 font-weight-bold" href="adminpanel.jsp">Home</a></li>
                        <li class="list-group-item <% if(current_url.equals("/Project/admin/addBook.jsp")){out.print("active");} %>"><a class="pr-6 py-2 font-weight-bold" href="addBook.jsp?msg=nothing">Add Book</a></li>
                        <li class="list-group-item <% if(current_url.equals("/Project/admin/managebooks.jsp")){out.print("active");} %>"><a class="pr-6 py-2 font-weight-bold" href="managebooks.jsp?msg=nothing">Manage Books</a></li>
                        <li class="list-group-item <% if(current_url.equals("/Project/admin/viewUsers.jsp")){out.print("active");} %>"><a class="pr-6 py-2 font-weight-bold" href="viewUsers.jsp">View Users</a></li>
                        <li class="list-group-item"><a class="pr-6 py-2 font-weight-bold" href="../LogoutAdmin">Logout</a></li>
                    </ul>
            </div>
    </body>
</html>    