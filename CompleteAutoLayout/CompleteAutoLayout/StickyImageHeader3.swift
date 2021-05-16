//
//  StickyImageHeader3.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/05/05.
//

import UIKit
import StickyScrollView

// you should use UIScrollViewDelegate here.
class StickyImageHeader3: UIViewController, UIScrollViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: UIImage(named: "landscape0"))
        imageView.snp.makeConstraints {
            $0.height.equalTo(400)
            $0.width.equalTo(view.frame.width)
        }
        // Initialize StickyScrollView
        let scrollView = StickyScrollView(frame: self.view.frame)
        scrollView.setStickyDisplayHeight(height: 150)
        scrollView.setStickyImage(imageView: imageView)
        scrollView.delegate = self
        
        // ...
        // adjust scrollView contentSize
        // ...
        
        // add to view
        self.view.addSubview(imageView)
        self.view.addSubview(scrollView)
        
        let myView = UIView()
        scrollView.addSubview(myView)
        myView.backgroundColor = .orange
        myView.snp.makeConstraints {
            $0.width.equalTo(view.frame.width)
            $0.height.equalTo(4000)
            $0.top.leading.bottom.trailing.equalToSuperview()
        }
    }
}
