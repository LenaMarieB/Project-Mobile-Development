//
//  Event.swift
//  Event_mobile_dev_project
//
//  Created by Antoine Montes on 31/01/2022.
//

import Foundation

class Event : Codable {
    var title: String;
    var type: String; //enumeration ?
    var location: String; //class Location
    var speaker: String; //class Speaker
    var start_time: String;
    var finish_time: String;
    var notes: String;
    var topic: String;
    var day: String;
    
    init(title : String, type : String, location:String, speaker:String, start_time:String, finish_time:String, notes : String, topic : String, day:String) {
        self.title = title;
        self.type = type;
        self.location = location;
        self.speaker = speaker;
        self.start_time = start_time;
        self.finish_time = finish_time;
        self.notes = notes;
        self.topic = topic;
        self.day = day;
    }
    
}
