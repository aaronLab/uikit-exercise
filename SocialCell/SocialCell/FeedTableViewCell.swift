//
//  SocialCell - FeedTableViewCell.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import SnapKit

class FeedTableViewCell: UITableViewCell {
    
    var feed: Feed! {
        didSet {
            profileImageView?.image = feed.author.profileImage
            authorLabel?.text = feed.author.name
            timeLabel?.text = feed.time
            
            contentTextLabel?.text = feed.contents.text
            contentTextLabel?.isHidden = contentTextLabel?.text?.isEmpty == true
            
            contentImageView?.image = feed.contents.image
            contentImageView.isHidden = contentImageView.image == nil
            
            likesLabel?.text = "\(feed.likes)"
            
            if let contentImageRatioConstraint = imageRatioConstraint {
                contentImageRatioConstraint.isActive = false
                contentImageView.snp.removeConstraints()
            }
            
            if let image = contentImageView.image {
                contentImageView.snp.makeConstraints {
                    let ratio = image.size.height / image.size.width
                    imageRatioConstraint = $0.height.equalTo(contentImageView.snp.width)
                        .multipliedBy(ratio)
                        .constraint
                }
            }
            
        }
    }
    
    private var profileImageView: UIImageView!
    private var authorLabel: UILabel!
    private var timeLabel: UILabel!
    private var contentTextLabel: UILabel!
    private var contentImageView: UIImageView!
    private var likesLabel: UILabel!
    private var imageRatioConstraint: Constraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        
        drawCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FeedTableViewCell {
    
    private func drawCell() {
        selectionStyle = .none
        
        profileImageView = UIImageView(image: UIImage(systemName: "person.fill"))
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFit
        
        authorLabel = UILabel()
        authorLabel.adjustsFontForContentSizeCategory = true
        authorLabel.font = .preferredFont(forTextStyle: .caption1)
        authorLabel.textColor = .black
        authorLabel.setContentCompressionResistancePriority(.required,
                                                            for: .horizontal)
        authorLabel.setContentCompressionResistancePriority(.required,
                                                            for: .vertical)
        authorLabel.setContentHuggingPriority(.required, for: .horizontal)
        authorLabel.text = "Aaron"
        
        timeLabel = UILabel()
        timeLabel.adjustsFontForContentSizeCategory = true
        timeLabel.font = .preferredFont(forTextStyle: .caption2)
        timeLabel.textColor = .black
        timeLabel.setContentCompressionResistancePriority(.defaultHigh,
                                                            for: .horizontal)
        timeLabel.setContentCompressionResistancePriority(.required,
                                                            for: .vertical)
        timeLabel.text = "1분 전"
        
        let profileStack = UIStackView(arrangedSubviews: [profileImageView, authorLabel, timeLabel])
        profileStack.axis = .horizontal
        profileStack.spacing = UIStackView.spacingUseSystem
        
        contentTextLabel = UILabel()
        contentTextLabel.adjustsFontForContentSizeCategory = true
        contentTextLabel.font = .preferredFont(forTextStyle: .body)
        contentTextLabel.textColor = .black
        contentTextLabel.numberOfLines = 0
        contentTextLabel.text = """
            This is
            a caption
            body...
        """
        
        contentImageView = UIImageView(image: UIImage(systemName: "photo"))
        contentImageView.clipsToBounds = true
        contentImageView.contentMode = .scaleAspectFill
        contentImageView.isUserInteractionEnabled = true
        
        let likesImageView = UIImageView(image: UIImage(systemName: "hand.thumbsup.fill"))
        likesImageView.tintColor = .systemBlue
        likesImageView.contentMode = .scaleAspectFill
        likesImageView.setContentHuggingPriority(.required,
                                             for: .horizontal)
        
        likesLabel = UILabel()
        likesLabel.adjustsFontForContentSizeCategory = true
        likesLabel.font = .preferredFont(forTextStyle: .callout)
        likesLabel.textColor = .darkGray
        likesLabel.text = "999"
        
        let likesStack = UIStackView(arrangedSubviews: [likesImageView, likesLabel])
        likesStack.alignment = .center
        likesStack.distribution = .fill
        likesStack.axis = .horizontal
        likesStack.spacing = UIStackView.spacingUseSystem
        
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually
        buttonStack.alignment = .center
        
        ["좋아요", "댓글 달기", "공유하기"].forEach { title in
            let btn = UIButton(type: .system)
            btn.setTitle(title, for: .normal)
            btn.tintColor = .darkGray
            btn.layer.borderWidth = 2.0
            btn.layer.borderColor = UIColor.gray.cgColor
            buttonStack.addArrangedSubview(btn)
        }
        
        let contentStack = UIStackView(arrangedSubviews: [
                                            profileStack, contentTextLabel, contentImageView, likesStack, buttonStack])
        
        contentStack.axis = .vertical
        contentStack.alignment = .fill
        contentStack.distribution = .fill
        contentStack.spacing = UIStackView.spacingUseSystem
        
        contentView.addSubview(contentStack)
        contentStack.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
        }
        
        profileImageView.snp.makeConstraints {
            $0.height.equalTo(profileImageView.snp.width)
            $0.width.equalTo(contentView.snp.width).multipliedBy(0.1)
        }
        
        contentImageView.snp.makeConstraints { maker in
            imageRatioConstraint = maker.height.equalTo(contentImageView.snp.width).constraint
            imageRatioConstraint.isActive = true
        }
        
        likesImageView.snp.makeConstraints {
            $0.height.lessThanOrEqualTo(likesLabel.snp.height).priority(.high)
            $0.height.greaterThanOrEqualTo(30).priority(.required)
            $0.width.equalTo(likesImageView.snp.height)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapImageView(_:)))
        contentImageView.addGestureRecognizer(tapGesture)
        
    }
    
    @objc private func tapImageView(_ sender: UITapGestureRecognizer) {
        
        guard let constraint = imageRatioConstraint else {
            return
        }
        
        constraint.isActive.toggle()
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
        
        NotificationCenter.default.post(name: Notification.Name("NeedsUpdateLayout"), object: nil)
        
    }
}
