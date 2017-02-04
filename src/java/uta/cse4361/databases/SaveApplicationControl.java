/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import uta.cse4361.businessobjects.ApplicationControl;
import uta.cse4361.businessobjects.Appointment;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.Map;

/**
 *
 * @author Han
 */
public class SaveApplicationControl extends RDBImplCommand {

    private ApplicationControl applicationControl;
    private String sqlDeleteQuery = "DELETE from applicationcontrol where TRUE;";
    private String sqlInsertQuery = "insert into applicationcontrol (ParamiterName, ParamiterValue) values (?, ?);";

    public SaveApplicationControl(ApplicationControl applicationControl) {
        super();
        this.applicationControl = applicationControl;
    }

    @Override
    public void queryDB() throws SQLException {
        result = false;
        try {
            statement = conn.prepareStatement(sqlDeleteQuery);
            statement.executeUpdate();

            statement = conn.prepareStatement(sqlInsertQuery);
            Iterator it = applicationControl.getControlParamiters().entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry pair = (Map.Entry)it.next();
                statement.setString(1, (String) pair.getKey());
                statement.setString(2, (String) pair.getValue());
                System.out.println("Application Control Pair : " + pair.getKey() + " = " + pair.getValue() + " Stored");
                it.remove();
                statement.executeUpdate();
            }
            processResult();
        } catch (SQLException e) {
            System.out.println("SaveApplicationControl query Failed");
            conn.close();
        } finally {
            statement.close();
        }
    }

    @Override
    public void processResult() {
        result = true;
    }

}
