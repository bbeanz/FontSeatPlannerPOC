({
    allowDrop: function(component, event, helper) {
        if (event.target.hasChildNodes() && event.target.id!='seatun') {
            return false;
        }
        event.preventDefault();        
    },
    
    onDrop: function(component, event, helper) {
        event.preventDefault();
        // console.log('BANG!'+event.target.hasChildNodes()+event.target.id);
        // console.log('BOOM!'+event.target.children.length);
        var dssChangeEvent = component.getEvent('DragSeatSectionChange');
        dssChangeEvent.setParams({
            'title': component.get('v.title'),
            'seatid': component.get('v.seat.Id'),
            //'capacity': component.get('v.capacity-1'),
            'item': JSON.parse(event.dataTransfer.getData('text'))
        });
        dssChangeEvent.fire();        
    },
})