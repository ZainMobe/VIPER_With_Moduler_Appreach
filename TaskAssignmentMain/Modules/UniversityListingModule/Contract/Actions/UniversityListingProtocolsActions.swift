//
//  UniversityListingProtocolsActions.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation
import UniversityDetail


protocol UniversityListingServiceActions: AnyObject {
    func fetchUniversityList(forceRefresh: Bool, completion: @escaping ((Result<[UniversityListResponse], Error>) -> Void))
}

protocol UniversityListingViewActions: AnyObject {
    func setupUI()
    func addVehicleList()
}

protocol UniversityListingInteractorActions: AnyObject {
    func fetchUniversityList(forceRefresh: Bool)
    func getUniversity(at index: Int) -> UniversityDetailDomain?
}

protocol UniversityListingPresenterViewActions: AnyObject {
    var navigationTitle: String {get}
    func viewDidLoad()
    func configure(universityListView: UniversityListViewActions)
}
