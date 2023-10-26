//
//  UniversityListingProtocols.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 24/10/2023.
//

import Foundation


/// `Service` will implement only this delegate. If you want to add more actions you can confirm here.
protocol UniversityListingService: UniversityListingServiceActions {
}
/// `View` will implement only this delegate. If you want to add more actions you can confirm here.
protocol UniversityListingView: UniversityListingViewActions {
    /// `View` can interact with presenter using these presenter delegate actions.
    var presenter: UniversityListingPresenterViewActions! { get set }
}
/// `Interactor` will implement only this delegate. If you want to add more actions you can confirm here.
protocol UniversityListingInteractor: UniversityListingInteractorActions {
}

/// `Presenter` will implement  delegate. If you want to add more actions you can confirm here.
protocol UniversityListingPresenter: UniversityListingPresenterViewActions, UniversityListingPresenterInteractorActions {
    /// Use initialiser will be used to inject any dependency to presenter during initialisation.
    ///
    ///- Parameters:
    ///   - view: Pass `UniversityListingViewController` confirmting to delegate `UniversityListingView`.
    ///   - interactor: Pass `UniversityListingInteractorImpl` confirmting to delegate `UniversityListingInteractor`.
    ///   - router: Pass `UniversityListingRouterImpl` confirmting to delegate `UniversityListingRouter`.
    init(view: UniversityListingViewActions,
         interactor: UniversityListingInteractorActions,
         router: UniversityListingRouterActions
    )
}

/// `Router` will implement only this delegate. If you want to add more actions you can confirm here.
protocol UniversityListingRouter: UniversityListingRouterActions {
}
