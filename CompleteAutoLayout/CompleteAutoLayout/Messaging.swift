//
//  Messaging.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/18.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import IQKeyboardManagerSwift

struct Chat {
    let message: String
    let isMine: Bool = Bool.random()
}

class Messaging: UIViewController {
    
    fileprivate let cellIdentifier = "cell"
    
    private let bag = DisposeBag()
    
    private var chats: [Chat] = []
    
    private let tableView: UITableView = {
        let tb = UITableView()
        tb.separatorStyle = .none
        tb.keyboardDismissMode = .onDrag
        return tb
    }()
    
    private let textContainer: UIView = {
        let v = UIView()
        v.backgroundColor = .systemGray4
        return v
    }()
    
    private let textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        tf.returnKeyType = .send
        return tf
    }()
    
    private lazy var sendButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Send", for: .normal)
        btn.setContentCompressionResistancePriority(.required, for: .horizontal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IQKeyboardManager.shared.enable = false
        IQKeyboardManager.shared.enableAutoToolbar = false
        
        title = "Messaging"
        view.backgroundColor = .white
        
        view.addSubview(textContainer)
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.bottom.equalTo(textContainer.snp.top).offset(-8)
        }
        tableView.register(MessagingCell.self, forCellReuseIdentifier: cellIdentifier)
        
        textContainer.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottom)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
        }
        
        textContainer.addSubview(textField)
        textContainer.addSubview(sendButton)
        
        textField.delegate = self
        textField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalTo(sendButton.snp.leading).offset(-8)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }
        
        sendButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-8)
            $0.centerY.equalTo(textField.snp.centerY)
        }
        
        sendButton.rx
            .tap
            .bind {
                self.sendMessage()
                self.tableView.layoutIfNeeded()
            }
            .disposed(by: bag)
        
        [UIResponder.keyboardWillShowNotification,
         UIResponder.keyboardWillHideNotification].forEach { noti in
            NotificationCenter.default.addObserver(forName: noti,
                                                   object: nil,
                                                   queue: .main,
                                                   using: keyboardWillChange(_:))
         }

    }
    
    private func sendMessage() {
        guard let text = self.textField.text,
              !text.isEmpty else {
            return
        }
        
        let chat = Chat(message: text)
        self.chats.append(chat)
        self.textField.text = nil
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.tableView.reloadData()
            
            let indexPath = IndexPath(row: self.chats.count - 1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    private func keyboardWillChange(_ noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        guard let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
        
        UIView.animate(withDuration: duration) {
            self.textField.snp.updateConstraints {
                if noti.name == UIResponder.keyboardWillShowNotification {
                    $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-(keyboardFrame.height-8))
                } else {
                    $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-8)
                }
            }
        }
    }
    
}

extension Messaging: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.sendMessage()
        return true
    }
    
}

extension Messaging: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MessagingCell else {
            fatalError("Messaging Cell not found")
        }
        cell.chat = chats[indexPath.row]
        return cell
    }
    
}

// MARK: - Cell

class MessagingCell: UITableViewCell {
    
    var chat: Chat! {
        didSet {
            messageLabel.text = chat?.message
            configureBubbleConstraints()
            configureTextConstraints()
        }
    }
    
    private let bubbleImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    private let messageLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.addSubview(bubbleImageView)
        contentView.addSubview(messageLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBubbleConstraints() {
        guard let chat = chat else { return }
        
        bubbleImageView.snp.removeConstraints()
        
        let isMine = chat.isMine
        bubbleImageView.image = !isMine ? Shared.Images.bubbleLeft : Shared.Images.bubbleRight
        
        bubbleImageView.snp.makeConstraints {
            if !isMine {
                $0.leading.equalTo(contentView.snp.leading).offset(8)
                $0.trailing.lessThanOrEqualTo(contentView.snp.trailing).offset(-50)
            } else {
                $0.leading.greaterThanOrEqualTo(contentView.snp.leading).offset(50)
                $0.trailing.equalTo(contentView.snp.trailing).offset(-8)
            }
            $0.top.equalTo(contentView.snp.top).offset(8)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-8)
        }
        
        layoutIfNeeded()
    }
    
    private func configureTextConstraints() {
        messageLabel.snp.removeConstraints()
        
        messageLabel.snp.makeConstraints {
            $0.leading.equalTo(bubbleImageView.snp.leading).offset(16)
            $0.trailing.equalTo(bubbleImageView.snp.trailing).offset(-16)
            $0.top.equalTo(bubbleImageView.snp.top).offset(8)
            $0.bottom.equalTo(bubbleImageView.snp.bottom).offset(-8)
        }
        
        layoutIfNeeded()
    }
    
}
