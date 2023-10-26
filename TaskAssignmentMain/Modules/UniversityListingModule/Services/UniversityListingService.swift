//
//  UniversityListingService.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 24/10/2023.
//

import Foundation

//MARK: UniversityListingServiceImpl implementation
class UniversityListingServiceImpl:  UniversityListingService {
    typealias completionCallback = ((Result<[UniversityListResponse], Error>) -> Void)
    /// Holds  local storage actions
    let localDataSource: UniversityLocalStorageDataActions
    /// Holds network dataSoure actions
    let networkDataSource: UniversityNetworkActions
    /// Add dependencies in this initialiser which are required by this service .
    ///- Parameters:
    ///   - localDataSource: Object of  `UniversityLocalStorage`
    ///   - networkDataSource: Object of  `UniversityNetworkDataSource`
    init(localDataSource: UniversityLocalStorageDataActions, networkDataSource: UniversityNetworkActions) {
        self.localDataSource = localDataSource
        self.networkDataSource = networkDataSource
    }
    
    func fetchUniversityList(forceRefresh: Bool, completion: @escaping completionCallback) {
        if forceRefresh {
            getListingFromRemote(completion: completion)
            return
        }
        
        let listing = fetchUniversityListFromLocalDB()
        
        if listing.count > 0 {
            completion(.success(listing))
        } else {
            getListingFromRemote(completion: completion)
        }
            
    }
    /// Private function to fetch unversity listing from server.
    ///- Parameters:
    ///   - completion: Result type block. Defined in `completionCallback` type alias.
    private func getListingFromRemote(completion: @escaping completionCallback) {
        networkDataSource.fetchUniversityList {[weak self] result in
            switch result {
                case .success(let list):
                    self?.cleanupStoreUniversities(universities: list)
                    completion(.success(list))
                case .failure(let failure):
                    let listing = self?.fetchUniversityListFromLocalDB() ?? []
                    if listing.count > 0 {
                        completion(.success(listing))
                    } else {
                        completion(.failure(failure))
                    }
            }
        }
    }
    /// Private function to fetch unversity listing from local storage .
    ///- Returns: A list of `UniversityListResponse` objects.
    private func fetchUniversityListFromLocalDB() -> [UniversityListResponse] {
        localDataSource.getFromLocalStorage()
    }
    /// Private function oclean up existing  local storage. And save new list to local storage.
    ///- Parameters:
    ///   - universities: Universities that needs to be stored in local storage
    private func cleanupStoreUniversities(universities: [UniversityListResponse]) {
        localDataSource.clearLocalStorate {[weak self] in
            self?.storeUniversities(universities: universities)
        }
    }
    /// Private function  save new list to local storage.
    ///- Parameters:
    ///   - universities: Universities that needs to be stored in local storage
    private func storeUniversities(universities: [UniversityListResponse]) {
        DispatchQueue.main.async {[weak self] in
            self?.localDataSource.saveToLocalStorage(universities: universities, completion: nil)
        }
    }
}
