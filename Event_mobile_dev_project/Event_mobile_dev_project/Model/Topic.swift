//
//  Topic.swift
//  Event_mobile_dev_project
//
//  Created by Camille Omnes on 14/02/2022.
//

import Foundation

struct Topic: Codable {
    var id: String
    var fields: FieldsTopic
}

struct FieldsTopic: Codable {
    let events: [String]
    let topic: String
    let count : Int
    
    enum CodingKeys: String, CodingKey {
        case events = "Relevant event(s)"
        case topic = "Topic / theme"
        case count = "Count"
    }
 }
