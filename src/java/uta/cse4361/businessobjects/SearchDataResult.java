/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.businessobjects;

/**
 *
 * @author saurabh
 */
public class SearchDataResult 
{
    
     private String Data;
     private String TableName;
     
      public SearchDataResult()
      {
        this.Data = "";
        this.TableName="";
    }

    public void setTableName(String TableName) {
        this.TableName = TableName;
    }

    public String getTableName() {
        return TableName;
    }

    public String getData() {
        return Data;
    }

    public void setData(String Data) {
        this.Data = Data;
    }

   
   

    public void initialize(String TableName1, String Data1)
    {
      this.Data=Data1;
      this.TableName=TableName1;
    }
    
    
}
