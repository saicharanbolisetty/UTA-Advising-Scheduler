<%-- 
    Document   : LoginValidation
    Created on : Nov 22, 2014, 10:39:39 PM
    Author     : Melissa
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="uta.cse4361.databases.DatabaseManager"%>
<%@page import="uta.cse4361.businessobjects.ApplicationControl"%>
<%
    if (request.getParameter("saveuser") != null) {
        Cookie email = new Cookie("email", (String)request.getParameter("username"));
        int oneDay = 60 * 60 * 24;
        email.setMaxAge(oneDay * 365);
        response.addCookie(email);
    }else{
        Cookie[] cookies;
        Cookie cookie;
        cookies = request.getCookies();
        if( cookies != null ){
           for (int i = 0; i < cookies.length; i++){
              cookie = cookies[i];
              if (cookie.getName().equals("email")){
                cookie.setMaxAge(0);
                response.addCookie(cookie);
              }
            }
        }
    }
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <jsp:useBean id="login" class="uta.cse4361.beans.LogInBean"/> 
        <jsp:setProperty name="login" property="email" value='<%=request.getParameter("username")%>' />
        <jsp:setProperty name="login" property="password" value='<%=request.getParameter("password")%>' />
    </head>
    <body>
         <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <h3>Login Validation</h3>
                <div>
                    
                <%
                    ApplicationControl appcon;
                    appcon = (ApplicationControl) session.getAttribute("applicationControl");
                   
                    String result = login.LogIn(Integer.parseInt(appcon.getApplicationParamiter("TempPasswordExpiresIn")),
                            Integer.parseInt(appcon.getApplicationParamiter("PasswordExpiresIn")));
                    if(result.equals("Invalid login"))
                    {
                        out.print("Wrong username or password.");
                    }

                    else{
                        out.print("You have successfully logged in. <br> You will be redirected in 5 seconds.");
                        session.setAttribute("passwordExpired", login.getPasswordExpired());
                        session.setAttribute("email", login.getEmail());
                        session.setAttribute("confirmation", login.getPassword());
                        session.setAttribute("id",result.substring(0, result.length()-1));
                        session.setAttribute("rank", result.substring(result.length()-1));
                        response.sendRedirect("index.jsp");
                    } 
                    
                %>

                </div>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/LoginValidation.js"></script>
</html>
