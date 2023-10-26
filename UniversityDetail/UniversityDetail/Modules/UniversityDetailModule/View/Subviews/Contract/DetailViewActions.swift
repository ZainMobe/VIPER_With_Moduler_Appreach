//
//  DetailViewActions.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation

/// `DetailView` will implement these actions. `Presenter` should be responsible to hold these actions.
/// `Presenter` can use use these actions to interact with `DetailView`.
protocol DetailViewActions: AnyObject {
    ///A data source model which will be consumed by `DetailView`.
    ///Presenter is responsible to assign this model
    var dataSource: UniversityDetailDomain? { get set }
    ///Called when user tap on refresh button.
    ///Presenter is responsible to handle action
    var didTapRefresh: (()->Void)? {get set}
}
