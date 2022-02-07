//
//  Event.swift
//  Event_mobile_dev_project
//
//  Created by Camille Omnes on 31/01/2022.
//

import Foundation

/*
class Event {
    var title: String;
    var type: Type;
    var location: String; //class Location
    var speaker: String; //class Speaker
    var start_time: String;
    var finish_time: String;
    var notes: String;
    var topic: String;
    var day: String;
    
    init(title : String, type : Type, location:String, speaker:String, start_time:String, finish_time:String, notes : String, topic : String, day:String) {
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

*/

struct Event: Codable {
    let id: String
    let fields: Fields
}

struct Fields: Codable {
    let notes: String
    let activity: String
    let end : String
    let start : String
    let location : [String]
    enum CodingKeys: String, CodingKey {
        case notes = "Notes"
        case end = "End"
        case activity = "Activity"
        case start = "Start"
        case location = "Location"
    }
 }

struct Records: Codable {
    var records: [Event]?
}

struct FurnitureImage: Codable {
    let url: String
}

struct Response: Codable {
    let id: String
    let deleted: Bool
}

struct ErrorResponse: Codable {
    let error: String
}

enum RequestType: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

enum CustomError: Error {
    case requestError
    case statusCodeError
    case parsingError
}

func createGETRequest(parameter: String) -> URLRequest {
    let stringUrl = "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Schedule?api_key=keyinNaJ80FXASznv"
     + parameter
    let url = URL(string: stringUrl)
    var request = URLRequest(url: url!)
    request.httpMethod = "GET"
    request.timeoutInterval = 100
    return request
}

func getEvents(for keyword: String, callback: @escaping (Bool,
 Event?, String?) -> Void) {
    let session = URLSession(configuration: .default)
    let request = createGETRequest(parameter: keyword)
    let task = session.dataTask(with: request) { (data, response, error) in
        if error == nil, let data = data {
            if let responseHttp = response as? HTTPURLResponse,
             responseHttp.statusCode == 200 {
                if let responseHttp = response as? HTTPURLResponse,
                             responseHttp.statusCode == 200 {
                                if let result = try? JSONDecoder().decode(Response.self,
                                 from: data) {
                                    callback(true, result.records, nil)
                }
                else {
                                    callback(false, nil, "Parsing error")
                                }
                }}
else {
                callback(false, nil, "Status code error")
            }
}
else {
            callback(false, nil, error?.localizedDescription)
        }
    }
    task.resume()
}
