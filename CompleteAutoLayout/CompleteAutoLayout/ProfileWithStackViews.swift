//
//  ProfileWithStackViews.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/13.
//

import UIKit

class ProfileWithStackView: UIViewController {
    
    private let container: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.spacing = 8
        s.distribution = .fill
        s.alignment = .fill
        return s
    }()
    
    private let profile: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.distribution = .fill
        s.alignment = .fill
        s.spacing = 8
        return s
    }()
    
    private let tv: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .gray
        return tv
    }()
    
    private let btns: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .center
        s.distribution = .fillEqually
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile With Stack Views"
        view.backgroundColor = .white
        
        view.addSubview(container)
        container.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        
        container.addArrangedSubview(profile)
        container.addArrangedSubview(tv)
        container.addArrangedSubview(btns)
        
        let img = UIView()
        img.backgroundColor = .black
        profile.addArrangedSubview(img)
        img.snp.makeConstraints {
            $0.width.height.lessThanOrEqualTo(150).priority(.required)
            $0.width.height.equalTo(view.safeAreaLayoutGuide.snp.width).multipliedBy(0.3).priority(.high)
        }
        
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .equalSpacing
        
        for i in 0..<3 {
            
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.alignment = .firstBaseline
            stack.distribution = .fill
            stack.spacing = 8
            
            let lb = UILabel()
            lb.text = "Label \(i)"
            let tf = UITextField()
            tf.placeholder = "Placeholder \(i)"
            tf.borderStyle = .roundedRect
            
            stack.addArrangedSubview(lb)
            stack.addArrangedSubview(tf)
            lb.snp.makeConstraints {
                $0.leading.equalTo(stack.snp.leading)
            }
            tf.snp.makeConstraints {
                $0.trailing.equalTo(stack.snp.trailing)
            }
            
            sv.addArrangedSubview(stack)
            sv.snp.makeConstraints {
                $0.leading.equalTo(stack.snp.leading)
                $0.trailing.equalTo(stack.snp.trailing)
            }
        }
        
        profile.addArrangedSubview(sv)
        
        tv.snp.makeConstraints {
            $0.leading.equalTo(container.snp.leading)
            $0.trailing.equalTo(container.snp.trailing)
        }
        
        for i in 0..<3 {
            let btn = UIButton(type: .system)
            btn.setTitle("Button \(i)", for: .normal)
            btns.addArrangedSubview(btn)
        }
        
    }
    
}
