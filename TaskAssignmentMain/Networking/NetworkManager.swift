//
//  NetworkManager.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 24/10/2023.
//

import Foundation



enum ApiErrors: Error {
    case invalidResponse
    case failToParse
    case invalidDowncasting
    case noInternet
    case invalidQueryParams
    case serverDown
}


class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    
    func makeGetRequest<T: Codable>(endPoint: String, params: [String: String]? = nil, completion: @escaping ((Result<T, Error>) -> Void)) {
        guard var components = URLComponents(string: APIConstants.baseURL+endPoint) else {
            completion(.failure(ApiErrors.serverDown))
            return
        }
        if let params {
            components.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value)}
        }
        
        guard let url = components.url else {
            completion(.failure(ApiErrors.invalidQueryParams))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(.failure(err))
                return
            }
            guard let data = data else {
                completion(.failure(ApiErrors.invalidResponse))
                return
            }
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                completion(.success(obj))
            } catch let jsonErr {
                debugPrint(jsonErr)
                completion(.failure(ApiErrors.failToParse))
            }
        }.resume()
    }
}

extension ApiErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .invalidDowncasting:
                return "Failed to downcast api response."
            case .invalidResponse:
                return "API response is invalid."
            case .failToParse:
                return "Failed to parse data into json object."
            case .noInternet:
                return "Internet connect is not available."
            case .invalidQueryParams:
                return "Query params are not valid. Try again."
            case .serverDown:
                return "Server is down right now. Try again later."
        }
    }
}
