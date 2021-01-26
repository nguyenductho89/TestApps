//
//  NetworkLayer.swift
//  TestApp
//
//  Created by Nguyễn Đức Thọ on 1/23/21.
//  Copyright © 2021 thond. All rights reserved.
//

import Foundation
import Combine

public enum HTTPMethod : String {
    
    case options
    
    case get
    
    case head
    
    case post
    
    case put
    
    case patch
    
    case delete
    
    case trace
    
    case connect
}

//Generic Source: Resful api, firebase, local files
protocol DataModelSource: URLRequestConvertible {

    var baseURL: URL { get set }
    
    var method: HTTPMethod { get set }
    
    var path: String { get set }
    
    var httpBody: Data? { get set }
    
    var headers: [String:String] { get set }
    
    var jsonData: String { get set }
}

extension DataModelSource {
    func asURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = httpBody
        request.allHTTPHeaderFields = headers
        return request
    }
}
//Resful api
public protocol URLRequestConvertible {
    func asURLRequest() -> URLRequest
}
//Firebase
//Local file





//Generic client
protocol DataClientProtocol {
    associatedtype DataModelResponse
    func request(to source: DataModelSource) -> AnyPublisher<DataModelResponse, Error>
}
//Resful client
struct RestfulClient<T: Codable>: DataClientProtocol {
    typealias DataModelResponse = T

    func request(to source: DataModelSource) -> AnyPublisher<T, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: source.asURLRequest()) // 3
            .tryMap { result -> T in
                let value = try JSONDecoder().decode(T.self, from: result.data) // 4
                return value
            }
            .receive(on: DispatchQueue.main) // 6
            .eraseToAnyPublisher() // 7
    }
}

struct LocalClient<T: Codable>: DataClientProtocol {
    typealias DataModelResponse = T
    
    func request(to source: DataModelSource) -> AnyPublisher<T, Error> {
        let data = source.jsonData.data(using: .utf8)!
        let value = try! JSONDecoder().decode(T.self, from: data)
        return Just(value)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

struct ErrorDecodeClient<T: Codable>: DataClientProtocol {
    typealias DataModelResponse = T
    
    func request(to source: DataModelSource) -> AnyPublisher<T, Error> {
        return Fail<T, Error>(error: DataClientError.decode).eraseToAnyPublisher()
    }
}

//Source1
struct MovieSource: DataModelSource {

    var jsonData: String = """
{
    "page": 1,
    "results": [
        {
            "genre_ids": [
                14,
                28,
                12
            ],
            "original_language": "en",
            "original_title": "Wonder Woman 1984",
            "poster_path": "/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
            "video": false,
            "vote_average": 7.1,
            "overview": "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s and finds a formidable foe by the name of the Cheetah.",
            "id": 464052,
            "vote_count": 3052,
            "title": "Wonder Woman 1984",
            "adult": false,
            "backdrop_path": "/srYya1ZlI97Au4jUYAktDe3avyA.jpg",
            "release_date": "2020-12-16",
            "popularity": 3214.247,
            "media_type": "movie"
        },
        {
            "original_language": "en",
            "original_title": "Outside the Wire",
            "poster_path": "/e6SK2CAbO3ENy52UTzP3lv32peC.jpg",
            "video": false,
            "vote_average": 6.6,
            "overview": "In the near future, a drone pilot is sent into a deadly militarized zone and must work with an android officer to locate a doomsday device.",
            "release_date": "2021-01-15",
            "vote_count": 407,
            "title": "Outside the Wire",
            "adult": false,
            "backdrop_path": "/lOSdUkGQmbAl5JQ3QoHqBZUbZhC.jpg",
            "id": 775996,
            "genre_ids": [
                53,
                28,
                878
            ],
            "popularity": 2496.27,
            "media_type": "movie"
        }    ],
    "total_pages": 1000,
    "total_results": 20000
}
"""
    
    var httpBody: Data?
    
    var headers: [String : String] = ["api_key":"d8bf82ea45a0089344a096dc38bad04f"]
    
    var baseURL = URL(string: "https://api.themoviedb.org/3/")!
    
    var method: HTTPMethod = .get
    
    var path: String = "trending/movie/week"
}

//HAndle error

enum DataClientError: Error {
    case decode
}



struct RestApiClient {

    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> { // 2
        return URLSession.shared
            .dataTaskPublisher(for: request) // 3
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data) // 4
                return Response(value: value, response: result.response) // 5
            }
            .receive(on: DispatchQueue.main) // 6
            .eraseToAnyPublisher() // 7
    }
}
