//
//  UniversityListingProtocolsActions.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation
import UniversityDetail

/// `UniversityListingServiceImpl` will implement these actions. `Interactor` should be responsible to hold these actions.
/// Interactor can use use these actions to interact with Service.
protocol UniversityListingServiceActions: AnyObject {
    /// Use this method to fetch universities list from local database or server.
    ///
    ///
    /// ```swift
    ///    service.fetchUniversityList(forceRefresh: true) {result in
    ///       switch result {
    ///            case .success(let universityList):
    ///            //Handle university list.
    ///            case .failure(let error):
    ///            //Handle errors
    ///       }
    ///    }
    /// ```
    ///- Parameters:
    ///    - forceRefresh: Pass this flag `false` when you want to check data from local storage first.
    ///    If data is not found in local storage then network call will occur and data will be fetched from server.
    ///    - completion: Result type callback. For success you will get `[UniversityListResponse]` and in case failure you will receive `Error`
    func fetchUniversityList(forceRefresh: Bool, completion: @escaping ((Result<[UniversityListResponse], Error>) -> Void))
}
/// `View` will implement these actions. `Presenter` should be responsible to hold these actions.
/// Presenter can use use these actions to interact with View.
protocol UniversityListingViewActions: AnyObject {
    
    func setupUI()
    /// Use this method to add `UniversityListView`.
    ///
    /// Use this function when you want to add university list.
    ///
    /// ```swift
    /// func addUniversityListView {
    ///      yourView.addSubview(universityListView)
    /// }
    /// ```
    ///
    /// This function is useful for adding university list view to
    /// any ``UIKit`` inherited element which is inherited from `UIView`.
    func addUniversityList()
    /// Use this method to show `UIActivityIndicatorView` or any custom loader you are using.
    ///
    ///
    /// ```swift
    /// func showLoader {
    ///      activity.startAnimating()
    /// }
    /// ```
    func showLoader()
    /// Use this method to hide `UIActivityIndicatorView` or any custom loader you are using.
    ///
    ///
    /// ```swift
    /// func hideLoader {
    ///      activity.stopAnimating()
    /// }
    /// ```
    func hideLoader()
}
/// `Interacter` will implement these actions. `Presenter` should be responsible to hold interactor actions.
/// Use these actions to interact with interactor.
protocol UniversityListingInteractorActions: AnyObject {
    /// Use this method to fetch universities list from local database or server.
    ///
    /// Use this function when you want to add university list.
    ///
    /// ```swift
    /// fetchUniversityList(forceRefresh: true)
    /// ```
    ///- Parameters:
    ///- forceRefresh: Pass this flag `false` when you want to check data from local storage first.
    ///If data is not found in local storage then network call will occur and data will be fetched from server.
    func fetchUniversityList(forceRefresh: Bool)
    /// Use this method to fetch universities list from local database or server.
    ///
    /// Use this function when you want to add university list.
    ///
    /// ```swift
    /// fetchUniversityList(forceRefresh: true)
    /// ```
    ///- Parameters:
    ///- index: Pass the index of item where user has clicked on the list.
    ///- Returns: This method returns domain object of `UniversityDetailDomain`.
    func getUniversity(at index: Int) -> UniversityDetailDomain?
}
/// `Presenter` will implement these actions. `View` should be responsible to hold these actions.
/// View can use use these actions to interact with Presenter.
protocol UniversityListingPresenterViewActions: AnyObject {
    /// Call this method when from View when view is loaded.
    func viewDidLoad()
    /// Use this method to configure `UniversityListView` .
    /// Make sure you have initialised view `UniversityListView` before you call this method.
    ///- Parameters:
    ///- universityListView: These actions will be implemented by `UniversityListView`.
    ///Presenter can interact with `UniversityListView` from protocol `UniversityListViewActions`
    func configure(universityListView: UniversityListViewActions)
}
/// `Router` will implement these actions. `Presenter` should be responsible to hold these actions.
/// Presenter can use use these actions to interact with Router.
protocol UniversityListingRouterActions: AnyObject {
    /// Use this method navigation .
    /// Presenter should call this method for navigation.
    ///- Parameters:
    ///- route: Define all routes in `UniversityListingRouterImpl.Routes`.
    func go(to route: UniversityListingRouterImpl.Routes)
}
/// `Presneter` will implement these actions. `Interactor` should be responsible to hold these actions.
/// Interactor can use use these actions to interact with Presenter.
protocol UniversityListingPresenterInteractorActions {
    /// Call this method from `Interactor` when universties are fetched .
    /// Presenter should handle universities.
    ///- Parameters:
    ///- universities: List of `UniversityListCellModel` type objects .
    func fetchUniversitySuccess(universities: [UniversityListCellModel])
    /// Call this method from `Interactor` when there is some error that needs to be handled .
    /// Presenter should handle error.
    ///- Parameters:
    ///- error: Localised description of error.
    func handleError(error: String)
}
/// `UniversityNetworkDataSource` will implement these actions. `Service` should be responsible to hold these actions.
/// Service can use use these actions to interact with `UniversityNetworkDataSource`.
protocol UniversityNetworkActions: AnyObject {
    /// Use this method to fetch universities list from server.
    ///
    ///- Parameters:
    ///    - completion: Result type callback. For success you will get `[UniversityListResponse]` and in case failure you will receive `Error`
    func fetchUniversityList(completion: @escaping ((Result<[UniversityListResponse], Error>) -> Void))
}
/// `UniversityLocalStorage` will implement these actions. `Service` should be responsible to hold these actions.
/// Service can use use these actions to interact with `UniversityLocalStorage`.
protocol UniversityLocalStorageDataActions: AnyObject {
    /// Use this method to save list of universities to local storage..
    ///
    ///- Parameters:
    ///   - universities: A list of `UniversityListResponse` objects.
    ///   - completion: Called when storage operation is completed.
    func saveToLocalStorage(universities: [UniversityListResponse], completion: (()->Void)?)
    /// Use this method to get list of universities from local storage..
    
    ///- Returns: A list of `UniversityListResponse` objects.
    func getFromLocalStorage() -> [UniversityListResponse]
    /// Use this method to clear local storage.
    
    ///- Parameters:
    ///   - completion: Called when clean operation is completed.
    func clearLocalStorate(completion: @escaping (()->Void))
}
