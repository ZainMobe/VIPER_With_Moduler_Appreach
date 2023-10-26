//
//  UniversityDetailDelegates.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation

/// `Presenter` from previous module will implement this. .
public protocol UniversityDetailDelegates: AnyObject {
    ///Called when user tapp on refresh button from the view.
    func refreshList()
}
