/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import uta.cse4361.databases.DatabaseManager;

/**
 *
 * @author saurabh
 */
public class BugBean
{
     public String emailid;
    public String bug;
    
    public BugBean() 
    {
        
    }

    public String getEmailid() {
        return emailid;
    }

    public String getBug() {
        return bug;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public void setBug(String bug) {
        this.bug = bug;
    }

   
     public String InsertBug()
     {
         System.out.println("In bug bean");
        DatabaseManager DM = new DatabaseManager();
        String str= DM.insertbug(this.emailid,this.bug);  
        return str;
     }        
    
}
