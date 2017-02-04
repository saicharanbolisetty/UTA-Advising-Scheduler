/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import java.util.ArrayList;
import uta.cse4361.businessobjects.SearchDataResult;
import uta.cse4361.databases.DatabaseManager;
import static uta.cse4361.interfaces.Constants.SUCCESS_MESSAGE;

/**
 *
 * @author saurabh
 */
public class SearchBean 
{
     public String searchdata = null;

     
      public SearchBean() {
    }

  
    public void setSearchdata(String searchdata) {
        this.searchdata = searchdata;
    }
    
    

    public String getSearchdata() 
    {
        
        return searchdata;
    }
     
     
   
     
    public ArrayList<String> SearchInDatabase()
    {
        String Msg = SUCCESS_MESSAGE;
        DatabaseManager DM = new DatabaseManager();
        ArrayList<String> data = DM.GetSearchData(this.searchdata);  
        System.out.println("count="+data.size());
        return data;
   }
}
 