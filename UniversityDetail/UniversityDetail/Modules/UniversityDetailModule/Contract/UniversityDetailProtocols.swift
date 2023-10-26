//
//  UniversityDetailProtocols.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation


/// `View` will implement only this delegate. If you want to add more actions you can confirm here.
protocol UniversityDetailView: UniversityDetailViewActions {
    /// `View` can interact with presenter using these presenter delegate actions.
    var presenter: UniversityDetailPresenterViewActions! { get set }
}
/// `Interactor` will implement only this delegate. If you want to add more actions you can confirm here.
protocol UniversityDetailInteractor: UniversityDetailInteractorActions {
}
/// `Presenter` will implement  delegate. If you want to add more actions you can confirm here.
protocol UniversityDetailPresenter: UniversityDetailPresenterViewActions, UniversityDetailPresenterInteractionActions {
    /// Use initialiser will be used to inject any dependency to presenter during initialisation.
    ///
    ///- Parameters:
    ///   - view: Pass `UniversityDetailViewController` confirmting to delegate `UniversityDetailView`.
    ///   - interactor: Pass `UniversityDetailInteractorImpl` confirmting to delegate `UniversityDetailInteractor`.
    ///   - router: Pass `UniversityDetailRouterImpl` confirmting to delegate `UniversityDetailRouter`.
    init(view: UniversityDetailViewActions,
         interactor: UniversityDetailInteractorActions,
         router: UniversityDetailRouterActions,
         delegates: UniversityDetailDelegates?
    )
    
}
/// `Router` will implement only this delegate. If you want to add more actions you can confirm here.
protocol UniversityDetailRouter: UniversityDetailRouterActions {
}
