//
//  UniversityDetailInteractor.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation


class UniversityDetailInteractorImpl: UniversityDetailInteractor {
    
    var presenter: UniversityDetailPresenterRouterActions?
    let university: UniversityDetailDomain
    
    
    init(university: UniversityDetailDomain) {
        self.university = university
    }
    
    func getUniversityDetails() -> UniversityDetailDomain {
        university
    }
    
}
