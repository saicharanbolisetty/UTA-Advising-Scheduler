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
public class InsertBug extends RDBImplCommand
{

    public String EmailID;
    public String Bug;
    
         public  InsertBug(String emailid,String bug)
    {
        this.EmailID = emailid;
        this.Bug=bug;
    }

    @Override
    public void queryDB() throws SQLException
    {
           System.out.println("emailid="+EmailID);
         System.out.println("Bug="+Bug);
        statement = conn.prepareStatement("Insert Into bug(EmailID,bug) VALUES('"+EmailID+"','"+Bug+"')");
           // statement.setString(1, searchdata);
       statement.executeUpdate();
    }
        

    @Override
    public void processResult() 
    {
        String result="done";
    }
       
    
}
