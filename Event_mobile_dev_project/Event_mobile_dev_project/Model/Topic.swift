//
//  Topic.swift
//  Event_mobile_dev_project
//
//  Created by Camille Omnes on 14/02/2022.
//

import Foundation

struct Topic: Codable {
    let id: String
    let fields: FieldsTopic
}

struct FieldsTopic: Codable {
    let events: [String]?
    let topic: String?
    let count : String?
    
    enum CodingKeys: String, CodingKey {
        case events = "Relevant event(s)"
        case topic = "Topic / theme"
        case count = "Count"
    }
 }

struct RecordsTopic: Codable {
    var records: [Topic]?
}

/*
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

}*/
