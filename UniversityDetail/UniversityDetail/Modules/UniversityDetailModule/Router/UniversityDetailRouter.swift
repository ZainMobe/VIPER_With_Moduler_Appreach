//
//  UniversityDetailRouter.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import UIKit


public final class UniversityDetailRouterImpl: UniversityDetailRouter, UniversityDetailRouterActions {
    enum Routes {
        case goBack
    }
    
    
    let navigationController: UINavigationController
    
    
    private init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public static func create(navController: UINavigationController, university: UniversityDetailDomain, delegates: UniversityDetailDelegates? = nil) -> UIViewController {
        let view = UniversityDetailViewController()
        
        let router = UniversityDetailRouterImpl(navigationController: navController)
        let interactor = UniversityDetailInteractorImpl(university: university)
        let presenter = UniversityDetailPresenterImpl(
            view: view,
            interactor: interactor,
            router: router, 
            delegates: delegates)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
    func go(to route: Routes) {
        switch route {
            case .goBack:
                navigationController.popViewController(animated: true)
        }
    }
}
