/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.SQLException;
import java.util.ArrayList;
import uta.cse4361.businessobjects.SearchDataResult;

/**
 *
 * @author saurabh
 */
public class GetSearchedData extends RDBImplCommand
{

    private String searchdata;
    private String sqlQuery = "Select DISTINCT UserDepartment from USER where UserDepartment LIKE ?";
    public ArrayList<String> resultdata=new ArrayList<String>();
    
    public GetSearchedData(String searchdata)
    {
        this.searchdata = searchdata;
    }
    
    
    @Override
    public void queryDB() throws SQLException 
    {
        System.out.println("value send="+searchdata);
        try{
            statement = conn.prepareStatement("Select DISTINCT UserDepartment from USER where UserDepartment LIKE  '%"+searchdata+"%'");
           // statement.setString(1, searchdata);
            resultSet = statement.executeQuery();
            
             while(resultSet.next())
             {
                String Data = resultSet.getString("UserDepartment");
               
                System.out.println("Data="+Data);
                
                resultdata.add(Data);
             }
             
             statement=null;
             resultSet=null;
            
            statement=conn.prepareStatement("Select DISTINCT SlotDate from Slot where SlotDate LIKE   '%"+searchdata+"%'");
            resultSet = statement.executeQuery();
          
             while(resultSet.next())
             {
                String Data = resultSet.getString("SlotDate");
               
                System.out.println("Data="+Data);
                
                resultdata.add(Data);
             }
            processResult();
        }
        catch (SQLException e) {
            System.out.println("GetAdvisor failed");
            conn.close();
        } finally {
            statement.close();
        }
    }

    @Override
    public void processResult() 
    {
         result=new ArrayList<String>();
         result=resultdata;
       
        
    }
    
}
