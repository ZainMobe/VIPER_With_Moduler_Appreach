//
//  UniversityDetailProtocolActions.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation

/// `View` will implement these actions. `Presenter` should be responsible to hold these actions.
/// Presenter can use use these actions to interact with View.
protocol UniversityDetailViewActions: AnyObject {
    ///Use this method when all setup resource are ready and view is ready to setup.
    func setupUI()
    /// Use this method to intialise, and  add `DetailView` subview.
    ///
    /// Use this function when you want to add university detail.
    ///
    /// This function is useful for adding university detail view to
    /// any ``UIKit`` inherited element which is inherited from `UIView`.
    func addUniversityDetail()
}
/// `Interactor` will implement these actions. `Presenter` should be responsible to hold these actions.
/// Presenter can use use these actions to interact with Interactor.
protocol UniversityDetailInteractorActions: AnyObject {
    ///Get university detail domain object.
    ///- Returns: `UniversityDetailDomain` object.
    func getUniversityDetails() -> UniversityDetailDomain
}
/// `Presenter` will implement these actions. `View` should be responsible to hold these actions.
/// View can use use these actions to interact with Presenter.
protocol UniversityDetailPresenterViewActions: AnyObject {
    ///Navigation title from main `UIVIewController`.
    var navigationTitle: String {get}
    /// Call this method when from View when view is loaded.
    func viewDidLoad()
    /// Use this method to configure `DetailView` .
    /// Make sure you have initialised view `DetailView` before you call this method.
    ///- Parameters:
    ///- detailView: These actions will be implemented by `DetailView`.
    ///Presenter can interact with `DetailView` from protocol `DetailViewActions`
    func configure(detailView: DetailViewActions)
}
/// `Presenter` will implement these actions. `Interactor` should be responsible to hold these actions.
/// Interactor can use use these actions to interact with Presenter.
protocol UniversityDetailPresenterInteractionActions: AnyObject {
    
}
/// `Router` will implement these actions. `Presenter` should be responsible to hold these actions.
/// Presenter can use use these actions to interact with Router.
protocol UniversityDetailRouterActions: AnyObject {
    /// Use this method navigation .
    /// Presenter should call this method for navigation.
    ///- Parameters:
    ///- route: Define all routes in `UniversityDetailRouterImpl.Routes`.
    func go(to route: UniversityDetailRouterImpl.Routes)
}
