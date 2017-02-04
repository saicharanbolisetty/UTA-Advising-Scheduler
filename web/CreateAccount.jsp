<%-- 
    Document   : CreateAccount
    Created on : Nov 22, 2014, 5:50:01 PM
    Author     : Melissa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //Uncomment when there's a proper way to create an admin account
                //this code redirects anyone who is not an admin back to the index page
            int rank = -1;
            int sessionid = -1;
            boolean student = false;
            if (request.getParameter("student") != null) {
                student = true;
            }else  if (session == null  || (session.getAttribute("id") == null) || (session.getAttribute("rank") == null)) {
               response.sendRedirect("index.jsp");
            }
            if (!(session.getAttribute("id") == null)) {
                    sessionid = Integer.parseInt((String) session.getAttribute("id"));
                }
                if (!(session.getAttribute("rank") == null)) {
                    rank = Integer.parseInt((String) session.getAttribute("rank"));
            }
            if(rank != 1 && !student)
                {
                    response.sendRedirect("index.jsp");
                }
        %>
        <script type="text/javascript">
            function validate(student) {
//                var username = document.forms["create"]["username"].value;
                var email = document.forms["create"]["email"].value;
                if (student){
                    console.log("student = " + student);
                    var studentid = document.forms["create"]["studentid"].value;
                }
                var atpos = email.indexOf("@");
                var dotpos = email.lastIndexOf(".");
                var mavs = email.indexOf("mavs.uta.edu");
                var password = document.forms["create"]["password"].value;
                var passwordConfirm = document.forms["create"]["passwordConfirm"].value;
                var name = document.forms["create"]["name"].value;

                if (email === null || email === "") {
                    $("#email").notify("Please enter your email", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    event.preventDefault();
                    return;
                }
                if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email.length || mavs < 0) {
                    $("#email").notify("Please enter a valid mavs email", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    event.preventDefault();      
                    return false;
                }
                
                if (password === null || password === "") {
                    $("#password").notify("Please enter your password", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    event.preventDefault();
                    return false;
                }
                if (passwordConfirm === null || passwordConfirm === "") {
                    $("#passwordConfirm").notify("Please confirm your password", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    event.preventDefault();
                    return false;
                }
                if (passwordConfirm !== password) {
                    $("#passwordConfirm").notify("Your password does not match", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    event.preventDefault();
                    return false;
                }
                if (name === null || name === "") {
                    $("#name").notify("Please enter your name", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    event.preventDefault();
                    return false;
                }
                if(student) {
                    if (studentid.indexOf("1001") === -1 && studentid.indexOf("1000") === -1 && studentid.indexOf("6000") === -1) {
                        $("#studentid").notify("Your student ID should begin with 1000, 1001 or 6000", "error",
                                {elementPosition: 'bottom center',
                                    globalPosition: 'bottom center'})
                        document.forms["create"]["studentid"].focus();
                        event.preventDefault();
                        return false;
                    }
                }
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
    </head>
    <body>
        <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <% 
                    if (student) {
                        out.print("<h3>Create Student Account</h3>"
                        + "<form role=\"form\" id=\"create\"  onSubmit=\"validate(true);\" action=\"AccountConfirmation.jsp\" method=\"POST\">"
                        + "<input type='text' name='studentaccount' value='true' hidden>"        
                        + "<div class=\"form-group\">\n" +
                                "                        <label for=\"email\">Email</label>\n" +
                                "                        <input class=\"form-control\" type=\"text\" name=\"email\" id=\"email\" value=\"\">\n" +
                                "                    </div>\n" +
                                "                    <div class=\"form-group\">\n" +
                                "                        <label for=\"password\">Password</label>\n" +
                                "                        <input class=\"form-control\" type=\"password\" name=\"password\" id=\"password\" value=\"\">\n" +
                                "                    </div>\n" +
                                "                    <div class=\"form-group\">\n" +
                                "                        <label for=\"passwordConfirm\">Confirm Password</label>\n" +
                                "                        <input class=\"form-control\" type=\"password\" name=\"passwordConfirm\" id=\"passwordConfirm\" value=\"\">\n" +
                                "                    </div>\n" +
                                "                    <div class=\"form-group\">\n" +
                                "                        <label for=\"name\">Name</label>\n" +
                                "                        <input class=\"form-control\" type=\"text\" name=\"name\" id=\"name\" value=\"\">\n" +
                                "                    </div>\n" +
                                "                    <div class=\"form-group\">\n" +
                                "                        <label for=\"studentid\">Student ID</label>\n" +
                                "                        <input class=\"form-control\" type=\"text\" name=\"studentid\" id=\"studentid\" value=\"\">\n" +
                                "                    </div>\n" +
                                "                    <div class=\"form-group\">\n" +
                                "                        <label for=\"dept\">Department</label>\n" +
                                "                        <select name=\"dept\" id=\"dept\" class=\"form-control\" >\n" +
                                "                            <option value=\"Computer Science\">Computer Science</option>\n" +
                                "                            <option value=\"Civil Engineering\">Civil Engineering</option>\n" +
                                "                            <option value=\"Electrical Engineering\">Electrical Engineering</option>\n" +
                                "                            <option value=\"Bioengineering\">Bioengineering</option>\n" +
                                "                        </select>\n" +
                                "                    </div>\n" +
                                "                    <div class=\"centerthis\">\n" +
                                "                        <input type=\"submit\" value=\"Create Account\" id=\"submitBtn\" class=\"btn btn-default\">\n" +
                                "                        <input type=\"reset\" value=\"Reset\" id=\"resetBtn\" class=\"btn btn-default\">\n" +
                                "                    </div>\n" +
                                "                </form>");
                    }else {
                        out.print("<h3>Create Advisor Account</h3>\n" +
                                "                <form role=\"form\" id=\"create\"  onSubmit=\"validate(false);\" action=\"AccountConfirmation.jsp\" method=\"POST\">\n" +
                                                        "<input type='hidden' name='studentid' value='0'>" +
                                "                    <!--                    <div class=\"form-group\">\n" +
                                "                                            <label for=\"username\">Username</label>\n" +
                                "                                            <input class=\"form-control\" type=\"text\" name=\"username\" id=\"username\" value=\"\">\n" +
                                "                                        </div>-->\n" +
                                "                    <div class=\"form-group\">\n" +
                                "                        <label for=\"email\">Email</label>\n" +
                                "                        <input class=\"form-control\" type=\"text\" name=\"email\" id=\"email\" value=\"\">\n" +
                                "                    </div>\n" +
                                "                    <div class=\"form-group\">\n" +
                                "                        <label for=\"password\">Password</label>\n" +
                                "                        <input class=\"form-control\" type=\"password\" name=\"password\" id=\"password\" value=\"\">\n" +
                                "                    </div>\n" +
                                "                    <div class=\"form-group\">\n" +
                                "                        <label for=\"passwordConfirm\">Confirm Password</label>\n" +
                                "                        <input class=\"form-control\" type=\"password\" name=\"passwordConfirm\" id=\"passwordConfirm\" value=\"\">\n" +
                                "                    </div>\n" +
                                "                    <div class=\"form-group\">\n" +
                                "                        <label for=\"name\">Name</label>\n" +
                                "                        <input class=\"form-control\" type=\"text\" name=\"name\" id=\"name\" value=\"\">\n" +
                                "                    </div>\n" +
                                "                    <div class=\"form-group\">\n" +
                                "                        <label for=\"dept\">Department</label>\n" +
                                "                        <select name=\"dept\" id=\"dept\" class=\"form-control\" >\n" +
                                "                            <option value=\"Computer Science\">Computer Science</option>\n" +
                                "                            <option value=\"Civil Engineering\">Civil Engineering</option>\n" +
                                "                            <option value=\"Electrical Engineering\">Electrical Engineering</option>\n" +
                                "                            <option value=\"Bioengineering\">Bioengineering</option>\n" +
                                "                        </select>\n" +
                                "                    </div>\n" +
                                "                    <div class=\"centerthis\">\n" +
                                "                        <input type=\"submit\" value=\"Create Account\" id=\"submitBtn\" class=\"btn btn-default\">\n" +
                                "                        <input type=\"reset\" value=\"Reset\" id=\"resetBtn\" class=\"btn btn-default\">\n" +
                                "                    </div>\n" +
                                "                </form>");
                    }
                %>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/CreateAccount.js"></script>
</html>
