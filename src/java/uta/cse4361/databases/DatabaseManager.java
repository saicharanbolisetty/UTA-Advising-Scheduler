/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javafx.application.Application;
import uta.cse4361.businessobjects.*;

/**
 *
 * @author Han
 */
public class DatabaseManager {
    DatabaseImpInterface imp = new RelationalDatabaseImpl();
    
    public DatabaseManager() {
        
    }
    
    public boolean isFree(Date date, int startHour, int endHour, int startMinute, int endMinute) {
        ArrayList<Slot> slots = imp.getAvailSlotsByTime(date, startHour, endHour, startMinute, endMinute);
        SlotFactory f = SlotFactory.getInstance();
        int apptSize = f.determineNumberOfFlyweights(startHour, endHour, startMinute, endMinute);
        if(slots.size() >= apptSize){
            return true;
        }
        return false;
    }
    
    public ArrayList<Appointment> getAppointments() {
        
        ArrayList<Appointment> appointments = imp.getAppointments();
        Collections.sort(appointments);
        return appointments;
    }
    
    public Appointment getAppointment(int apptID) {
        return imp.getAppointment(apptID);
    }
    
    public String saveSlots(ArrayList<Slot> slots) {
        return imp.saveSlots(slots);
    }
    public String saveAppointment(Appointment appt) {
        return imp.saveAppointment(appt);
    }
    public String modifyAppointment(int id, Appointment appt) {
        return imp.modifyAppointment(id, appt);
    }
    public String modifySlot(Date d, int startHour, int startMin, int endHour, int endMin, int slotID) {
        return imp.modifySlot(d, startHour, startMin, endHour, endMin, slotID);
    }
    
    public ArrayList<Slot> getSlots(){
        return imp.getSlot();
    }
    
    public ArrayList<Slot> getTypeSlots(){
        ArrayList<Slot> avail = imp.getAvailSlots();
        ArrayList<Slot> appt = imp.getApptSlots();
        avail.addAll(appt);
        Collections.sort(avail);
        return avail;
    }
    public ArrayList<Slot> getAvailableSlots() {
         return imp.getAvailSlots();
     }
    
    public String register(AdvisorAccount aa){
        return imp.register(aa);
    }
    
    public String updateAdvisor(AdvisorAccount aa){
        return imp.updateAdvisor(aa);
    }

    public String deleteAdvisor(String email){
        return imp.deleteAdvisor(email);
    }
    
    public boolean checkPasswordExpired(String email, int numberOfDays){
        return imp.checkPasswordExpired(email, numberOfDays);
    }
    
    public String validate(String email, String password){
        return imp.validate(email, password);
    }
    
    public AdvisorAccount getAccount(String email){
        return imp.getAccount(email);
    }
    
    public List<AdvisorAccount> getAccounts(){
        return imp.getAccounts();
    }

    public ArrayList<String> getAddvisorEmails(){
        return imp.getAdvisorEmails();
    }
    
//    String modifySlot(Date date, int i, int i0, int i1, int i2) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
    public ApplicationControl getApplicationControl(){
        return imp.getApplicationControl();
    }
    
    public String updateStudent(AdvisorAccount aa) {
        return imp.updateStudent(aa);
    }
     public ArrayList<String> GetSearchData(String searchdata)
    {
          return imp.GetSearchDataFromDatabase(searchdata);
    }

    public String insertfeedback(String emailid, String feedback)
    {
        System.out.println("In DB manager");
        return imp.insertfeedback(emailid,feedback);
    }
    
     public String insertbug(String emailid, String bug)
    {
        System.out.println("In bug DB manager");
        return imp.insertbug(emailid,bug);
    }
}
