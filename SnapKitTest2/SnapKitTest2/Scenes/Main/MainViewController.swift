//
//  MainViewController.swift
//  SnapKitTest2
//
//  Created by Aaron Lee on 2021/04/07.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, BaseViewController {
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Main View"
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        bindRx()
    }
    
    // MARK: - Helpers

    func configureViews() {
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            let y = view.frame.height
            $0.top.equalTo(y*0.1)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
    }
    
    func bindRx() {
        
    }

}

