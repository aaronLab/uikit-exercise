//
//  BarGraph.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/19.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class BarGraph: UIViewController {
    
    private var pivots = [0, 20, 40, 60, 80, 100]
    
    private var percentages = (1...12).map { _ in Int.random(in: 0...100) }
    
    private let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    private let percentageStack: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.alignment = .fill
        s.distribution = .fillEqually
        return s
    }()
    
    private let scrollView = UIScrollView()
    
    private let chartStack: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .fill
        s.distribution = .fillEqually
        s.spacing = 8
        return s
    }()
    
    private let monthStack: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .fill
        s.distribution = .fillEqually
        s.spacing = 8
        return s
    }()
    
    private let btn: UIButton = {
        let b = UIButton(type: .system)
        b.setImage(UIImage(systemName: "repeat"), for: .normal)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Bar Graph"
        view.backgroundColor = .white
        
        view.addSubview(percentageStack)
        view.addSubview(scrollView)
        scrollView.addSubview(chartStack)
        scrollView.addSubview(monthStack)
        scrollView.addSubview(btn)
        
        let percentageLabels = pivots.reversed().map { per -> UILabel in
            let l = UILabel()
            l.text = "\(per)"
            return l
        }
        
        percentageLabels.forEach { percentageStack.addArrangedSubview($0) }
        
        percentageStack.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.lastBaseline.equalTo(chartStack.snp.bottom).priority(.required)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(percentageStack.snp.trailing)
            $0.height.equalTo(view.safeAreaLayoutGuide.snp.height)
        }
        
        months.forEach { month in
            let l = UILabel()
            l.text = month
            monthStack.addArrangedSubview(l)
        }
        
        chartStack.snp.makeConstraints {
            $0.top.equalTo(scrollView.contentLayoutGuide.snp.top)
            $0.leading.equalTo(scrollView.contentLayoutGuide.snp.leading)
            $0.trailing.equalTo(scrollView.contentLayoutGuide.snp.trailing)
            $0.bottom.equalTo(monthStack.snp.top)
        }
        
        monthStack.snp.makeConstraints {
            $0.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom)
            $0.leading.equalTo(scrollView.contentLayoutGuide.snp.leading)
            $0.trailing.equalTo(scrollView.contentLayoutGuide.snp.trailing)
        }
        
        chartStack.backgroundColor = .red
        percentages.forEach { per in
            let v = UIView()
            v.backgroundColor = .brown
            chartStack.addArrangedSubview(v)
            v.snp.makeConstraints {
                $0.top.equalToSuperview().offset(-per)
                $0.bottom.equalToSuperview()
            }
        }
        
    }
    
}
