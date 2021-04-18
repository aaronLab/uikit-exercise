//
//  SocialCell - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import SnapKit

class ViewController: UIViewController {
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        addTable()
        configureTable()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("NeedsUpdateLayout"),
                                               object: nil,
                                               queue: nil) { noti in
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        navigationController?.navigationBar.tintColor = .white
        
        let searchBar: UISearchBar = UISearchBar()
        searchBar.placeholder = "검색"
        searchBar.searchTextField.backgroundColor = .white
        
        navigationItem.titleView = searchBar
        
        let cameraButton = UIBarButtonItem(systemItem: .camera)
        let shareButton = UIBarButtonItem(systemItem: .action)
        
        navigationItem.leftBarButtonItem = cameraButton
        navigationItem.rightBarButtonItem = shareButton
    }
    
    private func addTable() {
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top)
            $0.bottom.equalTo(view.snp.bottom)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
        }
    }
    
    private func configureTable() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(FeedTableViewCell.self,
                           forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FeedTableViewCell else {
            return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        }
        cell.feed = Feed.feeds[Int.random(in: 0...9)]
        return cell
    }
}
