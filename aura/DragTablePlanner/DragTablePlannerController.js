({
	
    doInit: function(component, event, helper) {
        var action = component.get("c.getAttendees");
        action.setParams({e1:component.get("v.recordId")});
        action.setCallback(this, function(data) {
          component.set("v.allItems", data.getReturnValue());
          console.log(data.getReturnValue());
            console.log (component.get("v.recordId"));
        });
        $A.enqueueAction(action);
        // Get All Sections
        var section = component.get("c.getSections");
        section.setParams({e2:component.get("v.recordId")});;
        section.setCallback(this, function(data) {
          component.set("v.allSections", data.getReturnValue());
          console.log(data.getReturnValue());
            console.log (component.get("v.recordId"));
        });
        $A.enqueueAction(section);
        // Get All Seats
        var seat = component.get("c.getSeats");
        seat.setParams({e3:component.get("v.recordId")});
        seat.setCallback(this, function(data) {
          component.set("v.allSeats", data.getReturnValue());
          console.log(data.getReturnValue());
        });
        $A.enqueueAction(seat);
    },	
    
    onDragSeatSectionChanged: function(component, event, helper) {
        var title = event.getParam('title');
        var seatid = event.getParam('seatid');
        var item = event.getParam('item');
        var allLists = component.get('v.allItems');
	     var actualItem = allLists.find(function(el) {
            return el.Id == item.Id;
        });
        if (actualItem) {
            //if(title == ""){
              //actualItem.Seat__c = "";
            //} else {
            if(seatid){
                actualItem.EventApi__Seat__c = seatid;
            } else {
                actualItem.EventApi__Seat__c = null;
            }
            //}
            component.set('v.allItems', allLists);
            //console.log('PING!'+title);
        } else {
            //console.log('could not find item ', item, ' in list ', allLists);		
        }        
    },
    
    // Function used to update the attendees
    editAttendees: function(component, event, helper) {
    	helper.saveAttendees(component, event, helper);        
    },
    
    // Function used to update the seats
    editSeats: function(component, event, helper) {
    	helper.saveSeats(component, event, helper);        
    }
 })