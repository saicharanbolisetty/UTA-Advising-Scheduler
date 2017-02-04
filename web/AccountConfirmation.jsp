<%-- 
    Document   : AccountConfirmation
    Created on : Nov 22, 2014, 8:54:58 PM
    Author     : Melissa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="newadvisor" class="uta.cse4361.beans.CreateAdvisorAccountBean"/> 
        <jsp:setProperty name="newadvisor" property="email" value="<%=request.getParameter("email")%>" />
        <jsp:setProperty name="newadvisor" property="tempPassword" value="<%=request.getParameter("password")%>" />
        <jsp:setProperty name="newadvisor" property="department" value="<%=request.getParameter("dept")%>" />
        <jsp:setProperty name="newadvisor" property="name" value="<%=request.getParameter("name")%>" />
        <jsp:setProperty name="newadvisor" property="studentID" value="<%=request.getParameter("studentid")%>" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Confirmation</title>
    </head>
    <body>
        <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <h3>Account Confirmation</h3>
                <div>
                <%
                    String result = "";
                    if (request.getParameter("studentaccount") != null) {
                        result = newadvisor.Student();
                    }else{
                        result = newadvisor.Advisor();
                    }
                    
                    if (result == "") {
                        out.print(newadvisor.getName() +"'s has been Account created");
                    } 
                    else {
                        out.print("Account could not be created.");
                    }
                %>
                </div>
            </div>
        </div>

    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/AccountConfirmation.js"></script>
</html>
