//
//  IntrinsicContentSize.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/12.
//

import UIKit

class IntrinsicContentSize: UIViewController {

    private let lb: UILabel = {
        let lb = UILabel()
        lb.text = "Label"
        return lb
    }()

    private let btn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Button", for: .normal)
        return btn
    }()

    private let slider: UISlider = {
        let slider = UISlider()
        return slider
    }()

    private let view1: UIView = {
        let view = MyView()
        view.backgroundColor = .blue
        return view
    }()

    private let view2: UIView = {
        let view = MyView()
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Intrinsic Content Size"
        view.backgroundColor = .white

        view.addSubview(lb)
        view.addSubview(btn)
        view.addSubview(slider)
        view.addSubview(view1)
        view.addSubview(view2)

        lb.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }

        btn.snp.makeConstraints {
            $0.top.equalTo(lb.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }

        slider.snp.makeConstraints {
            $0.top.equalTo(btn.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.width.equalTo(200)
        }

        view1.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }

        view2.snp.makeConstraints {
            $0.top.equalTo(view1.snp.bottom).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }

    }

}
