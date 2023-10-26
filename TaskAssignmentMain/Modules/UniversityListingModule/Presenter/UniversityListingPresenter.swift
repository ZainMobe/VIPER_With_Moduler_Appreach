//
//  UniversityListingInteractor.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 24/10/2023.
//

import Foundation
import UniversityDetail


class UniversityListingPresenterImpl: UniversityListingPresenter {
    var navigationTitle: String = "Universities"
    
    let view: UniversityListingViewActions
    let interactor: UniversityListingInteractorActions
    let router: UniversityListingRouterActions
    var universityListView: UniversityListViewActions?
    fileprivate var universityListModel: UniversityListModel?
    
    
    required init(view: UniversityListingViewActions, interactor: UniversityListingInteractorActions, router: UniversityListingRouterActions) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
}
//MARK: Presenter View Delegates
extension UniversityListingPresenterImpl {
    func viewDidLoad() {
        view.setupUI()
        view.addVehicleList()
    }
    
    func configure(universityListView: UniversityListViewActions) {
        self.universityListView = universityListView
        interactor.fetchUniversityList(forceRefresh: false)
    }
    
    func refreshControlStartRefreshing() {
        
    }
}
//MARK: Presenter Interactor Delegates
extension UniversityListingPresenterImpl {
    func fetchUniversitySuccess(universities: [UniversityListCellModel]) {
        universityListModel = UniversityListModel(models: universities)
        setupUniversityListView()
    }
    
    private func setupUniversityListView() {
        guard let universityListModel else {return}
        universityListView?.dataSource = universityListModel
        universityListView?.didSelectItem = {[weak self] index in
            guard let university = self?.interactor.getUniversity(at: index) else {return}
            self?.router.go(to: .pushDetailScreen(university: university, delegates: self))
        }
    }
    
    func handleError(error: String) {
        debugPrint("Handle error")
    }
}

extension UniversityListingPresenterImpl: UniversityDetailDelegates {
    func refreshList() {
        interactor.fetchUniversityList(forceRefresh: true)
    }
}
