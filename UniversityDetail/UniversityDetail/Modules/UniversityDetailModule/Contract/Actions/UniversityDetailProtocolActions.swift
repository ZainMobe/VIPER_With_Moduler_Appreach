//
//  UniversityDetailProtocolActions.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation


protocol UniversityDetailServiceActions: AnyObject {
}

protocol UniversityDetailViewActions: AnyObject {
    func setupUI()
    func addUniversityDetail()
}

protocol UniversityDetailInteractorActions: AnyObject {
    func getUniversityDetails() -> UniversityDetailDomain
}

protocol UniversityDetailPresenterViewActions: AnyObject {
    func viewDidLoad()
    func configure(detailView: DetailViewActions)
}
