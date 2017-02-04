/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.SQLException;
import uta.cse4361.businessobjects.AdvisorAccount;

/**
 *
 * @author Andrew
 */
public class RegisterAdvisor extends RDBImplCommand {
    
    private AdvisorAccount aa;
    private String sqlQuery = "INSERT INTO USER(UserEmail, UserPassword,"
            + " UserName, UserStudentID, UserDepartment,  "
            + "UserDatePasswordChanged, UserRank) VALUES (?, ?, ?, ?, ?, DATE_ADD(NOW(), INTERVAL ? DAY), ?);";
    public RegisterAdvisor(AdvisorAccount aa){
        this.aa = aa;
    }
    
    @Override
    public void queryDB() throws SQLException{
        try{
            statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, aa.getEmail());
            statement.setString(2, aa.getTempPassword());
            statement.setString(3, aa.getName());
            statement.setString(4, aa.getStudentID());
            statement.setString(5, aa.getDepartment());
            statement.setInt(6, aa.getNumberOfDays());
            statement.setInt(7, aa.getRank());
            statement.executeUpdate();
            processResult();
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        System.out.println("RegisterAdvisor Failed");
            conn.close();
        } finally {
            statement.close();
        }
    }
    
    @Override
    public void processResult(){
        result ="";
    }
}
