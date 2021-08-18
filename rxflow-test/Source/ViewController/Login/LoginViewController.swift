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
    
    // MARK: - UI
    let loginButton = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    }
    
    // MARK: - Initializing
    init(reactor: Reactor) {
        super.init()
        defer { self.reactor = reactor }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Login"
        // Do any additional setup after loading the view.
    }
    
    override func setupLayout() {
        self.view.addSubview(loginButton)
    }
    
    override func makeConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        self.loginButton.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(safeArea).inset(20)
            $0.height.equalTo(50)
        }
    }
    
    // MARK: - Configuring
    func bind(reactor: LoginViewReactor) {
        
        // Input
        loginButton.rx.tap
            .map { Reactor.Action.login }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    

}
