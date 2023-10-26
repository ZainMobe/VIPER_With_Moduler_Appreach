//
//  UniversityListView.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import UIKit

class UniversityListView: UIView, UniversityListViewActions {
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
    
    private func setupUI() {
        self.backgroundColor = .clear
        tableView.backgroundColor = .clear
        setupTableView()
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: UniversityListViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: UniversityListViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    
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
