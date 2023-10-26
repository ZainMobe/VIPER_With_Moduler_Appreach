//
//  UniversityListingRouter.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 24/10/2023.
//

import UIKit
import UniversityDetail


final class UniversityListingRouterImpl: UniversityListingRouter {
    enum Routes {
        case pushDetailScreen(university: UniversityDetailDomain, delegates: UniversityDetailDelegates?)
    }
    
    
    let navigationController: UINavigationController
    
    
    private init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
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
    
    func go(to route: Routes) {
        switch route {
            case let .pushDetailScreen(university, delegate):
                pushUniversityDetailScreen(university: university, delegate: delegate)
        }
    }
}

extension UniversityListingRouterImpl {
    fileprivate func pushUniversityDetailScreen(university: UniversityDetailDomain, delegate: UniversityDetailDelegates?) {
        let controller = UniversityDetailRouterImpl.create(
            navController: navigationController,
            university: university,
            delegates: delegate)
        navigationController.pushViewController(controller, animated: true)
    }
}
