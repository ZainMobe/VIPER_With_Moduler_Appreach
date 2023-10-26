//
//  UniversityDetailInteractor.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation

///`UniversityListingInteractorImpl` implementation
class UniversityDetailInteractorImpl: UniversityDetailInteractor {
    ///Holds Presenter actions
    var presenter: UniversityDetailPresenterInteractionActions?
    ///Holds `Presenter` object
    let university: UniversityDetailDomain
    ///Inject any interactor dependency here.
    ///- Parameters:
    ///   - university: `UniversityDetailDomain` object.
    init(university: UniversityDetailDomain) {
        self.university = university
    }
    ///Get `UniversityDetailDomain` object.
    ///- Returns: `UniversityDetailDomain` object.
    func getUniversityDetails() -> UniversityDetailDomain {
        university
    }
    
}
