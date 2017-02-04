/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import org.junit.Test;
import static org.junit.Assert.*;
import uta.cse4361.businessobjects.AdvisorAccount;

/**
 *
 * @author Frank R.
 */
public class LogInBeanTest {
    @Test
    public void testLogIn()
    {
        LogInBean instance = new LogInBean();
        instance.setEmail("admin@mavs.uta.edu");
        instance.setPassword("7211");
        //String result = instance.LogIn();
        
       // assertEquals("11", result);
    }
    
    public void testSetEmail()
    {
        LogInBean instance = new LogInBean();
        instance.setEmail("admin@mavs.uta.edu");
        assertEquals("admin@mavs.uta.edu", instance.getEmail());
    }
    
    public void testSetPassword()
    {
        LogInBean instance = new LogInBean();
        instance.setPassword("temp");
        assertEquals(AdvisorAccount.hashPassword("temp"), instance.getPassword());
    }

}
