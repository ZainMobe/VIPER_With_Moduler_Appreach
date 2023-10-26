//
//  UniversityListingService.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 24/10/2023.
//

import Foundation


class UniversityListingServiceImpl:  UniversityListingService {
    typealias completionCallback = ((Result<[UniversityListResponse], Error>) -> Void)
    
    let localDataSource: UniversityLocalStorageDataActions
    let networkDataSource: UniversityNetworkActions
    
    
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
    
    private func getListingFromRemote(completion: @escaping completionCallback) {
        networkDataSource.fetchUniversityList {[weak self] result in
            switch result {
                case .success(let list):
                    self?.cleanupStoreUniversities(universities: list)
                    completion(.success(list))
                case .failure(let failure):
                    completion(.failure(failure))
            }
        }
    }
    
    private func fetchUniversityListFromLocalDB() -> [UniversityListResponse] {
        localDataSource.getFromLocalStorage()
    }
    
    private func cleanupStoreUniversities(universities: [UniversityListResponse]) {
        localDataSource.clearLocalStorate {[weak self] in
            self?.storeUniversities(universities: universities)
        }
    }
    
    private func storeUniversities(universities: [UniversityListResponse]) {
        DispatchQueue.main.async {[weak self] in
            self?.localDataSource.saveToLocalStorage(universities: universities, completion: nil)
        }
    }
}
