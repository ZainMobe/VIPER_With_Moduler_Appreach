//
//  UniversityDetailView.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import UIKit

class DetailView: UIView, DetailViewActions {
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblDomainLink: UILabel!
    @IBOutlet var lblWebpage: UILabel!
    
    
    var didTapRefresh: (() -> Void)?
    var dataSource: UniversityDetailDomain? {
        didSet {
            modelAssigned()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func modelAssigned() {
        lblName.text = dataSource?.universityName
        lblDomainLink.text = dataSource?.domain
        lblWebpage.text = dataSource?.webPage?.absoluteString
    }

    
    @IBAction func actionRefresh(_ sender: Any) {
        didTapRefresh?()
    }
}
