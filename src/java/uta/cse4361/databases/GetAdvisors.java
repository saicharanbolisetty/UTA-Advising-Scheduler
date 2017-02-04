/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.SQLException;
import java.util.ArrayList;
import uta.cse4361.businessobjects.AdvisorAccount;

/**
 *
 * @author Andrew
 */
public class GetAdvisors extends RDBImplCommand{
    private String email;
    private String sqlQuery = "SELECT * FROM USER where UserRank =0 OR UserRank = 2";
    
    public GetAdvisors(){
    }
    
    public void queryDB() throws SQLException{
        try{
            statement = conn.prepareStatement(sqlQuery);
            resultSet = statement.executeQuery();
            processResult();
        }
        catch (SQLException e) {
            System.out.println("GetAdvisors failed");
            conn.close();
        } finally {
            statement.close();
        }
    }
    
    public void processResult(){
        try{
            result = new ArrayList<AdvisorAccount>();
            while(resultSet.next()){
                String name = resultSet.getString("UserName");
                String email = resultSet.getString("UserEmail");
                String department = resultSet.getString("UserDepartment");
                String studentId = resultSet.getString("UserStudentID");
                int ID = resultSet.getInt("UserID");
                int rank = resultSet.getInt("UserRank");
                AdvisorAccount acc = new AdvisorAccount();
                acc.initialize(name, email, department, ID, rank);
                acc.setTempPassword(resultSet.getString("UserPassword"));
                acc.setStudentID(studentId);
                ((ArrayList<AdvisorAccount>)result).add(acc);
            }
        }
        catch(SQLException e){
            System.out.println("Get Advisor process failed");
        }
    }
}
