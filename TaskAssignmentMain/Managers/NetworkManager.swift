//
//  NetworkManager.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 24/10/2023.
//

import Foundation


///API errors enumiration.
enum ApiErrors: Error {
    case invalidResponse
    case failToParse
    case invalidDowncasting
    case noInternet
    case invalidQueryParams
    case serverDown
}

//MARK: NetworkManager singleton object.
class NetworkManager {
    ///Only Shared instance of `NetworkManager`
    static let shared = NetworkManager()
    ///Private initialiser to restric object construction outside of the scope.
    private init() { }
    /// This function will decode data to generic codable object..
    ///
    ///- Parameters:
    ///   - data: `Data` object.
    func parseData<T: Codable>(_ data: Data) throws -> T {
        try JSONDecoder().decode(T.self, from: data)
    }
    /// This function will create `URLComponents`.
    ///
    ///- Parameters:
    ///   - baseURL: `String` object.
    ///   - endPoint: `String` object.
    ///   - params: `[String: String]` object.
    ///
    ///- Returns: Optional `URLComponents` object.
    func urlParser(baseURL: String, endPoint: String, params: [String: String]?) -> URLComponents? {
        guard var components = URLComponents(string: baseURL+endPoint) else {
            return nil
        }
        if let params {
            components.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value)}
        }
        return components
    }
    /// Make networking get request.
    ///
    ///- Parameters:
    ///   - endPoint: Route endpoint. Do not append base URL.
    ///   - params: Optional query parameters
    ///   - completion: Return result type with generic (`Codable`) success object and `Error` object.
    func makeGetRequest<T: Codable>(endPoint: String, params: [String: String]? = nil, completion: @escaping ((Result<T, Error>) -> Void)) {
        guard let components = urlParser(baseURL: APIConstants.baseURL, endPoint: endPoint, params: params) else {
            completion(.failure(ApiErrors.serverDown))
            return
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
                let obj: T = try self.parseData(data)//try JSONDecoder().decode(T.self, from: data)
                completion(.success(obj))
            } catch let jsonErr {
                debugPrint(jsonErr)
                completion(.failure(ApiErrors.failToParse))
            }
        }.resume()
    }
}
///Extension ofr `ApiErrors`.
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
