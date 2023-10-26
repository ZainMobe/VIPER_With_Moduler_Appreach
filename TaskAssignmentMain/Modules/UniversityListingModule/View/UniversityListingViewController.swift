//
//  UniversityListingViewController.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 24/10/2023.
//

import UIKit

class UniversityListingViewController: UIViewController, UniversityListingView {
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var loaderActivity: UIActivityIndicatorView!
    
    
    var presenter: UniversityListingPresenterViewActions!
    private lazy var universityListView = UniversityListView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
    }

    convenience init() {
        self.init(nibName: "\(UniversityListingViewController.self)", bundle: nil)
    }

}

//MARK: View Delegate Methods
extension UniversityListingViewController {
    
    func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        loaderActivity.layer.cornerRadius = 8
    }
    
    func addVehicleList() {
        universityListView = UniversityListView.fromNib()
        presenter.configure(universityListView: universityListView)
        contentStackView.addArrangedSubview(universityListView)
    }
    
    func showLoader() {
        loaderActivity.startAnimating()
    }
    
    func hideLoader() {
        loaderActivity.stopAnimating()
    }
}
