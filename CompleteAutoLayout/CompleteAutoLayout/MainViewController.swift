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
    
    private lazy var btn2: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Intrinsic Content Size", for: .normal)
        btn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        return btn
    }()
    
    private lazy var btn3: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("CHCR", for: .normal)
        btn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        return btn
    }()
    
    private lazy var btn4: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Simple Constraints", for: .normal)
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
        stack.addArrangedSubview(btn2)
        stack.addArrangedSubview(btn3)
        stack.addArrangedSubview(btn4)
        
    }
    
    @objc private func btnPressed(_ sender: UIButton) {
        
        var vc: UIViewController!
        
        if sender == btn1 {
            vc = AnatomyOfConstraints()
        }
        
        if sender == btn2 {
            vc = IntrinsicContentSize()
        }
        
        if sender == btn3 {
            vc = CHCR()
        }
        
        if sender == btn4 {
            vc = SimpleConstraints()
        }
        
        else { return }
        
        navigationController?.pushViewController(vc, animated: true)
        
    }


}

