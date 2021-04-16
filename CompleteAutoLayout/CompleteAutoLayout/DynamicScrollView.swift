//
//  DynamicScrollView.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/15.
//

import UIKit

class DynamicScrollView: UIViewController {
    
    private let background: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        return v
    }()
    
    private let scrollView = UIScrollView()
    
    private let stackBtns: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .center
        s.distribution = .fillEqually
        return s
    }()
    
    private lazy var btnAdd: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        return btn
    }()
    
    private lazy var btnRemove: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Remove", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        return btn
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8.0
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Dynamic Scroll View"
        view.backgroundColor = .white
        
        view.addSubview(background)
        background.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.bottom.equalTo(view.snp.bottom)
        }
        
        background.addSubview(stackBtns)
        stackBtns.snp.makeConstraints {
            $0.leading.equalTo(background.snp.leading).offset(16)
            $0.trailing.equalTo(background.snp.trailing).offset(-16)
            $0.bottom.equalTo(background.snp.bottom).offset(-16)
        }
        
        stackBtns.addArrangedSubview(btnAdd)
        stackBtns.addArrangedSubview(btnRemove)
        
        background.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(background.snp.top)
            $0.leading.equalTo(background.snp.leading)
            $0.trailing.equalTo(background.snp.trailing)
            $0.bottom.equalTo(stackBtns.snp.top).offset(-16)
            $0.width.equalTo(background.snp.width)
        }
        
        scrollView.addSubview(stack)
        stack.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.leading.equalTo(scrollView.snp.leading)
            $0.trailing.equalTo(scrollView.snp.trailing)
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.width.equalTo(scrollView.snp.width)
        }
        
    }
    
    @objc private func btnPressed(_ sender: UIButton) {
        
        if sender == btnAdd {
            let lb = UILabel()
            lb.text = """
            Hello World 1
            Hello World 2
            Hello World 3
            Hello World 4
            Hello World 5
            Hello World 6
            Hello World 7
            Hello World 8
            """
            lb.backgroundColor = .black
            lb.textColor = .white
            lb.font = .preferredFont(forTextStyle: .largeTitle)
            lb.numberOfLines = 0
            lb.adjustsFontForContentSizeCategory = true
            lb.isHidden = true
            stack.addArrangedSubview(lb)
            
            UIView.animate(withDuration: 0.3) {
                lb.isHidden = false
            }
            
        }
        
        if sender == btnRemove {
            
            let lastView = stack.arrangedSubviews.last
            guard let view = lastView else { return }
            
            UIView.animate(withDuration: 0.3) {
                view.isHidden = true
            } completion: { [weak self] _ in
                
                self?.stack.removeArrangedSubview(view)
                
            }
            
        }
        
        else { return }
        
    }
    
}
