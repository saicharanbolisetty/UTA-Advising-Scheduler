/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.businessobjects;

import uta.cse4361.databases.DatabaseManager;

import java.util.HashMap;

/**
 *
 * @author Andrew
 */
public class ApplicationControl {

    private HashMap<String, String> controlParamiters;

    public ApplicationControl(){
    }

    public String getApplicationParamiter(String paramiter){
        return this.controlParamiters.get(paramiter);
    }

    public HashMap<String, String> getControlParamiters() {
        return controlParamiters;
    }

    public void setControlParamiters(HashMap<String, String> controlParamiters) {
        this.controlParamiters = controlParamiters;
    }
}
