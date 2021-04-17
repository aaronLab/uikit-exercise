//
//  TableViewCells.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/17.
//

import UIKit

fileprivate let cellIdentifier = "cell"

class TableViewCells: UIViewController {
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Table View Cells"
        view.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
    
}

extension TableViewCells: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        cell.textLabel?.text = indexPath.description
        cell.detailTextLabel?.text = """
            adf
            asffdsafsf
            asdfasfsdfsadfa
            sdfasfasdad
            sdfasfasdadsdfasfasdadsdfasfasdad
            """
        cell.detailTextLabel?.numberOfLines = 0
        cell.imageView?.image = UIImage(named: "sampleImage\(indexPath.row % 3)")
        return cell
    }


}

class TableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle = .subtitle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
