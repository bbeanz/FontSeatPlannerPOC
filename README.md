# FontSeatPlannerPOC
Drag and Drop Seating Planner POC for use with Fonteva Events Section/Seat

Pre-requisites:
1) Ensure Fonteva is installed

Outline:
1) This is a Proof of Concept and not considered ready for Production environments 
2) A set of Lightning Components (with associated Apex Classes) providing a drag and drop interface intended for Backend staff to allocate Attendees to a specific Seat

Installation:
1) Install th contents of this repo
2) Use Lightning Page Builder to add the component to a new Tab on the Event page layout
3) For a given Event add Sections and Seats and register some Attendees
4) Visit the newly created tab on the Event page
5) You should now be able to drag registered Attendees, one at a time, from the Unallocated section to a specific seat (or move them from seat to seat)
6) Once attendees have been placed, use the Save button to commit changes to the database
