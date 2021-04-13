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
    
    private lazy var btn5: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Profile View", for: .normal)
        btn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        return btn
    }()
    
    private lazy var btn6: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Simple Stack View", for: .normal)
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
        stack.addArrangedSubview(btn5)
        stack.addArrangedSubview(btn6)
        
    }
    
    @objc private func btnPressed(_ sender: UIButton) {
        
        if sender == btn1 {
            navigationController?.pushViewController(AnatomyOfConstraints(), animated: true)
        }
        
        if sender == btn2 {
            navigationController?.pushViewController(IntrinsicContentSize(), animated: true)
        }
        
        if sender == btn3 {
            navigationController?.pushViewController(CHCR(), animated: true)
        }
        
        if sender == btn4 {
            navigationController?.pushViewController(SimpleConstraints(), animated: true)
        }
        
        if sender == btn5 {
            navigationController?.pushViewController(ProfileView(), animated: true)
        }
        
        if sender == btn6 {
            navigationController?.pushViewController(SimpleStackView(), animated: true)
        }
        
        else { return }
        
        
        
    }


}

