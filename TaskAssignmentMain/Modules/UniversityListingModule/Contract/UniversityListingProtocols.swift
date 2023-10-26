//
//  UniversityListingProtocols.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 24/10/2023.
//

import Foundation



protocol UniversityListingService: UniversityListingServiceActions {
}

protocol UniversityListingView: UniversityListingViewActions {
    var presenter: UniversityListingPresenterViewActions! { get set }
}

protocol UniversityListingInteractor: UniversityListingInteractorActions {
}

protocol UniversityListingPresenterInteractorActions {
    func fetchUniversitySuccess(universities: [UniversityListCellModel])
    func handleError(error: String)
}

protocol UniversityListingPresenter: UniversityListingPresenterViewActions, UniversityListingPresenterInteractorActions {
    init(view: UniversityListingViewActions,
         interactor: UniversityListingInteractorActions,
         router: UniversityListingRouterActions
    )
    
    func refreshControlStartRefreshing()
}

protocol UniversityListingRouterActions: AnyObject {
    func go(to route: UniversityListingRouterImpl.Routes)
}

protocol UniversityListingRouter: UniversityListingRouterActions {
}
