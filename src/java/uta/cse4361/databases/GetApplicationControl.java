/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import uta.cse4361.businessobjects.AdvisorAccount;
import uta.cse4361.businessobjects.ApplicationControl;

import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author Andrew
 */
public class GetApplicationControl extends RDBImplCommand{
    private String sqlQuery = "SELECT * FROM applicationcontrol;";

    public GetApplicationControl(){}

    public void queryDB() throws SQLException{
        try{
            statement = conn.prepareStatement(sqlQuery);
            resultSet = statement.executeQuery();
            processResult();
        }
        catch (SQLException e) {
            System.out.println("GetApplicationControl failed");
            conn.close();
        } finally {
            statement.close();
        }
    }

    public void processResult(){
        try{
            HashMap<String, String> controlPairs = new HashMap<String, String>();
            ApplicationControl appcon = new ApplicationControl();
            while(resultSet.next()){
                controlPairs.put(resultSet.getString("ParamiterName"),resultSet.getString("ParamiterValue"));
                System.out.print(resultSet.getString("ParamiterName") +" "+ resultSet.getString("ParamiterValue"));
            }
            appcon.setControlParamiters(controlPairs);
            result = appcon;
        }
        catch(SQLException e){
            System.out.println("GetApplicationControl process failed");
        }
    }
}
