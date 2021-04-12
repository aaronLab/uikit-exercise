//
//  CHCR.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/12.
//

import UIKit

class CHCR: UIViewController {
    
    private let lb1: UILabel = {
        let lb = UILabel()
        lb.text = "LabelLabelLabelLabelLabel"
        lb.backgroundColor = .red
        return lb
    }()
    
    private let lb2: UILabel = {
        let lb = UILabel()
        lb.text = "Label"
        lb.backgroundColor = .blue
        return lb
    }()
    
    private let lb3: UILabel = {
        let lb = UILabel()
        lb.text = "LabelLabelLabelLabelLabel"
        lb.backgroundColor = .orange
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "CHCR"
        view.backgroundColor = .white
        
        view.addSubview(lb1)
        view.addSubview(lb2)
        view.addSubview(lb3)
        
        lb1.setContentHuggingPriority(.required, for: .horizontal)
        lb1.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        lb1.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        lb2.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        lb2.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(lb1.snp.trailing).offset(20)
        }
        
        lb3.setContentCompressionResistancePriority(.required, for: .horizontal)
        lb3.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(lb2.snp.trailing).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
    }
    
}
