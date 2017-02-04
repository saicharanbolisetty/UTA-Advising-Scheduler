<%-- 
    Document   : FeedBackInsert
    Created on : Mar 5, 2016, 7:59:28 PM
    Author     : saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="Bug" class="uta.cse4361.beans.BugBean"/> 
        <jsp:setProperty name="Bug" property="emailid" value='<%=request.getParameter("emailid")%>' />
        <jsp:setProperty name="Bug" property="bug" value='<%=request.getParameter("bug")%>' />
    </head> 
    <body>
         <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <h3>FeedBack</h3>
                <div>
                <%
                    String result = Bug.InsertBug();
                    
                     out.print(result);
                    
                    
                %>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
  
    </body>
</html>
