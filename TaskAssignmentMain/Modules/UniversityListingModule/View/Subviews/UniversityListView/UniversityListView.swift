//
//  UniversityListView.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import UIKit
/// `UniversityListView` Implementation
///![A screenshot of UniversityListView, ](DoclistView)
class UniversityListView: UIView, UniversityListViewActions {
    /// TableView will display list of universities
    @IBOutlet var tableView: UITableView!

    fileprivate var tableDataSource: [UniversityListCellModel] = []
    var didSelectItem: ((_ index: Int) -> Void)?
    var dataSource: UniversityListModel? {
        didSet {
            modelAssigned()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    /// Setup UI. Perform any UI methods and functions here.
    private func setupUI() {
        self.backgroundColor = .clear
        tableView.backgroundColor = .clear
        setupTableView()
    }
    /// This method will setup `tableView`, register cells,  assign delegates and datasource.
    private func setupTableView() {
        let nib = UINib(nibName: UniversityListViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: UniversityListViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    /// Call this method when `dataSource` is assigned.
    private func modelAssigned() {
        tableDataSource = dataSource?.models ?? []
        tableView.reloadData()
    }
    
}
// MARK: UITableView DataSource
extension UniversityListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UniversityListViewCell.identifier, for: indexPath) as? UniversityListViewCell else {
            return UITableViewCell()
        }
        cell.setup(dataSource: tableDataSource[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}
// MARK: UITableView Delegate
extension UniversityListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectItem?(indexPath.row)
    }
}
