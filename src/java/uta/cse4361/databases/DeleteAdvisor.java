/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import uta.cse4361.businessobjects.AdvisorAccount;

import java.sql.SQLException;

/**
 *
 * @author Andrew
 */
public class DeleteAdvisor extends RDBImplCommand {

    private String email;
    private String sqlQuery = "DELETE from USER WHERE UserEmail = ?";
    public DeleteAdvisor(String aa){
        this.email = aa;
    }
    
    @Override
    public void queryDB() throws SQLException{
        try{
            statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, email);
            statement.executeUpdate();
            processResult();
        }
        catch(SQLException e){
        System.out.println("Delete Advisor Failed");
            conn.close();
        } finally {
            statement.close();
        }
    }
    
    @Override
    public void processResult(){
        result = "";
    }
}
