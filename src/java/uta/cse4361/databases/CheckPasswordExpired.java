/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.SQLException;

/**
 *
 * @author Andrew
 */
public class CheckPasswordExpired extends RDBImplCommand {

    private String email;
    private int numberOfDays;
    private boolean expired;
         
    private String sqlQuery = "SELECT (DATE_ADD(UserDatePasswordChanged, INTERVAL ? DAY) " +
            "< NOW()) as Expired FROM USER WHERE UserEmail = ?";

    public CheckPasswordExpired(String email, int numberOfDays){
        this.email = email;
        this.numberOfDays=numberOfDays;
    }
    
    public void queryDB() throws SQLException{
        try{
            statement = conn.prepareStatement(sqlQuery);
            statement.setInt(1, numberOfDays);
            statement.setString(2, email);
            resultSet = statement.executeQuery();
            processResult();
        }
        catch(SQLException e){
        System.out.println("CheckPasswordExpired Failed");
            conn.close();
        } finally {
            statement.close();
        }
    }
    
    public void processResult(){
        try{
            result = "Invalid login";
            if(resultSet.next()){
                expired = resultSet.getInt("Expired") == 1;
                result = expired;
            }
        }
        catch(SQLException e){
            System.out.println("CheckPasswordExpired failed");
        }
    }
}
