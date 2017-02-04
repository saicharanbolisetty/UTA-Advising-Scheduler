<%-- 
    Document   : CreateAccount
    Created on : Nov 22, 2014, 5:50:01 PM
    Author     : Melissa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
    </head>
    <body>
        <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <% 
                    
                       out.print("<h3>Bug Report</h3>"
                                + "<form role=\"form\" id=\"create\"   action='BugInsert.jsp' method=\"POST\">"
                                +"<label for=\"email\">Email</label>\n" 
                                +"<input class=\"form-control\" type=\"text\" name=\"emailid\" id=\"emailid\" value=\"\">\n"
                                +"<label for=\"Bug\">Bug</label>\n" 
                                +"<input class=\"form-control\" type=\"text\" name=\"bug\" id=\"bug\" value=\"\">\n"
                                + "<input type='submit' value='Submit'></form>"
                                + "</li>" );
                    
                %>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/CreateAccount.js"></script>
</html>

                
            