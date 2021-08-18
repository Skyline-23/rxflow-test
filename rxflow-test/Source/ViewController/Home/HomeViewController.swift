//
//  HomeViewController.swift
//  rxflow-test
//
//  Created by 김부성 on 2021/07/29.
//

import UIKit
import ReactorKit

final class HomeViewController: BaseViewController, View {
    
    typealias Reactor = HomeViewReactor
    
    let loginButton = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.setTitle("로그아웃", for: .normal)
        $0.backgroundColor = .red
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
        
        self.title = "Home"
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
    
    func bind(reactor: HomeViewReactor) {
        loginButton.rx.tap
            .map { Reactor.Action.logout }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    

}
