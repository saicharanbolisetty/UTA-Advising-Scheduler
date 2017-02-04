/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import uta.cse4361.businessobjects.AdvisorAccount;
import uta.cse4361.databases.DatabaseManager;
import uta.cse4361.interfaces.Constants;



/**
 *
 * @author Nabin
 */
public class LogInBean implements Constants{
    private String email= null;
    private String password= null;
    private boolean passwordExpired = false;

    public LogInBean() {
    }

    public String LogIn(int tempDays, int regularDays){
        String Msg = SUCCESS_MESSAGE;
        DatabaseManager DM = new DatabaseManager();
        Msg = DM.validate(this.email, this.password); 
        AdvisorAccount aa = DM.getAccount(email);
        if (aa.getRank() == 3 && aa.getStudentID().length() == 0){
            passwordExpired = DM.checkPasswordExpired(email, tempDays);
        }else{
            passwordExpired = DM.checkPasswordExpired(email, regularDays);
        }

        return Msg;
    }
    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

   public void setPassword(String password) {
        this.password = AdvisorAccount.hashPassword(password);
   }
    
   public boolean getPasswordExpired(){
       return passwordExpired;
   } 
}
