//
//  ViewController.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/12.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private lazy var btn1: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Variety Solutions", for: .normal)
        btn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Complete Auto Layout"
        view.backgroundColor = .white
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.snp.makeConstraints {
            $0.width.equalTo(view.snp.width).offset(36)
            $0.center.equalTo(view.snp.center)
        }
        
        stack.addArrangedSubview(btn1)
        
    }
    
    @objc private func btnPressed(_ sender: UIButton) {
        
        if sender == btn1 {
            navigationController?.pushViewController(VarietySolutions(), animated: true)
        }
        
    }


}

