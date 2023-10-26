//
//  UniversityDetailPresenter.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation


class UniversityDetailPresenterImpl: UniversityDetailPresenter {
    let view: UniversityDetailViewActions
    let interactor: UniversityDetailInteractorActions
    let router: UniversityDetailRouterActions
    weak var detailView: DetailViewActions?
    fileprivate weak var delegates: UniversityDetailDelegates?
    var navigationTitle: String  = "Details"
    
    
    required init(view: UniversityDetailViewActions,
                  interactor: UniversityDetailInteractorActions,
                  router: UniversityDetailRouterActions,
                  delegates: UniversityDetailDelegates?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.delegates = delegates
    }
    
    func viewDidLoad() {
        view.setupUI()
        view.addUniversityDetail()
    }
    
    func configure(detailView: DetailViewActions) {
        self.detailView = detailView
        self.detailView?.dataSource = interactor.getUniversityDetails()
        self.detailView?.didTapRefresh = {[weak self] in
            self?.delegates?.refreshList()
            self?.router.go(to: .goBack)
        }
    }

    
    
}
