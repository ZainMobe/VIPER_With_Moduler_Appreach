//
//  UniversityListingInteractor.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 24/10/2023.
//

import Foundation
import UniversityDetail

//MARK: Presenter implementation
class UniversityListingPresenterImpl: UniversityListingPresenter {
    ///Holds View actions
    let view: UniversityListingViewActions
    ///Holds Interactor actions
    let interactor: UniversityListingInteractorActions
    ///Holds Router actions
    let router: UniversityListingRouterActions
    ///Holds ListView actions
    var universityListView: UniversityListViewActions?
    ///Holds `UniversityListModel` model object.
    fileprivate var universityListModel: UniversityListModel?
    
    
    required init(view: UniversityListingViewActions, interactor: UniversityListingInteractorActions, router: UniversityListingRouterActions) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    /// fileprivate method used to setup `UniversityListView`. Call this method after universities list is fetched.
    /// This method will setup `UniversityListView`.
    /// This method will handle actions from `UniversityListView`.
    /// In case any university is clicked, this method will call router to navigate to detail screen
    fileprivate func setupUniversityListView() {
        guard let universityListModel else {return}
        universityListView?.dataSource = universityListModel
        universityListView?.didSelectItem = {[weak self] index in
            guard let university = self?.interactor.getUniversity(at: index) else {return}
            self?.router.go(to: .pushDetailScreen(university: university, delegates: self))
        }
    }
    
}
//MARK: Presenter View Delegates
extension UniversityListingPresenterImpl {
    func viewDidLoad() {
        view.setupUI()
        view.addUniversityList()
    }
    
    func configure(universityListView: UniversityListViewActions) {
        self.universityListView = universityListView
        view.showLoader()
        interactor.fetchUniversityList(forceRefresh: false)
    }
}
//MARK: Presenter Interactor Delegates
extension UniversityListingPresenterImpl {
    func fetchUniversitySuccess(universities: [UniversityListCellModel]) {
        view.hideLoader()
        universityListModel = UniversityListModel(models: universities)
        setupUniversityListView()
    }
    
    func handleError(error: String) {
        view.hideLoader()
        debugPrint("Handle error")
    }
}
//MARK: DetailView Delegates.
extension UniversityListingPresenterImpl: UniversityDetailDelegates {
    func refreshList() {
        view.showLoader()
        interactor.fetchUniversityList(forceRefresh: true)
    }
}
