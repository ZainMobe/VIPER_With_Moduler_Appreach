//
//  DetailViewActions.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation


protocol DetailViewActions: AnyObject {
    var dataSource: UniversityDetailDomain? { get set }
    var didTapRefresh: (()->Void)? {get set}
}
