<%-- 
    Document   : FeedBackInsert
    Created on : Mar 5, 2016, 7:59:28 PM
    Author     : saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="feedback" class="uta.cse4361.beans.FeadBackBean"/> 
        <jsp:setProperty name="feedback" property="emailid" value='<%=request.getParameter("emailid")%>' />
        <jsp:setProperty name="feedback" property="feedback" value='<%=request.getParameter("feedback")%>' />
    </head> 
    <body>
         <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <h3>FeedBack</h3>
                <div>
                <%
                    String result = feedback.InsertFeedBack();
                    
                     out.print(result);
                    
                    
                %>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
                  
    </body>
</html>
