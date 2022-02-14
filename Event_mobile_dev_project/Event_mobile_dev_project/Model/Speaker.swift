//
//  Speaker.swift
//  Event_mobile_dev_project
//
//  Created by Camille Omnes on 14/02/2022.
//

import Foundation

struct Speaker: Codable {
    let id: String
    let fields: FieldsSpeaker
}

struct FieldsSpeaker: Codable {
    let name: String?
    let speaking: [String]?
    let role: String?
    let email: String?
    let type: String?
    let status: String?
    let company: [String]?
    let phone: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case speaking = "Speaking at"
        case role = "Role"
        case email = "Email"
        case type = "Type"
        case status = "Status"
        case company = "Company"
        case phone = "Phone"
    }
}
