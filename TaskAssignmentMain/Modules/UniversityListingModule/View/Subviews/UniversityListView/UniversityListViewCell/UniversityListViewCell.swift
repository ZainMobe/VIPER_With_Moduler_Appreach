//
//  UniversityListViewCell.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import UIKit

class UniversityListViewCell: UITableViewCell {
    static let identifier = "UniversityListViewCell"
    
    @IBOutlet private var lblName: UILabel!
    @IBOutlet private var lblState: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
//MARK: UniversityListViewCell action delegates
extension UniversityListViewCell: UniversityListViewCellActions {
    func setup(dataSource: UniversityListCellModel) {
        lblName.text = dataSource.universityName
        lblState.text = dataSource.state
    }
}
