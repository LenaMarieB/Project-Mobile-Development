//
//  Event.swift
//  Event_mobile_dev_project
//
//  Created by Camille Omnes on 31/01/2022.
//

import Foundation

struct Event: Codable {
    let id: String
    let fields: Fields
}

struct Fields: Codable {
    let notes: String?
    let activity: String?
    let end : String?
    let start : String?
    let location : [String]?
    let topic : [String]?
    let speakers : [String]?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case notes = "Notes"
        case activity = "Activity"
        case end = "End"
        case start = "Start"
        case location = "Location"
        case topic = "Topic / theme"
        case speakers = "Speaker(s)"
        case type = "Type"
    }
 }

struct Records: Codable {
    var records: [Event]?
}
