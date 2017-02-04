<%@page import="java.util.ArrayList"%>
<%@page import="uta.cse4361.businessobjects.AdvisorAccount"%>
<%@ page import="uta.cse4361.databases.DatabaseManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            //Uncomment when there's a proper way to create an admin account
                //this code redirects anyone who is not an admin back to the index page
            int rank = -1;
            int sessionid = -1;
            if ((session.getAttribute("id") == null) || (session.getAttribute("rank") == null)) {
               response.sendRedirect("index.jsp");
            }
            if (!(session.getAttribute("id") == null)) {
                    sessionid = Integer.parseInt((String) session.getAttribute("id"));
                }
                if (!(session.getAttribute("rank") == null)) {
                    rank = Integer.parseInt((String) session.getAttribute("rank"));
            }
            if( rank < 0 )
                {
                    response.sendRedirect("index.jsp");
                }
        %>
        <script type="text/javascript">
            function confirmDelete(email) {
               if (!confirm("Delete advisor is not reversable.  Are you sure you want to delete " + email + "?")) {
                    event.preventDefault();
               }
            }
            
            function validate() {
//                var username = document.forms["create"]["username"].value;
                var email = document.forms["create"]["email"].value;
                var atpos = email.indexOf("@");
                var dotpos = email.lastIndexOf(".");
                var mavs = email.indexOf("mavs.uta.edu");
                var password = document.forms["create"]["password"].value;
                var passwordConfirm = document.forms["create"]["passwordConfirm"].value;
                var name = document.forms["create"]["name"].value;
                var passwordTest;

                if (email === null || email === "") {
                    $("#email").notify("Please enter your email", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    return false;
                }
                if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email.length || mavs < 0) {
                    $("#email").notify("Please enter a valid mavs email", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    return false;
                }
                if ((!(password === null) || !(passwordConfirm === null)) && password !== passwordConfirm) {
                    $("#password").notify("Password words do not match", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    return false;
                }
                
                passwordTest += /[A-Z]+/.test(password);
                passwordTest += /[a-z]+/.test(password);
                passwordTest += /[0-9]+/.test(password);
                passwordTest += /[!@#$&*]+/.test(password);
                passwordTest += (password.length >5 ? 1 :0);

                if(passwordTest < 5 && password !== ''){
                    message += "Password must be at least 6 characters and contain:\n1 - Capital letter\n1 - Lowercase letter\n1 - Number\n1 - Special symbol !, @, #, $, &, or *\n";
                    $("#password").notify(message, "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    return false;
                }

                if (name === null || name === "") {
                    $("#name").notify("Please enter your name", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    return false;
                }

            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Account</title>
    </head>
    <body>
        <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <%
                AdvisorAccount aa = null;
                DatabaseManager dm = new DatabaseManager();
                
                if (session.getAttribute("passwordExpired") != null && session.getAttribute("passwordExpired").toString().equals("true")){
                    out.println("<h3>Password Expired Please Change Now</h3>");
                }
                if (rank != 1) {
                    aa = dm.getAccount((String)session.getAttribute("email"));
                }
                if (rank == 1){
                    ArrayList<String> emails = dm.getAddvisorEmails();
                    for (String email : emails){
                        out.println("<a href='EditAccount.jsp?email=" + email +  "'>Edit " + email + "</a><br>");
                        
                    }
                }
                if (request.getParameter("email") != null && request.getParameter("email") != ""){
                    aa = dm.getAccount(request.getParameter("email"));
                }
                if (aa != null){
                    out.println("<div id=\"accordion\"> <h3>Edit Account</h3> <form role=\"form\" id=\"create\"  onSubmit=\"return validate();\" action=\"AccountUpdate.jsp\" method=\"POST\">");
                    if (rank != 1){
                        out.println("<a href='AccountUpdate.jsp?email=" + aa.getEmail() +  "&delete=1'>Delete Account</a><br>");
                    }
                    out.println("<div class=\"form-group\">\n" +
                            "                        <label for=\"email\">Email</label>\n" +
                            "                        <input class=\"form-control\" type=\"text\" name=\"email\" id=\"email\" value=\"" + aa.getEmail() + "\" locked>\n" +
                            "                    </div>");
                    out.println("<input type='text' value=" + aa.getID() + " name='id' hidden>");
                    out.println("<div class=\"form-group\">\n" +
                            "                        <label for=\"password\">Password</label>\n" +
                            "                        <input class=\"form-control\" type=\"password\" name=\"password\" id=\"password\" value=\"\">\n" +
                            "                    </div>");
                    out.println("<div class=\"form-group\">\n" +
                            "                        <label for=\"passwordConfirm\">Confirm Password</label>\n" +
                            "                        <input class=\"form-control\" type=\"password\" name=\"passwordConfirm\" id=\"passwordConfirm\" value=\"\">\n" +
                            "                    </div>");
                    
                    if (rank == 1) {
                        out.println("<div class=\"form-group\">\n" +
                            "                        <label for=\"dept\">Account Type</label>\n" +
                            "                        <select name=\"rank\" id=\"rank\" class=\"form-control\" >");
                    }else{
                        out.println("<input type='text' name='rank' value='" + aa.getRank() + "' hidden>");
                        out.println("<div class=\"form-group\">\n" +
                            "                        <label for=\"dept\">Account Type</label>\n" +
                            "                        <select name=\"rank\" id=\"rank\" class=\"form-control\" disabled>");
                    }
                    
                    if ( aa.getRank() == 0 ){
                        out.print("<option value=\"0\" selected>Advisor</option>");
                    }else{
                        out.print("<option value=\"0\">Advisor</option>");
                    }
                    if (aa.getRank() == 1){
                        out.print("<option value=\"1\" selected>Admin</option>");
                    }else{
                        out.print("<option value=\"1\" >Admin</option>");
                    }
                    if (aa.getRank() == 2){
                        out.print("<option value=\"2\" selected>Lead Advisor</option>");
                    }else{
                        out.print("<option value=\"2\" >Lead Advisor</option>");
                    }
                     if (aa.getRank() == 3){
                        out.print("<option value=\"3\" selected>Student</option>");
                    }else{
                        out.print("<option value=\"3\" >Student</option>");
                    }
                    out.print("</select></div>");
                    
                    
                    out.println("<div class=\"form-group\">\n" +
                            "                        <label for=\"name\">Name</label>\n" +
                            "                        <input class=\"form-control\" type=\"text\" name=\"name\" id=\"name\" value=\"" + aa.getName() + "\">\n" +
                            "                    </div>");

                    out.println("<div class=\"form-group\">\n" +
                            "                        <label for=\"name\">StudentID</label>\n" +
                            "                        <input class=\"form-control\" type=\"text\" name=\"studentid\" id=\"studentid\" value=\"" + aa.getStudentID()+ "\">\n" +
                            "                    </div>");

                    out.println("<div class=\"form-group\">\n" +
                            "                        <label for=\"dept\">Department</label>\n" +
                            "                        <select name=\"dept\" id=\"dept\" class=\"form-control\" >");
                    if (aa.getDepartment().equals("Computer Science")){
                        out.print("<option value=\"Computer Science\" selected>Computer Science</option>");
                    }else{
                        out.print("<option value=\"Computer Science\">Computer Science</option>");
                    }
                    if (aa.getDepartment().equals("Civil Engineering")){
                        out.print("<option value=\"Civil Engineering\" selected>Civil Engineering</option>");
                    }else{
                        out.print("<option value=\"Civil Engineering\">Civil Engineering</option>");
                    }
                    if (aa.getDepartment().equals("Electrical Engineering")){
                        out.print("<option value=\"Electrical Engineering\" selected>Electrical Engineering</option>");
                    }else{
                        out.print("<option value=\"Electrical Engineering\">Electrical Engineering</option>");
                    }
                    if (aa.getDepartment().equals("Bioengineering")){
                        out.print("<option value=\"Bioengineering\" selected>Bioengineering</option>");
                    }else{
                        out.print("<option value=\"Bioengineering\" >Bioengineering</option>");
                    }
                    out.print("</select>");

                    out.println("</div>\n" +
                            "                    <div class=\"centerthis\">\n");
                    out.println("                        <input type=\"submit\" value=\"Edit Account\" id=\"submitBtn\" class=\"btn btn-default\">\n");                    
                    if (rank != 1){
                        out.println("<a class='btn btn-danger' href='AccountUpdate.jsp?email=" + aa.getEmail() +  "&delete=1'>Delete Account</a><br>");
                    }
                    out.println("                    </div>\n" +
                            "                </form>\n" +
                            "            </div>");
                    
                }
            %>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/CreateAccount.js"></script>
</html>
