//
//  UniversityListViewCellProtocols.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation


protocol UniversityListViewActions: AnyObject {
    var dataSource: UniversityListModel? { get set }
    var didSelectItem: ((_ index: Int) -> Void)? { get set }
}


protocol UniversityListViewCellActions: AnyObject {
    func setup(dataSource: UniversityListCellModel)
}
