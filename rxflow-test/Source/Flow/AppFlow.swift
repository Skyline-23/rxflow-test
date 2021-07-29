//
//  AppFlow.swift
//  rxflow-test
//
//  Created by 김부성 on 2021/07/29.
//

import RxFlow

class AppFlow: Flow {
    
    private let window: UIWindow
    
    var root: Presentable {
        return self.window
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DemoStep else { return .none }
        
        switch step {
        case .loginIsRequired:
            return self.navigateToLogin()
            
        case .userIsLoggedIn:
            return self.navigateToHome()
        }
    }
}

extension AppFlow {
    fileprivate func navigateToLogin() -> FlowContributors {
        
    }
    
    fileprivate func navigateToHome() -> FlowContributors {
        
    }
}
