/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import java.util.ArrayList;
import uta.cse4361.databases.DatabaseManager;

/**
 *
 * @author saurabh
 */
public class FeadBackBean 
{
    public String emailid;
    public String feedback;
    
    public FeadBackBean() 
    {
        
    }

    public String getEmailid() {
        return emailid;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
   
     public String InsertFeedBack()
     {
         System.out.println("In bean");
        DatabaseManager DM = new DatabaseManager();
        String str= DM.insertfeedback(this.emailid,this.feedback);  
        return str;
     }        
    
    
}
