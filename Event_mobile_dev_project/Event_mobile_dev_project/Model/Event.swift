//
//  Event.swift
//  Event_mobile_dev_project
//
//  Created by Camille Omnes on 31/01/2022.
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
/*
struct Event: Codable {
    let id: String
    let fields: Fields
}

struct Fields: Codable {
    let Notes: String
    let Activity: String
    let End :
    let Start :
    let Location : [String]
    enum Type: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case images = "Images"
    }
 
 }

struct Response: Codable {
    var records: [Event]
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

func getEvents(for keyword: String, callback: @escaping (Bool, [Event]?,
 String?) -> Void) {
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
                                    callback(true, result.events, nil)
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
*/
