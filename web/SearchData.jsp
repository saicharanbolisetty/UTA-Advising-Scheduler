<%-- 
    Document   : SearchData
    Created on : Mar 5, 2016, 3:16:54 PM
    Author     : saurabh
--%>

<%@page import="uta.cse4361.businessobjects.SearchDataResult"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="uta.cse4361.databases.DatabaseManager"%>
<%@page import="uta.cse4361.beans.SearchBean"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      
       <jsp:useBean id="newsearch" class="uta.cse4361.beans.SearchBean"/> 
       <jsp:setProperty name="newsearch" property="searchdata" param="search" />
              
    <body>
        <h1>Hello World!</h1>
        
             <%
                    ArrayList<String> result = newsearch.SearchInDatabase();
                    if(result!=null)
                    {
                        for(int i=0;i<result.size();i++)
                        {   
                            out.println("Search data present in ="+result.get(i)+ "\n");
                        }    
                    }
                    else
                    {
                        out.print("No data found");
                    }
          %>          
    </body>
</html>
