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
public class UpdateStudent extends RDBImplCommand {

    private AdvisorAccount aa;
    private String sqlQuery = "UPDATE user set user.UserEmail=?, user.UserPassword=?, user.UserName=?, user.UserDepartment=?, user.UserRank=?," +
            "user.UserStudentID=?, UserDatePasswordChanged=DATE_Add(now(), INTERVAL ? DAY) WHERE user.UserID=?";
    public UpdateStudent(AdvisorAccount aa){
        this.aa = aa;
    }

    @Override
    public void queryDB() throws SQLException{
        try{
            System.out.print("inner rank = " + aa.getRank());
            statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, aa.getEmail());
            statement.setString(2, aa.getTempPassword());
            statement.setString(3, aa.getName());
            statement.setString(4, aa.getDepartment());
            statement.setInt(5, aa.getRank());
            statement.setString(6, aa.getStudentID());
            statement.setInt(7, aa.getNumberOfDays());
            statement.setInt(8, aa.getID());

            statement.executeUpdate();
            processResult();
        }
        catch(SQLException e){
            System.out.println("Update Student Failed");
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
