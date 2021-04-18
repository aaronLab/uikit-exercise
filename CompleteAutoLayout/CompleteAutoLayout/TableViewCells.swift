//
//  TableViewCells.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/17.
//

import UIKit
import SnapKit

fileprivate let cellIdentifier = "cell"

class TableViewCells: UIViewController {

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("layoutCell"),
                                               object: nil,
                                               queue: .main) { noti in
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }

        title = "Table View Cells"
        view.backgroundColor = .white

        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        guard let customCell = cell as? TableViewCell else {
            return cell
        }
        customCell.lbTitle.text = indexPath.description
        customCell.lbDescription.text = """
                                    This is \(indexPath.row) cell.
                                    This is the second line.
                                    This is my custom cell.
                                    This was made programmatically.
                                    \(Int.random(in: 0...1000000)) is a random integer.
                                    """
        customCell.imgView.image = UIImage(named: "sampleImage\(indexPath.row % 3)")
        return customCell
    }


}

class TableViewCell: UITableViewCell {

    let imgView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    let lbTitle: UILabel = {
        let lb = UILabel()
        lb.font = .preferredFont(forTextStyle: .title2)
        return lb
    }()
    let lbDescription: UILabel = {
        let lb = UILabel()
        lb.font = .preferredFont(forTextStyle: .body)
        lb.tintColor = .darkGray
        lb.numberOfLines = 0
        return lb
    }()
    
    private var descriptionHeight: Constraint!

    override init(style: UITableViewCell.CellStyle = .subtitle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureLayout() {
        contentView.addSubview(imgView)
        imgView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(8)
            $0.leading.equalTo(contentView.snp.leading).offset(8)
            $0.width.height.equalTo(contentView.snp.width).multipliedBy(0.2)
        }

        let stack: UIStackView = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 8.0

        contentView.addSubview(stack)
        stack.snp.makeConstraints {
            $0.leading.equalTo(imgView.snp.trailing).offset(8)
            $0.top.equalTo(contentView.snp.top).offset(8)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-8)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-8)
            
            descriptionHeight = $0.height
                .lessThanOrEqualTo(50+16)
                .constraint
        }

        stack.addArrangedSubview(lbTitle)
        stack.addArrangedSubview(lbDescription)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleDescription))
        descriptionHeight.activate()
        lbDescription.addGestureRecognizer(tapGesture)
        lbDescription.isUserInteractionEnabled = true
    }
    
    @objc private func toggleDescription() {
        
        guard let height = descriptionHeight else {
            return
        }
        
        height.isActive.toggle()
        
        NotificationCenter.default.post(name: NSNotification.Name("layoutCell"),
                                        object: nil)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
