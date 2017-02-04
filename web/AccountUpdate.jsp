
<%@page import="uta.cse4361.businessobjects.ApplicationControl"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.io.PrintStream"%>
<%@page import="uta.cse4361.databases.DatabaseManager"%>
<%@page import="uta.cse4361.databases.DeleteAdvisor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="updateadvisor" class="uta.cse4361.beans.UpdateAdvisorAccountBean"/> 
        <jsp:setProperty name="updateadvisor" property="email" value="<%=request.getParameter("email")%>" />
        <jsp:setProperty name="updateadvisor" property="tempPassword" value="<%=(request.getParameter("password")!= null ? request.getParameter("password") : "")%>" />
        <jsp:setProperty name="updateadvisor" property="department" value="<%=request.getParameter("dept")%>" />
        <jsp:setProperty name="updateadvisor" property="rank" value="<%=(request.getParameter("rank") != null ? Integer.parseInt(request.getParameter("rank")) : 0)%>" />
        <jsp:setProperty name="updateadvisor" property="name" value="<%=request.getParameter("name")%>" />
        <jsp:setProperty name="updateadvisor" property="studentID" value="<%=(request.getParameter("studentid") != null ? request.getParameter("studentid") : "")%>" />
        <jsp:setProperty name="updateadvisor" property="ID" value="<%=(request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : 0) %>" />
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
                    ApplicationControl appcon = (ApplicationControl) session.getAttribute("applicationControl");
                    System.out.print(Integer.parseInt(appcon.getApplicationParamiter("PasswordExpiresIn")));
                    String result;
                    if (request.getParameter("delete") != null && request.getParameter("delete").equals("1")) {
                        DatabaseManager dm = new DatabaseManager();
                        result = dm.deleteAdvisor(updateadvisor.getEmail());
                    }else if(updateadvisor.getStudentID().length() > 0) {
                        updateadvisor.setNumberOfDays(Integer.parseInt(appcon.getApplicationParamiter("PasswordExpiresIn")));
                        result = updateadvisor.Student();
                    }else{
                        result = updateadvisor.Advisor();
                    }
                    if (result == "") {
                        out.print(updateadvisor.getName() +"'s has been Account updated");
                    } 
                    else {
                        out.print("Account could not be updated.");
                    }
                %>
                </div>
            </div>
        </div>

    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/AccountConfirmation.js"></script>
</html>
