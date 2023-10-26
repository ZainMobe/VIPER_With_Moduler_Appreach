//
//  UniversityDetailRouter.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import UIKit

//MARK: Router implementation
public final class UniversityDetailRouterImpl {
    ///Enumiraction with associated values. Contains all navigation routes.
    enum Routes {
        ///Go to previous screeen..
        case goBack
    }
    ///Navigation controller.
    let navigationController: UINavigationController
    ///Private initialiser. Add any dependency here.
    ///- Parameters:
    ///   - navigationController: Navigation controller. This will be used for navigation.
    private init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    ///Static function responsible to intialise UniversityDetail module.
    ///- Parameters:
    ///   - navController: `UINavigationController`
    ///   - university: `UniversityDetailDomain` object.
    ///   - delegates: Optional `UniversityDetailDelegates`. Will be confirmed by calling module.
    ///- Returns: `UniversityDetailViewController` type of `UIViewController`
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
}
//MARK: UniversityDetailRouter delegates
extension UniversityDetailRouterImpl: UniversityDetailRouter {
    func go(to route: Routes) {
        switch route {
            case .goBack:
                navigationController.popViewController(animated: true)
        }
    }
}
