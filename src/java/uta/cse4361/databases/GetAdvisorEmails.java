/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Andrew
 */
public class GetAdvisorEmails extends RDBImplCommand{
    private String email;
    private String sqlQuery = "SELECT * FROM USER where UserRank =0 OR UserRank = 2";

    public GetAdvisorEmails(){
    }
    
    public void queryDB() throws SQLException{
        try{
            statement = conn.prepareStatement(sqlQuery);
            resultSet = statement.executeQuery();
            processResult();
        }
        catch (SQLException e) {
            System.out.println("GetAdvisorEmails failed");
            conn.close();
        } finally {
            statement.close();
        }
    }
    
    public void processResult(){
        try{
            result = new ArrayList<String>();
            while(resultSet.next()){
                ((ArrayList<String>)result).add(resultSet.getString("UserEmail"));
            }
        }
        catch(SQLException e){
            System.out.println("Get Advisor Emails process failed");
        }
    }
}
