//
//  LogInView.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/16.
//

import UIKit

class LogInView: UIViewController {
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    private let contentView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .fill
        sv.spacing = 8
        return sv
    }()
    
    private let lbTitle: UILabel = {
        let lb = UILabel()
        lb.text = "Login"
        lb.font = .preferredFont(forTextStyle: .largeTitle)
        return lb
    }()
    
    private let ivSymbol: UIImageView = {
        let iv = UIImageView(image: Shared.Images.sampleImage)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let lbHelper: UILabel = {
        let lb = UILabel()
        lb.text = "If you wanna learn Auto Layout,\nplease log in first :)"
        lb.lineBreakMode = .byWordWrapping
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.font =  .preferredFont(forTextStyle: .callout)
        return lb
    }()
    
    private let tfEmail: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "E-mail"
        tf.textContentType = .emailAddress
        tf.font = .preferredFont(forTextStyle: .body)
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        return tf
    }()
    
    private let tfPassword: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Password"
        tf.textContentType = .password
        tf.isSecureTextEntry = true
        tf.font = .preferredFont(forTextStyle: .body)
        return tf
    }()
    
    private let svRemember: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .fill
        sv.spacing = 8
        return sv
    }()
    
    private let swRemember = UISwitch()
    
    private let lbRemember: UILabel = {
        let lb = UILabel()
        lb.text = "Remember me"
        lb.font = .preferredFont(forTextStyle: .title3)
        return lb
    }()
    
    private let svBtns: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .fill
        sv.spacing = 20
        return sv
    }()
    
    private lazy var btnLogin: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        return btn
    }()
    
    private lazy var btnRegister: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Register", for: .normal)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Log In View"
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.bottom.equalTo(view.snp.bottom)
            $0.width.equalTo(view.safeAreaLayoutGuide.snp.width)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.leading.equalTo(scrollView.snp.leading)
            $0.trailing.equalTo(scrollView.snp.trailing)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        let spacers = [UIView(), UIView(), UIView(), UIView()]
        
        contentView.addArrangedSubview(spacers[0])
        contentView.addArrangedSubview(lbTitle)
        contentView.addArrangedSubview(ivSymbol)
        contentView.addArrangedSubview(lbHelper)
        contentView.addArrangedSubview(spacers[1])
        contentView.addArrangedSubview(tfEmail)
        contentView.addArrangedSubview(tfPassword)
        contentView.addArrangedSubview(spacers[2])
        
        svRemember.addArrangedSubview(swRemember)
        svRemember.addArrangedSubview(lbRemember)
        contentView.addArrangedSubview(svRemember)
        
        svBtns.addArrangedSubview(btnLogin)
        svBtns.addArrangedSubview(btnRegister)
        contentView.addArrangedSubview(svBtns)
        
        contentView.addArrangedSubview(spacers[3])
        
        spacers.forEach {
            $0.snp.makeConstraints {
                $0.height.greaterThanOrEqualTo(30)
                $0.height.equalTo(spacers[0].snp.height)
            }
        }
        
        ivSymbol.snp.makeConstraints {
            $0.width.equalTo(contentView.snp.width).multipliedBy(0.7)
            $0.height.equalTo(contentView.snp.width).multipliedBy(0.7)
        }
        
        [tfEmail, tfPassword].forEach {
            $0.snp.makeConstraints {
                $0.leading.equalTo(contentView.snp.leading).offset(16)
                $0.trailing.equalTo(contentView.snp.trailing).offset(-16)
            }
        }
        
    }
    
}
