//
//  StickyTitleHeader.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/05/05.
//

import UIKit
import SnapKit

class StickyTitleHeader: UIViewController {
    
    let titleHeader = UIView()
    
    let lbTitle = UILabel()
    
    var titleConstraint: Constraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    private func configureView() {
        
        view.backgroundColor = .white
        
        lbTitle.numberOfLines = 0
        lbTitle.text = "This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title"
        lbTitle.textAlignment = .left
        lbTitle.font = .preferredFont(forTextStyle: .title1)
        titleHeader.addSubview(lbTitle)
        lbTitle.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        view.addSubview(titleHeader)
        titleHeader.snp.makeConstraints {
            titleConstraint = $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).constraint
            titleConstraint.activate()
            $0.trailing.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        view.layoutIfNeeded()
        
        let lbSubtitle = UILabel()
        lbSubtitle.text = "This is subtitle"
        lbSubtitle.font = .preferredFont(forTextStyle: .title3)
        
        titleHeader.addSubview(lbSubtitle)
        lbSubtitle.snp.makeConstraints {
            $0.top.equalTo(lbTitle.snp.bottom).offset(32)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        let scrollView = UIScrollView()
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(lbSubtitle.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        let newView = UIView()
        newView.backgroundColor = .orange
        
        scrollView.addSubview(newView)
        newView.snp.makeConstraints {
            $0.height.equalTo(4000)
            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        let lbContent = UILabel()
        lbContent.text = "This is the content"
        newView.addSubview(lbContent)
        lbContent.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
    }
    
}

extension StickyTitleHeader: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < 0 {
            let offset = max(abs(scrollView.contentOffset.y), 0)
            titleConstraint.update(offset: -offset)
        } else {
            let offset = min(abs(scrollView.contentOffset.y), lbTitle.frame.height)
            titleConstraint.update(offset: -offset)
        }
        
    }
    
}
