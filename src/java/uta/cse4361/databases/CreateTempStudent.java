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
public class CreateTempStudent extends RDBImplCommand {

    private AdvisorAccount aa;
    private String sqlQuery = "INSERT  INTO user (user.UserEmail, user.UserPassword, user.UserRank, User.UserDatePasswordChanged) VALUES (?,?,3,Date_Add(now(), Interval -1 YEAR))";
    public CreateTempStudent(AdvisorAccount aa){
        this.aa = aa;
    }

    @Override
    public void queryDB() throws SQLException{
        try{
            System.out.print("inner rank =" + aa.getID());
            statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, aa.getEmail());
            statement.setString(2, aa.getTempPassword());
            statement.setString(3, aa.getName());
            statement.setString(4, aa.getDepartment());
            statement.setInt(5, aa.getRank());
            statement.setInt(6, aa.getID());

            statement.executeUpdate();
            processResult();
        }
        catch(SQLException e){
            System.out.println("Update Advisor Failed");
            e.printStackTrace();
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
