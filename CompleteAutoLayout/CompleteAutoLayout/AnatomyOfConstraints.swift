//
//  AnatomyOfConstraints.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/12.
//

import UIKit

class AnatomyOfConstraints: UIViewController {
    
    private let leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    private let rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(leftView)
        view.addSubview(rightView)
        
        leftView.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        
        rightView.snp.makeConstraints {
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            $0.width.equalTo(leftView.snp.width)
            $0.top.equalTo(leftView.snp.top)
            $0.bottom.equalTo(leftView.snp.bottom)
            
            $0.leading.equalTo(leftView.snp.trailing).offset(20).priority(.low)
            $0.leading.lessThanOrEqualTo(leftView.snp.trailing).offset(100).priority(.high)
        }
    }
    
}
