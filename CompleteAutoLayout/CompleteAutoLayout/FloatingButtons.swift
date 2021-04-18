//
//  FloatingButtons.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/18.
//

import UIKit

class FloatingButtons: UIViewController {
    
    override func viewDidLoad() {
        
        title = "Floating Buttons"
        view.backgroundColor = .white
        
        let menuButton = MenuButton()
        view.addSubview(menuButton)
        menuButton.snp.makeConstraints {
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        
    }
    
}

class MenuButton: UIView {
    
    private var menuButton: UIButton!
    private var menuStack: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addMenuButton()
        addMenuStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MenuButton {
    
    private func addMenuButton() {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "tray",
                            withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle))
        button.setImage(image, for: .normal)
        button.tintColor = .systemBlue
        
        addSubview(button)
        button.snp.makeConstraints {
            $0.top.equalTo(snp.top).priority(.low)
            $0.bottom.equalTo(snp.bottom)
            $0.leading.equalTo(snp.leading)
            $0.trailing.equalTo(snp.trailing)
        }
        button.addTarget(self, action: #selector(tapMenuButton), for: .touchUpInside)
        menuButton = button
    }
    
    @objc private func tapMenuButton() {
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: [],
                       animations: { [weak self] in
                        self?.menuStack.arrangedSubviews.forEach { btn in
                            btn.isHidden.toggle()
                        }
                        self?.menuStack.layoutIfNeeded()
                       },
                       completion: nil)
        
        menuStack.layoutIfNeeded()
        
    }
    
    private func addMenuStack() {
        let stack = UIStackView()
        stack.axis = .vertical
        
        let buttonImageNames = ["pencil", "person.fill", "photo", "bubble.left.and.bubble.right"]
        buttonImageNames.forEach { imageName in
            let button = UIButton(type: .system)
            let image = UIImage(systemName: imageName,
                                withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle))
            button.setImage(image, for: .normal)
            stack.addArrangedSubview(button)
            button.isHidden = true
            button.tintColor = .brown
        }
        
        addSubview(stack)
        stack.snp.makeConstraints {
            $0.centerX.equalTo(snp.centerX)
            $0.bottom.equalTo(menuButton.snp.top).offset(-8)
            $0.top.equalTo(snp.top).priority(.high)
        }
        menuStack = stack
    }
    
}
