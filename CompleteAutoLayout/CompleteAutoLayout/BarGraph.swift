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
    
    private let bags = DisposeBag()
    
    private var pivots = [0, 20, 40, 60, 80, 100]
    
    private var percentages = (1...12).map { _ in Int.random(in: 0...100) }
    
    private let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    private let percentageStack: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.alignment = .center
        s.distribution = .equalSpacing
        s.spacing = 0
        return s
    }()
    
    private let scrollView = UIScrollView()
    
    private let chartStack: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .bottom
        s.distribution = .fillEqually
        s.spacing = 20
        return s
    }()
    
    private let monthStack: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .center
        s.distribution = .fill
        s.spacing = 20
        s.setContentHuggingPriority(.required, for: .vertical)
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
        
        let percentageLabels = pivots.reversed().map { percentage -> UILabel in
            let lb = UILabel()
            lb.text = "\(percentage)"
            lb.sizeToFit()
            return lb
        }
        
        percentageLabels.forEach { percentageStack.addArrangedSubview($0) }
        
        percentageStack.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        view.addSubview(scrollView)
        
        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalToSuperview().offset(-0.1)
        }
        
        scrollView.snp.makeConstraints {
            
            let maxLabel = percentageLabels[0]
            
            $0.top.equalTo(maxLabel.snp.centerY)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(percentageStack.snp.trailing)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
        
        contentView.addSubview(monthStack)
        contentView.addSubview(chartStack)
        
        months.forEach { month in
            let lb = UILabel()
            lb.text = month
            lb.sizeToFit()
            monthStack.addArrangedSubview(lb)
        }
        
        monthStack.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.bottom).offset(-16)
            $0.leading.equalTo(contentView.snp.leading).offset(16)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
        
        chartStack.snp.makeConstraints {
            $0.bottom.equalTo(percentageLabels[percentageLabels.count - 1].snp.centerY)
            $0.bottom.equalTo(monthStack.snp.top)
            $0.top.equalTo(contentView.snp.top)
            $0.leading.equalTo(contentView.snp.leading).offset(16)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
        
        percentages.forEach { percentage in
            let v = UIView()
            v.backgroundColor = .orange
            chartStack.addArrangedSubview(v)
        }
        
        randomize()
        
        view.addSubview(btn)
        btn.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        btn.rx
            .tap
            .bind { [weak self] in
                self?.randomize()
            }
            .disposed(by: bags)
        
    }
    
    private func randomize() {
        
        percentages = (1...12).map { _ in Int.random(in: 0...100) }
        
        chartStack.arrangedSubviews.enumerated().forEach { i, v in
            
            v.snp.removeConstraints()
            
            v.snp.makeConstraints {
                let ratio = CGFloat(self.percentages[i]) / 100
                
                $0.height.equalToSuperview().multipliedBy(ratio)
            }
            
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
    }
    
}
