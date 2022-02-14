//
//  Location.swift
//  Event_mobile_dev_project
//
//  Created by Camille Omnes on 14/02/2022.
//

import Foundation

struct Location: Codable {
    let id: String
    let fields: FieldsLocation
}

struct FieldsLocation: Codable {
    let space: String?
    let building: String?
    let scheduled: [String]?
    let description: String?
    let max: Int?
    let photos: [LocationImage]?

    enum CodingKeys: String, CodingKey {
        case space = "Space name"
        case building = "Building location"
        case scheduled = "Scheduled events"
        case description = "Description"
        case photos = "Photo(s)"
        case max = "Max capacity"
    }
 }


struct LocationImage: Codable {
    let id: String?
    let url: String?
    let filename: String?
    let size: Int?
    let type: String?
    let width: Int?
    let height: Int?
    let thumbnailssmallurl: String?
    let thumbnailslargeurl: String?
    let thumbnailssmallwidth: Int?
    let thumbnailssmallheight: Int?
    let thumbnailslargewidth: Int?
    let thumbnailslargeheight: Int?
}
