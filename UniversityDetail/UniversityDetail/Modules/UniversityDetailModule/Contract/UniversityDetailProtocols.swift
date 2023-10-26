//
//  UniversityDetailProtocols.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation



protocol UniversityDetailView: UniversityDetailViewActions {
    var presenter: UniversityDetailPresenterViewActions! { get set }
}

protocol UniversityDetailInteractor: UniversityDetailInteractorActions {
}

protocol UniversityDetailPresenterRouterActions {
}

protocol UniversityDetailPresenter: UniversityDetailPresenterViewActions, UniversityDetailPresenterRouterActions {
    init(view: UniversityDetailViewActions,
         interactor: UniversityDetailInteractorActions,
         router: UniversityDetailRouterActions,
         delegates: UniversityDetailDelegates?
    )
    
}

protocol UniversityDetailRouterActions: AnyObject {
    func go(to route: UniversityDetailRouterImpl.Routes)
}

protocol UniversityDetailRouter: UniversityDetailRouterActions {
}
