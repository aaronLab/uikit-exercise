//
//  SimpleStackView.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/13.
//

import UIKit

class SimpleStackView: UIViewController {
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    private let lb: UILabel = {
        let lb = UILabel()
        lb.text = "Flowers"
        lb.textAlignment = .center
        lb.sizeToFit()
        lb.backgroundColor = .red
        return lb
    }()
    
    private let v: UIView = {
        let v = UIView()
        v.backgroundColor = .gray
        v.setContentHuggingPriority(.init(1), for: .vertical)
        return v
    }()
    
    private let btn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Edit", for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Simple Stack View"
        view.backgroundColor = .white
        
        view.addSubview(stack)
        stack.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        
        stack.addArrangedSubview(lb)
        stack.addArrangedSubview(v)
        stack.addArrangedSubview(btn)
    }
    
}
