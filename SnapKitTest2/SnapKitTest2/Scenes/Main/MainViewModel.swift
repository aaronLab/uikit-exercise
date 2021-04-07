//
//  MainViewModel.swift
//  SnapKitTest2
//
//  Created by Aaron Lee on 2021/04/07.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel {
    
    private let bag = DisposeBag()
    
    let emailValueChanged = PublishRelay<String>()
    let passwordValueChanged = PublishRelay<String>()
    let logInButtonPressed = PublishRelay<Void>()
    let user = PublishSubject<User?>()
    
    private var credentials: Observable<UserCredential> {
        return Observable.combineLatest(emailValueChanged, passwordValueChanged) { email, password in
            return UserCredential.init(email: email, password: password)
        }
    }
    
    init() {
        
        logInButtonPressed
            .withLatestFrom(credentials)
            .flatMapLatest { credentials in
                
                // Here would be some networking process...
                
                return Observable<User>.create { observer -> Disposable in
                    
                    observer.onNext(User.init(email: credentials.email))
                    
                    return Disposables.create()
                    
                }.materialize()
                
            }
            .subscribe(onNext: { [weak self] event in
                
                switch event {
                case .next(let user):
                    self?.user.onNext(user)
                case .error(let error):
                    print(error.localizedDescription)
                    self?.user.onNext(nil)
                case .completed:
                    print("Completed")
                }
                
            })
            .disposed(by: bag)
        
    }
    
}
