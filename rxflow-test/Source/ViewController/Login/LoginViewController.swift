//
//  ViewController.swift
//  rxflow-test
//
//  Created by 김부성 on 2021/07/28.
//

import UIKit
import ReactorKit

final class LoginViewController: BaseViewController, View {
    
    typealias Reactor = LoginViewReactor
    
    let loginButton = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .blue
    }
    
    init(reactor: Reactor) {
        super.init()
        defer { self.reactor = reactor }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Login"
        // Do any additional setup after loading the view.
    }
    
    override func makeConstraints() {
        self.loginButton.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    func bind(reactor: LoginViewReactor) {
        loginButton.rx.tap
            .map { Reactor.Action.login }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    

}
