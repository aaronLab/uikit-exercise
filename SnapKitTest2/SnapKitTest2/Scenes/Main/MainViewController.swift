//
//  MainViewController.swift
//  SnapKitTest2
//
//  Created by Aaron Lee on 2021/04/07.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController, BaseViewController {
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    
    private let bag = DisposeBag()
    
    private let viewModel = MainViewModel()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Main View"
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Email"
        tf.textContentType = .emailAddress
        tf.returnKeyType = .next
        tf.clearButtonMode = .whileEditing
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Password"
        tf.textContentType = .password
        tf.isSecureTextEntry = true
        tf.returnKeyType = .done
        tf.clearButtonMode = .whileEditing
        return tf
    }()
    
    private lazy var logInButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Log In", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .orange
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        bindRx()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Helpers

    func configureViews() {
        
        // View
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        
        // Title
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            let y = view.frame.height
            $0.top.equalTo(y*0.05)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        // TextFields
        let textFields = UIStackView()
        textFields.axis = .vertical
        textFields.spacing = 16
        textFields.alignment = .leading
        textFields.distribution = .fill
        
        view.addSubview(textFields)
        textFields.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-16)
        }
        
        textFields.addArrangedSubview(emailTextField)
        emailTextField.snp.makeConstraints {
            $0.width.equalTo(textFields)
        }
        
        textFields.addArrangedSubview(passwordTextField)
        passwordTextField.snp.makeConstraints {
            $0.width.equalTo(textFields)
        }
        
        // Button
        view.addSubview(logInButton)
        logInButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(view.frame.width - 32)
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.greaterThanOrEqualTo(textFields.snp.bottom).offset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
        
    }
    
    func bindRx() {
        
        // Responder
        
        emailTextField.rx.controlEvent(.editingDidEndOnExit)
            .subscribe { [weak self] _ in
                self?.passwordTextField.becomeFirstResponder()
            }
            .disposed(by: bag)
        
        passwordTextField.rx.controlEvent(.editingDidEndOnExit)
            .subscribe { [weak self] _ in
                self?.passwordTextField.resignFirstResponder()
            }
            .disposed(by: bag)
        
        // Bind to View Model
        
        emailTextField.rx.text
            .orEmpty
            .changed
            .formatEmail()
            .bind(to: self.emailTextField.rx.text)
            .disposed(by: bag)
        
        emailTextField.rx.text
            .orEmpty
            .changed
            .bind(to: viewModel.emailValueChanged)
            .disposed(by: bag)
        
        passwordTextField.rx.text
            .orEmpty
            .changed
            .bind(to: viewModel.passwordValueChanged)
            .disposed(by: bag)
        
        logInButton.rx
            .tap
            .bind(to: viewModel.logInButtonPressed)
            .disposed(by: bag)
        
        viewModel.user
            .subscribe(onNext: { user in
                guard let user = user else { return }
                print(user.email)
            })
            .disposed(by: bag)
    }

}

extension ObservableType where Element == String {
    
    /// Format to less than 30 chars for email
    func formatEmail() -> Observable<Element> {
        return asObservable()
            .flatMap { value -> Observable<String> in
                
                if value.count > 50 {
                    
                    let newVal = String(value.dropLast())
                    
                    #if DEBUG
                    print("Email address should be less than 30 chars.")
                    print("Value: \(value)")
                    print("New  : \(newVal)")
                    print("==================================================")
                    #endif
                    
                    return Observable.just(newVal)
                    
                }
                
                return Observable.just(value)
                
            }
    }
    
}
