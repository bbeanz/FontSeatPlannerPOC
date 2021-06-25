@isTest
private class getSeatingSectionAttendees_Test {
    
    private static String timezone = 'America/Adak';
    static EventApi__Event_Category__c cat = new EventApi__Event_Category__c(); 
    static EventApi__Event__c ev = new EventApi__Event__c();
    static EventApi__Ticket_Type__c tt = new EventApi__Ticket_Type__c();
    
    private static void createTestData() {
        
        cat.Name = 'Test Event Category';
        cat.EventApi__Description__c = 'Test Desc';
        insert cat;

        ev.EventApi__Event_Category__c = cat.Id;
        ev.Name = 'Test Event';
        ev.EventApi__Event_Key__c = 'ABCD';
        ev.EventApi__Attendees__c = 10;
        ev.EventApi__Capacity__c = 100;
        ev.EventApi__Enable_Access_Permissions__c = false;
        ev.EventApi__Enable_Registration_Groups__c = true;
        ev.EventApi__Enable_Sponsors__c = true;
        ev.EventApi__Enable_Waitlist__c = true;
        ev.EventApi__Enable_Schedule_Items__c = true;
        ev.EventApi__Is_Active__c = true;
        ev.EventApi__Is_Published__c = true;
        ev.EventApi__Registration_Instructions__c = 'Test Instructions';
        ev.EventApi__Registration_Style__c = 'Conference';
        ev.EventApi__Status__c = 'Planned';
        ev.EventApi__Ticket_Sales_Start_Date__c = Date.today();
        ev.EventApi__Time_Zone__c = '(GMT-10:00) '+timezone;
        ev.EventApi__Waitlist_Entries__c = 10;
        ev.EventApi__Start_Date_Time__c = Datetime.now().addDays(3);
        ev.EventApi__Start_Date__c = Date.today().addDays(3);
        ev.EventApi__Start_Time__c = '09:00 AM';
        ev.EventApi__End_Date__c = Date.today().addDays(7);
        ev.EventApi__End_Date_Time__c = Datetime.now().addDays(7);
        ev.EventApi__End_Time__c = '09:00 AM';
        insert ev;

        tt.EventApi__Event__c = ev.Id;
        tt.Name = 'Test Item Name';
        tt.EventApi__UOM__c = 'Ticket';
        tt.EventApi__Price__c = 100.00;
        tt.EventApi__Cost__c = 100.00;
        tt.EventApi__Description__c = 'Test Description';
        tt.EventApi__Display_Available_Inventory__c = true;
        tt.EventApi__Early_Bird_End_Date__c = Date.today();
        tt.EventApi__Early_Bird_Price__c = 100.00;
        tt.EventApi__Enable_Access_Permissions__c = true;
        tt.EventApi__Enable_Early_Bird_Price__c = true;
        tt.EventApi__Enable_Onsite_Price__c = true;
        tt.EventApi__Inventory_Status__c = 'In-Stock';
        tt.EventApi__Is_Active__c = true;
        tt.EventApi__Is_Published__c = true;
        tt.EventApi__Is_Tax_Deductible__c = true;
        tt.EventApi__Onsite_Price__c = 100.00;
        tt.EventApi__Price__c = 100.00;
        tt.EventApi__Quantity_Available__c = 100;
        tt.EventApi__Quantity_Sold__c = 100;
        insert tt;
    }
    
    static testMethod void validateGetAttendees(){
        List<EventApi__Attendee__c> values = getSeatingSectionAttendees.getAttendees(ev.Id);
        System.assert(values != null);
    }
    
    static testMethod void validateGetSections(){
        List<EventApi__Section__c> values2 = getSeatingSectionAttendees.getSections(ev.Id);
        System.assert(values2 != null);
    }
    
    static testMethod void validateGetSeats(){
        List<EventApi__Seat__c> values3 = getSeatingSectionAttendees.getSeats(ev.Id);
        System.assert(values3 != null);
    }
    
    static testMethod void validateSaveAttendeeList(){
        List<EventApi__Attendee__c> values4 = getSeatingSectionAttendees.getAttendees(ev.Id);
        getSeatingSectionAttendees.saveAttendeeList(values4);
        System.assert(values4 != null);
    }
}