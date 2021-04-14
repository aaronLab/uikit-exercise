//
//  DynamicStackView.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/14.
//

import UIKit

class DynamicStackView: UIViewController {
    
    private let vertical: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.spacing = 8
        s.distribution = .fillEqually
        return s
    }()
    
    private let horizontal: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.axis = .horizontal
        s.distribution = .fillEqually
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Dynamic Stack View"
        view.backgroundColor = .white
        
        view.addSubview(vertical)
        view.addSubview(horizontal)
        
        let addBtn = UIButton(type: .system)
        addBtn.setTitle("Add", for: .normal)
        addBtn.setTitleColor(.blue, for: .normal)
        addBtn.addTarget(self, action: #selector(addView), for: .touchUpInside)
        
        let removeBtn = UIButton(type: .system)
        removeBtn.setTitle("Remove", for: .normal)
        removeBtn.setTitleColor(.blue, for: .normal)
        removeBtn.addTarget(self, action: #selector(removeView), for: .touchUpInside)
        
        horizontal.addArrangedSubview(addBtn)
        horizontal.addArrangedSubview(removeBtn)
        
        horizontal.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
        
        vertical.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(horizontal.snp.top)
            $0.leading.equalTo(horizontal.snp.leading)
            $0.trailing.equalTo(horizontal.snp.trailing)
        }
        
    }
    
    @objc func addView() {
        let view = UIView()
        view.backgroundColor = .black
        view.isHidden = true
        vertical.addArrangedSubview(view)
        
        UIView.animate(withDuration: 0.3) {
            view.isHidden = false
        }
    }
    
    @objc func removeView() {
        guard let last = vertical.arrangedSubviews.last else { return }
        
        UIView.animate(withDuration: 0.3) {
            last.isHidden = true
        } completion: { [weak self] _ in
            self?.vertical.removeArrangedSubview(last)
        }

        
    }
    
}
