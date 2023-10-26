//
//  UniversityNetworkDataSource.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation

//MARK: UniversityNetworkDataSource implementation
class UniversityNetworkDataSource: UniversityNetworkActions {
    func fetchUniversityList(completion: @escaping ((Result<[UniversityListResponse], Error>) -> Void)) {
        NetworkManager.shared.makeGetRequest(endPoint: APIConstants.search, params: ["country": "pakistan"]) { (response: Result<[UniversityListResponse], Error>) in
            switch response {
                case .success(let success):
                    completion(.success(success))
                case .failure(let failure):
                    completion(.failure(failure))
            }
        }
    }
    
}
