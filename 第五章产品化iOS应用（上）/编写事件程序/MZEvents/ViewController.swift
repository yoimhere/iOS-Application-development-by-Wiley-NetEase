//
//  ViewController.swift
//  MZEvents
//
//  Created by 祝海焜 on 15/12/26.
//  Copyright © 2015年 Matin.Zhou. All rights reserved.
//

import UIKit
import EventKit
import EventKitUI

class ViewController: UIViewController {

override func viewDidLoad() {
    super.viewDidLoad()
        
    let eventStore = EKEventStore()
        
    switch EKEventStore.authorizationStatusForEntityType(EKEntityType){
    
    case.Authorized:readEventsFromCalendar(eventStore)
            
    case.Denied:displayAccessDenied()
            
    case.NotDetermined:
    
    eventStore.requestAccessToEntityType(EKEntityTypeEvent, completion:
        {[weak self](granted: Bool, error: NSError!) -> Void in
        
        if granted {
                    self!.insertEventIntoStore(eventStore)
        } else {
                    self!.displayAccessDenied()
            }
            })
        
    case.Restricted:displayAccessRestricted()
    
        }
            }
    
    func displayAccessDenied(){
        
        print("Access to the event store is denied.")
    
    }
    
    func displayAccessRestricted(){
    
        print("Access To Event store is restricted.")
    
    }
    
    func readEventsFromCalendar(EventStore: EKEventStore){
            
            letCalType = ["Local","Exchange","Birthday"]
            letCalData = EventStore.calendarsForEntityType(EKEntityTypeEvent) as [EKCalendar]
    
            for cal in CalData{
    
                print("Calendar Title = \(cal.title)")
                print("Calendar type = \(CalType[Int(cal.type.value)])")
    
                let color = UIColor(CGColor: cal.CGColor)
                print("Calendar color = \(color)")
    
                if cal.allowsContentModifications == false {
                    print("Calendar cannot be modified")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sourceInEventStore(eventStore: EKEventStore, type: EKSourceType, title: String) ->EKSource?{
    
        for source in eventStore.sources as [EKSource]{
    
        if source.sourceType.value == type.value && source.title.caseInsensitiveCompare(title) == NSComparisonResult.OrderedSame{
        
            return source
    }
        }
    
        return nil
    }
    
    func AddEvent(title: String, startDate: NSDate, endDate: NSDate, inCalendar: EKCalendar, inEventStore: EKEventStore, notes: String) ->Bool{
    
        if inCalendar.allowsContentModifications == false
            {
                print("Calendar does not allow modification")
                
                return false
            }
    
        //event created
        var EventSet = EKEvent(eventStore: inEventStore)
        EventSet.calendar = inCalendar
        EventSet.title = title      //set title
        EventSet.notes = notes      //set note
        EventSet.startDate = startDate  //set start date
        EventSet.endDate = endDate      //set end date
        
        var error:NSError?
        // save event into the calendar
        let EventSetResult = inEventStore.saveEvent(EventSet, span: EKSpanThisEvent, error: &error)
        if EventSetResult == false
            {
                if let CalError = error
            {
        print("An error occurred \(CalError)")
            }
        }
        return EventSetResult
    }
    
    func insertEventIntoStore(store: EKEventStore){
    
        let eventSource = sourceInEventStore(store, type: EKSourceTypeLocal, title: "MyEvent title")
    
            if eventSource == nil{
                
                print("Cloud Calendar not configured with device")
                
                return
            }
                    
        let cal = calWithTitle("Calendar", type:EKCalendarTypeLocal, source: eventSource!, eventType: EKEntityTypeEvent)
    
        if cal == nil{
        
            print("Calendar not found.")
    
            return
            }
        
        //Start event from now
        let startDate = NSDate()
        
        //event will end after 60 min, 60 sec
        let endDate = startDate.dateByAddingTimeInterval(0 * 60 * 60)
            
        if AddEvent("MyEvent", startDate: startDate, endDate: endDate, inCalendar: cal!, inEventStore: store, notes: ""){
    
        print("Event created Successfully.")
    
        } else {
    
        print("Failed to create the event.")
    
        return
    
            }
        }
    
    func EventAlarm(store: EKEventStore, cal: EKCalendar){
    
    // start alarm from now letendDate = startDate.dateByAddingTimeInterval(20.0)
        let startDate = NSDate(timeIntervalSinceNow: 60.0)
        let EventAlarm = EKEvent(eventStore: store)

            EventAlarm.calendar = cal
            EventAlarm.startDate = startDate
            EventAlarm.endDate = endDate
            
        let alarm = EKAlarm(relativeOffset: -5.0)
            
            EventAlarm.title = "MyEvent Alarm"
            EventAlarm.addAlarm(alarm)
        
        var error:NSError?
            
        //End Alarm 5 sec before event
        if store.saveEvent(EventAlarm, span: EKSpanThisEvent, error: &error){
        
            print("Event saved with alarm")
        
        } else if
            
            let theError = error{
                
            print("Error : Failed to save event = \(theError)")
           
            }
        }
    }
