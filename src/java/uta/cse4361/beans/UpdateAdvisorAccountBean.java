/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import uta.cse4361.businessobjects.AdvisorAccount;
import uta.cse4361.databases.DatabaseManager;
import uta.cse4361.interfaces.Constants;

import javax.xml.crypto.Data;

/**
 *
 * @author Nabin
 */
public class UpdateAdvisorAccountBean implements Constants{
    private String name = null;
    private String email= null;
    private String studentID= null;
    private int numberOfDays= 0;
    private String department = null;
    private int ID= 0;
    private String tempPassword = null;
    private int rank = 0;

    public UpdateAdvisorAccountBean() {
    }

    
    public String Advisor(){
        String returnMessage = SUCCESS_MESSAGE;
        DatabaseManager dm = new DatabaseManager();
        AdvisorAccount aa = dm.getAccount(this.email);
        if (this.tempPassword != null && this.tempPassword.length() > 0){
            aa.setTempPassword(AdvisorAccount.hashPassword(tempPassword));
        }
        aa.setName(name);
        aa.setRank(rank);
        aa.setDepartment(department);
        aa.setID(ID);
        returnMessage = dm.updateAdvisor(aa);
        return returnMessage;
    }

    public String Student(){
        String returnMessage = SUCCESS_MESSAGE;
        DatabaseManager dm = new DatabaseManager();
        AdvisorAccount aa = dm.getAccount(this.email);
        if (this.tempPassword != null && this.tempPassword.length() > 0){
            aa.setTempPassword(AdvisorAccount.hashPassword(tempPassword));
        }
        aa.setName(name);
        aa.setRank(rank);
        aa.setDepartment(department);
        aa.setStudentID(studentID);
        aa.setNumberOfDays(numberOfDays);
        aa.setID(ID);
        returnMessage = dm.updateStudent(aa);
        return returnMessage;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getDepartment() {
        return department;
    }

    public int getID() {
        return ID;
    }

    public String getTempPassword() {
        return tempPassword;
    }

    public int getRank() {
        return rank;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setTempPassword(String tempPassword) {
        this.tempPassword = tempPassword;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentid) {
        this.studentID = studentid;
    }

    public int getNumberOfDays() {
        return numberOfDays;
    }

    public void setNumberOfDays(int numberOfDays) {
        this.numberOfDays = numberOfDays;
    }

    
    
}
