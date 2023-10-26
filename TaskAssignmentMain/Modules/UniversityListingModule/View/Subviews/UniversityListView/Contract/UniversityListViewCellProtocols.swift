//
//  UniversityListViewCellProtocols.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation

/// `UniversityListView` will implement these actions. `Presenter` should be responsible to hold these actions.
/// `Presenter` can use use these actions to interact with `UniversityListView`.
protocol UniversityListViewActions: AnyObject {
    ///A data source model which will be consumed by `UniversityListView`.
    ///Presenter is responsible to assign this model
    var dataSource: UniversityListModel? { get set }
    ///Called when user tap on any cell of the list.
    ///Presenter is responsible to handle actions
    var didSelectItem: ((_ index: Int) -> Void)? { get set }
}

/// `UniversityListViewCell` will implement these actions.
protocol UniversityListViewCellActions: AnyObject {
    /// Call this to perform cell setup.
    /// - Parameters:
    ///    - dataSource:`UniversityListCellModel` object.
    func setup(dataSource: UniversityListCellModel)
}
