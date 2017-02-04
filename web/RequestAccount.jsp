
<%@page import="uta.cse4361.databases.DatabaseManager"%>
<%@page import="uta.cse4361.businessobjects.ApplicationControl"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="newadvisor" class="uta.cse4361.beans.CreateAdvisorAccountBean"/>
        <jsp:setProperty name="newadvisor" property="email" value="<%=request.getParameter("email")%>" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Confirmation</title>
    </head>
<%
    String message = "";
    ApplicationControl appcon = (ApplicationControl) session.getAttribute("applicationControl");
    boolean valid = true;
    int atpos, dotpos, mavs;
    atpos = newadvisor.getEmail().indexOf("@");
    dotpos = newadvisor.getEmail().lastIndexOf(".");
    mavs = newadvisor.getEmail().indexOf("mavs.uta.edu");
    if(atpos < 1
            || dotpos < atpos + 2
            || dotpos + 2 >= newadvisor.getEmail().length()
            || mavs < 0){
        message = "Invalid email request denied";
        valid = false;
    }
    if (valid){
        newadvisor.setRank(3);
        String name;
        name = newadvisor.getEmail().substring(0, atpos);
        
        newadvisor.setName(name);
        String newPassword = "#1@" + newadvisor.getEmail().hashCode();
        newadvisor.setTempPassword(newPassword);
        newadvisor.setDepartment("new");
        newadvisor.setStudentID("123");
        newadvisor.setNumberOfDays(Integer.parseInt(appcon.getApplicationParamiter("TempPasswordExpiresIn")));

        newadvisor.Student();

        String msg = "New account created username = " + newadvisor.getEmail() + "\n"
                + "Password = " + newPassword + "\n"
                + "Password will expire in "
                + appcon.getApplicationParamiter("TempPasswordExpiresIn") + " days";


        String from = "cse4361fall14@gmail.com";
        final String username = "cse4361fall14";
        final String password = "design.pattern";

        String host = "smtp.gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        // Get the Session object.
        Session session1 = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            // Create a default MimeMessage object.
            Message message1 = new MimeMessage(session1);

            // Set From: header field of the header.
            message1.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message1.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(newadvisor.getEmail()));

            // Set Subject: header field
            message1.setSubject("UTA Advising Account Confirmation");

            // Now set the actual message
            message1.setText(msg);

            // Send message
            Transport.send(message1);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
%>
    <body>
        <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <h3>Account Confirmation</h3>
                <div>
                <%
                    if(valid){
                        out.print("Account created check your email");
                    }else{
                        out.print("Account creatation failed check your email is valid mavs account");
                    }
                %>
                </div>
            </div>
        </div>

    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/AccountConfirmation.js"></script>
</html>
