/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.SQLException;

/**
 *
 * @author saurabh
 */
public class InsertFeedBack extends RDBImplCommand
{

    public String EmailID;
    public String FeedBackData;
    //private String sqlQuery = "Insert Into FeedBack (EmailID,feedback_data) Values(?,?)";
    
      public  InsertFeedBack(String emailid,String feedbackdata)
    {
        this.EmailID = emailid;
        this.FeedBackData=feedbackdata;
    }
    
    @Override
    public void queryDB() throws SQLException 
    {
        System.out.println("emailid="+EmailID);
         System.out.println("FeedBackData="+FeedBackData);
        statement = conn.prepareStatement("Insert Into feedback(EmailID,fedback_data) VALUES('"+EmailID+"','"+FeedBackData+"')");
           // statement.setString(1, searchdata);
       statement.executeUpdate();
            
    }

    @Override
    public void processResult() 
    {
        String result="done";
    }
    
}
