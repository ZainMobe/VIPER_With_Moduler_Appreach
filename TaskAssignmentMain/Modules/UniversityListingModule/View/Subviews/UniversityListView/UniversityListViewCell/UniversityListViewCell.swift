//
//  UniversityListViewCell.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import UIKit
///`UniversityListViewCell` Implementation. Contains two labels.
///![A screenshot of UniversityListViewCell , ](DocCellView)
class UniversityListViewCell: UITableViewCell {
    ///Cell identifier.
    static let identifier = "UniversityListViewCell"
    ///Assign university name to this label.
    @IBOutlet private var lblName: UILabel!
    ///Assign university state to this label.
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
