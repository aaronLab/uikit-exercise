//
//  ProfileView.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/12.
//

import UIKit

class ProfileView: UIViewController {

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

        view.addSubview(image)
        view.addSubview(lb1)
        view.addSubview(lb2)
        view.addSubview(lb3)
        view.addSubview(tv)

        image.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.width.height.lessThanOrEqualTo(150).priority(.required)
            $0.width.height.equalTo(view.snp.width).multipliedBy(0.3).priority(.high)
        }
        
        lb1.snp.makeConstraints {
            $0.top.equalTo(image.snp.top)
            $0.leading.equalTo(image.snp.trailing).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        
        lb2.snp.makeConstraints {
            $0.centerY.equalTo(image.snp.centerY)
            $0.leading.equalTo(lb1.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        
        lb3.snp.makeConstraints {
            $0.bottom.equalTo(image.snp.bottom)
            $0.leading.equalTo(lb1.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        
        tv.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
        
    }

}
