//
//  StickeyImageHeader.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/21.
//

import UIKit
import SnapKit

class StickeyImageHeader: UIViewController, UIScrollViewDelegate {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: Shared.Images.portrait3)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var imageHeight: CGFloat = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Stickey Image Header"
        view.backgroundColor = .white
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .never
        
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().offset(1)
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.height.equalTo(imageHeight)
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = -scrollView.contentOffset.y
        
        let height = max(imageHeight+y, imageHeight)
        imageView.snp.updateConstraints {
            $0.height.equalTo(height)
        }
        
    }
    
}
