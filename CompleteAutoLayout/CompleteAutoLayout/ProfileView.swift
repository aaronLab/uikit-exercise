//
//  ProfileView.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/12.
//

import UIKit

class ProfileView: UIViewController {
    
    private let container: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 16
        return sv
    }()
    
    private let profileStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 16
        return sv
    }()
    
    private let profileInfoStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .equalSpacing
        return sv
    }()

    private let image: UIView = {
        let v = UIView()
        v.backgroundColor = .brown
        return v
    }()

    private let lb1: UILabel = {
        let lb = UILabel()
        lb.text = "Label"
        lb.backgroundColor = .gray
        return lb
    }()

    private let lb2: UILabel = {
        let lb = UILabel()
        lb.text = "Label"
        lb.backgroundColor = .gray
        return lb
    }()

    private let lb3: UILabel = {
        let lb = UILabel()
        lb.text = "Label"
        lb.backgroundColor = .gray
        return lb
    }()

    private let tv: UITextView = {
        let tv = UITextView()
        tv.textAlignment = .left
        tv.backgroundColor = UIColor.brown.withAlphaComponent(0.2)
        tv.font = .systemFont(ofSize: 22)
        tv.text = """
        Textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        textview textview textview textview textview textview textview textview textview textview textview textview
        """
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        view.backgroundColor = .white
        
        view.addSubview(container)
        container.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        
        container.addArrangedSubview(profileStack)
        
        container.addArrangedSubview(tv)
        
        profileStack.addArrangedSubview(image)
        image.snp.makeConstraints {
            $0.width.height.lessThanOrEqualTo(150).priority(.required)
            $0.width.height.equalTo(view.snp.width).multipliedBy(0.3).priority(.high)
        }
        
        profileStack.addArrangedSubview(profileInfoStack)
        profileInfoStack.snp.makeConstraints {
            $0.top.equalTo(profileStack.snp.top)
            $0.bottom.equalTo(profileStack.snp.bottom)
        }
        
        for lb in [lb1, lb2, lb3] {
            profileInfoStack.addArrangedSubview(lb)
        }
        
    }

}
