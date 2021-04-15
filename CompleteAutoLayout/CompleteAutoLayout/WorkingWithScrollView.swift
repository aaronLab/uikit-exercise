//
//  WorkingWithScrollView.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/15.
//

import UIKit

class WorkingWithScrollView: UIViewController {
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    private let lb: UILabel = {
        let lb = UILabel()
        lb.text = String(repeating: "Label\n", count: 50)
        lb.numberOfLines = 0
        lb.font = .systemFont(ofSize: 50)
        lb.textColor = .black
        return lb
    }()
    
    private let lb2: UILabel = {
        let lb = UILabel()
        lb.text = "Floating Label"
        lb.textColor = .orange
        lb.font = .systemFont(ofSize: 20, weight: .bold)
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Working With Scroll View"
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.bottom.equalTo(view.snp.bottom)
        }
        
        scrollView.addSubview(lb)
        lb.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top).offset(16)
            $0.leading.equalTo(scrollView.snp.leading).offset(16)
            $0.bottom.equalTo(scrollView.snp.bottom)
        }
        
        scrollView.addSubview(lb2)
        lb2.snp.makeConstraints {
            $0.top.equalTo(scrollView.frameLayoutGuide.snp.top).offset(16)
            $0.trailing.equalTo(scrollView.frameLayoutGuide.snp.trailing).offset(-16)
        }
        
    }
    
}
