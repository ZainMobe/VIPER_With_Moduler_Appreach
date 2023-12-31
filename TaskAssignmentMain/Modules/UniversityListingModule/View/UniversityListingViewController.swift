//
//  UniversityListingViewController.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 24/10/2023.
//

import UIKit
//MARK: ViewController implementation
class UniversityListingViewController: UIViewController, UniversityListingView {
    ///Stack view which will hold all subviews.
    @IBOutlet weak var contentStackView: UIStackView!
    /// Activity indicator view. Use this to show / stop loading animation
    @IBOutlet weak var loaderActivity: UIActivityIndicatorView!
    
    
    var presenter: UniversityListingPresenterViewActions!
    /// `UniversityListView` lazy variable.
    /// Initialise and store university list view in this veriable
    /// ```swift
    /// func yourMethod() {
    ///     universityListView = //Your initialisation code
    /// }
    /// ```
    ///
    /// ![A screenshot of UniversityListView , ](DoclistView)
    ///
    private lazy var universityListView = UniversityListView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
    }
    /// This will initialise `UniversityListingViewController` from `xib`.
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

    func addUniversityList() {
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
