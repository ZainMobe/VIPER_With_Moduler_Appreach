//
//  UniversityListingRouter.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 24/10/2023.
//

import UIKit
import UniversityDetail

//MARK: Router implementation
final class UniversityListingRouterImpl {
    ///Enumiraction with associated values. Contains all navigation routes.
    enum Routes {
        ///Push university detail screen.
        ///- Parameters:
        ///   - university: `UniversityDetailDomain` object.
        ///   - delegates: `UniversityDetailDelegates` for communication with university detail module.
        case pushDetailScreen(university: UniversityDetailDomain, delegates: UniversityDetailDelegates?)
    }
    ///Navigation controller.
    let navigationController: UINavigationController
    ///Private initialiser. Add any dependency here.
    ///- Parameters:
    ///   - navigationController: Navigation controller. This will be used for navigation.
    private init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    ///Static function responsible to intialise UniversityListing module.
    ///- Returns: UniversityListingViewController type of `UIViewController`
    static func create(navController: UINavigationController) -> UIViewController {
        let view = UniversityListingViewController()
        
        let router = UniversityListingRouterImpl(navigationController: navController)
        let service = UniversityListingServiceImpl(
            localDataSource: UniversityLocalStorage(),
            networkDataSource: UniversityNetworkDataSource())
        let interactor = UniversityListingInteractorImpl(service: service)
        let presenter = UniversityListingPresenterImpl(
            view: view,
            interactor: interactor,
            router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}
//MARK: UniversityListingRouter delegates
extension UniversityListingRouterImpl: UniversityListingRouter {
    func go(to route: Routes) {
        switch route {
            case let .pushDetailScreen(university, delegate):
                pushUniversityDetailScreen(university: university, delegate: delegate)
        }
    }
}
//MARK: Fileprivate methods
extension UniversityListingRouterImpl {
    ///Push university detail screen in navigation stack.
    ///- Parameters:
    ///   - university: `UniversityDetailDomain` object.
    ///   - delegate: `UniversityDetailDelegates` for communication with university detail module.
    fileprivate func pushUniversityDetailScreen(university: UniversityDetailDomain, delegate: UniversityDetailDelegates?) {
        let controller = UniversityDetailRouterImpl.create(
            navController: navigationController,
            university: university,
            delegates: delegate)
        navigationController.pushViewController(controller, animated: true)
    }
}
