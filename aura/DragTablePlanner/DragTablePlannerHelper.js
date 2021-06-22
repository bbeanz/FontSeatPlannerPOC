({
	// Function to update the attendees on server
    saveAttendees: function(component, event, helper) {
        // Getting the attendee list from lightning component
        var attendeeList = component.get("v.allItems");
        // console.log(attendeeList);
        // Getting the recordViewForm and recordEditForm component
        var recordViewForm = component.find('recordViewForm');
        var recordEditForm = component.find('recordEditForm'); 
        // Initializing the toast event to show toast
        var toastEvent = $A.get('e.force:showToast');
        // Defining the action to save attendee List ( will call the saveAttendeeList apex controller )
        var saveAction = component.get("c.saveAttendeeList");
        // setting the params to be passed to apex controller
        saveAction.setParams({ attendeeList : attendeeList });
        // callback action on getting the response from server
        saveAction.setCallback(this, function(response) {
            // Getting the state from response
            var state = response.getState();
            if(state === 'SUCCESS') {
                // Getting the response from server
                var dataMap = response.getReturnValue();
                // Checking if the status is success
                if(dataMap.status=='success') {
                    // Remove the formHide class
                    //$A.util.removeClass(recordViewForm,'formHide');
                    // Add the formHide class
                    //$A.util.addClass(recordEditForm,'formHide');
                    // Getting the button element
                    //var btn = event.getSource();
                    // Setting the label and name of button back to edit
                    //btn.set('v.name','edit');
                    //btn.set('v.label','Edit');
                    // Setting the success toast which is dismissable ( vanish on timeout or on clicking X button )
                    toastEvent.setParams({
                        'title': 'Success!',
                        'type': 'success',
                        'mode': 'dismissable',
                        'message': 'Table Plan Updated! '+dataMap.message
                    });
                    // Fire success toast event ( Show toast )
                    toastEvent.fire();            
                }
                // Checking if the status is error 
                else if(dataMap.status=='error') {
                    // Setting the error toast which is dismissable ( vanish on timeout or on clicking X button )
                    toastEvent.setParams({
                        'title': 'Error!',
                        'type': 'error',
                        'mode': 'dismissable',
                        'message': dataMap.message
                    });
                    // Fire error toast event ( Show toast )
                    toastEvent.fire();                
                }
            }
            else {
                // Show an alert if the state is incomplete or error
                alert('Error in getting data');
            }
        });
        $A.enqueueAction(saveAction);
    },

})