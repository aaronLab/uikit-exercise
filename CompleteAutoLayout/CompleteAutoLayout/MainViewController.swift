//
//  ViewController.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/12.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let s = UIScrollView()
        return s
    }()
    
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
    
    private lazy var btn7: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Profile with Stack View", for: .normal)
        btn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        return btn
    }()
    
    private lazy var btn8: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Dynamic Stack View", for: .normal)
        btn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        return btn
    }()
    
    private lazy var btn9: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Working with Scroll View", for: .normal)
        btn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        return btn
    }()
    
    private lazy var btn10: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Dynamic Scroll View", for: .normal)
        btn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        return btn
    }()
    
    private lazy var btn11: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Log In View", for: .normal)
        btn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        return btn
    }()
    
    private lazy var btn12: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Table View Cells", for: .normal)
        btn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        return btn
    }()
    
    private lazy var btn13: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Floating Buttons", for: .normal)
        btn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Complete Auto Layout"
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        
        scrollView.addSubview(stack)
        stack.snp.makeConstraints {
            $0.width.equalTo(scrollView.snp.width)
            $0.top.equalTo(scrollView.snp.top)
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.leading.equalTo(scrollView.snp.leading)
            $0.trailing.equalTo(scrollView.snp.trailing)
        }
        
        stack.addArrangedSubview(btn1)
        stack.addArrangedSubview(btn2)
        stack.addArrangedSubview(btn3)
        stack.addArrangedSubview(btn4)
        stack.addArrangedSubview(btn5)
        stack.addArrangedSubview(btn6)
        stack.addArrangedSubview(btn7)
        stack.addArrangedSubview(btn8)
        stack.addArrangedSubview(btn9)
        stack.addArrangedSubview(btn10)
        stack.addArrangedSubview(btn11)
        stack.addArrangedSubview(btn12)
        stack.addArrangedSubview(btn13)
        
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
        
        if sender == btn7 {
            navigationController?.pushViewController(ProfileWithStackView(), animated: true)
        }
        
        if sender == btn8 {
            navigationController?.pushViewController(DynamicStackView(), animated: true)
        }
        
        if sender == btn9 {
            navigationController?.pushViewController(WorkingWithScrollView(), animated: true)
        }
        
        if sender == btn10 {
            navigationController?.pushViewController(DynamicScrollView(), animated: true)
        }
        
        if sender == btn11 {
            navigationController?.pushViewController(LogInView(), animated: true)
        }
        
        if sender == btn12 {
            navigationController?.pushViewController(TableViewCells(), animated: true)
        }
        
        if sender == btn13 {
            navigationController?.pushViewController(FloatingButtons(), animated: true)
        }
        
        else { return }
        
        
        
    }


}

