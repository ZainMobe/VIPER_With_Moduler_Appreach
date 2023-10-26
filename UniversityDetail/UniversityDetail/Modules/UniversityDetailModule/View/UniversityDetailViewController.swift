//
//  UniversityDetailViewController.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import UIKit

class UniversityDetailViewController: UIViewController, UniversityDetailView {
    @IBOutlet weak var contentStackView: UIStackView!
    
    
    var presenter: UniversityDetailPresenterViewActions!
    private lazy var detailView = DetailView()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
    }

    convenience init() {
        self.init(nibName: "\(UniversityDetailViewController.self)", bundle: Bundle(for: UniversityDetailViewController.self))
    }

}

extension UniversityDetailViewController {
    func setupUI() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        title = presenter.navigationTitle
    }
    
    func addUniversityDetail() {
        detailView = DetailView.fromNib()
        presenter.configure(detailView: detailView)
        contentStackView.addArrangedSubview(detailView)
    }
}
