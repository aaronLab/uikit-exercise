//
//  SimpleConstraints.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/12.
//

import UIKit

class SimpleConstraints: UIViewController {
    
    private let v1: UIView = {
        let v = UIView()
        v.backgroundColor = .purple
        return v
    }()
    
    private let v2: UIView = {
        let v = UIView()
        v.backgroundColor = .blue
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Simple Constraints"
        view.backgroundColor = .white
        
        view.addSubview(v1)
        view.addSubview(v2)
        
        v1.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            $0.width.greaterThanOrEqualTo(150).priority(.required)
        }
        
        v2.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            $0.leading.equalTo(v1.snp.trailing).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            $0.width.equalTo(v1.snp.width).multipliedBy(2).priority(.high)
        }
        
    }
    
}
