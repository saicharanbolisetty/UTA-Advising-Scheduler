/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.businessobjects;

/**
 *
 * @author saurabh
 */
public class FeedBackData 
{
    public String emailid;
    public String feedback;

    
     public FeedBackData()
      {
        this.emailid = "";
        this.feedback="";
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
    
    
    
    
}
