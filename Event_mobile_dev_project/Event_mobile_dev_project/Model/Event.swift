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
    
    enum CodingKeys: String, CodingKey {
        case notes = "Notes"
        case activity = "Activity"
        case end = "End"
        case start = "Start"
        case location = "Location"
        case topic = "Topic / theme"
        case speakers = "Speaker(s)"
    }
 }

struct Records: Codable {
    var records: [Event]?
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
    case convertDateError
}

// Request Factory
protocol RequestFactoryProtocol {
    func createRequest(urlStr: String, requestType: RequestType, params:
[String]?) -> URLRequest
    func getEventList(callback: @escaping ((errorType: CustomError?,
     errorMessage: String?), [Event]?) -> Void)
}

private let eventUrlStr =
 "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Schedule?"


private let speakerUrlStr =
"https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Speakers%20%26%20attendees"

private let locationUrlStr =
"https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Event%20locations"






class RequestFactory: RequestFactoryProtocol {

    internal func createRequest(urlStr: String, requestType: RequestType,
     params: [String]?) -> URLRequest {
        var url: URL = URL(string: urlStr)!
        if let params = params {
            var urlParams = urlStr
            for param in params {
                urlParams = urlParams + "/" + param
            }
            print(urlParams)
            url = URL(string: urlParams)!
        }
        var request = URLRequest(url: url)
        request.timeoutInterval = 100
        request.httpMethod = requestType.rawValue
        let accessToken = "keyinNaJ80FXASznv"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField:
         "Authorization")
        return request
    }
    
    func getEventList(callback: @escaping ((errorType: CustomError?,
     errorMessage: String?), [Event]?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: createRequest(urlStr: eventUrlStr, requestType: .get, params: nil)) {(data, response, error) in if let data = data, error == nil {
            if let responseHttp = response as? HTTPURLResponse {
                if responseHttp.statusCode == 200 {
                    if let response = try?
                     JSONDecoder().decode(Records.self, from: data) {
                        callback((nil, nil), response.records)
        }
        else {
                        callback((CustomError.parsingError, "parsing error"), nil)
        } }
        else {
                            callback((CustomError.statusCodeError, "status code : \(responseHttp.statusCode)"), nil)
                        }
        } }
                else {
                    callback((CustomError.requestError,
                     error.debugDescription), nil)
                }
        }
            task.resume()
        }

    func getSpeaker(id: String, callback: @escaping ((errorType: CustomError?,
     errorMessage: String?), [Speaker]?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: createRequest(urlStr: speakerUrlStr, requestType: .get, params: id)) {(data, response, error) in if let data = data, error == nil {
            if let responseHttp = response as? HTTPURLResponse {
                if responseHttp.statusCode == 200 {
                    if let response = try?
                     JSONDecoder().decode(Speaker.self, from: data) {
                        callback((nil, nil), response.records)
        }
        else {
                        callback((CustomError.parsingError, "parsing error"), nil)
        } }
        else {
                            callback((CustomError.statusCodeError, "status code : \(responseHttp.statusCode)"), nil)
                        }
        } }
                else {
                    callback((CustomError.requestError,
                     error.debugDescription), nil)
                }
        }
            task.resume()
        }

    func getLocation(id: String, callback: @escaping ((errorType: CustomError?,
     errorMessage: String?), [Location]?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: createRequest(urlStr: locationUrlStr, requestType: .get, params: [id])) {(data, response, error) in if let data = data, error == nil {
            if let responseHttp = response as? HTTPURLResponse {
                if responseHttp.statusCode == 200 {
                    if let response = try?
                     JSONDecoder().decode(Location.self, from: data) {
                        callback((nil, nil), response.records)
        }
        else {
                        callback((CustomError.parsingError, "parsing error"), nil)
        } }
        else {
                            callback((CustomError.statusCodeError, "status code : \(responseHttp.statusCode)"), nil)
                        }
        } }
                else {
                    callback((CustomError.requestError,
                     error.debugDescription), nil)
                }
        }
            task.resume()
        }    

}
