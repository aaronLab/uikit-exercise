//
//  ViewController.swift
//  SnapKitTest1
//
//  Created by Aaron Lee on 2021-04-07.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let label1: UILabel = {
        let label = UILabel()
        label.text = "Dobby is free 1"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.text = "Dobby is free 2"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let label3: UILabel = {
        let label = UILabel()
        label.text = "Dobby is free 3"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        
        view.backgroundColor = .white
        
        view.addSubview(label1)
        label1.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(view.bounds.height*0.25)
        }
        
        view.addSubview(label2)
        label2.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(view.bounds.height*0.5)
        }
        
        view.addSubview(label3)
        label3.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(view.bounds.height*0.75)
        }
        
    }

}

