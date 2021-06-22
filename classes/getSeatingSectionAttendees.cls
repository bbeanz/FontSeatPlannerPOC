public without sharing class getSeatingSectionAttendees{
    @AuraEnabled
  	public static List<EventApi__Attendee__c> getAttendees(Id e1){
    	return [SELECT Id, EventApi__Full_Name__c, EventApi__Seat__c, Account_Name__c, EventApi__Event__c
                FROM EventApi__Attendee__c
				WHERE EventApi__Event__c = :e1                
               ];
  	}
    
    @AuraEnabled
  	public static List<EventApi__Section__c> getSections(Id e2){
    	return [SELECT Id, Name, EventApi__Event__c, EventApi__Display_Order__c
                FROM EventApi__Section__c
                WHERE EventApi__Event__c = :e2
                ORDER BY EventApi__Display_Order__c ASC
               ];
  	}
    
    @AuraEnabled
  	public static List<EventApi__Seat__c> getSeats(Id e3){
    	return [SELECT Id, Name, EventApi__Seat_Number__c, EventApi__Section__c
                FROM EventApi__Seat__c
                WHERE EventApi__Section__r.EventApi__Event__c = :e3
                ORDER BY EventApi__Section__c, EventApi__Seat_Number__c ASC
               ];
  	}
    
    @AuraEnabled
    public static Map<String,String> saveAttendeeList(List<EventApi__Attendee__c> attendeeList) {
        // Forming a  string map to return response
        Map<String,String> resultMap = new Map<String,String>();
        // Adding try catch for exception handling
        try {
            // Updating the Attendee List
            update attendeeList;
            // Setting the success status and message in resultMap
            resultMap.put('status', 'success');
                resultMap.put('message', 'Attendees Updated Successfully');        
        }
        catch(Exception e) {
            // Setting the success status and message in resultMap
            resultMap.put('status', 'error');
                        resultMap.put('message',e.getMessage());
        }
        // Returning the result string map
        return resultMap;
    }
}