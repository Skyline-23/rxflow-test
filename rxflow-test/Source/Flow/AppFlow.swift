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
            
        case .homeIsRequired:
            return self.navigateToHome()
            
        default:
            return .none
        }
    }
}

extension AppFlow {
    private func navigateToLogin() -> FlowContributors {
        let loginFlow = LoginFlow()
        
        Flows.use(loginFlow, when: .created) { root in
            self.window.rootViewController = root
        }
        
        return .one(flowContributor: .contribute(withNextPresentable: loginFlow, withNextStepper: OneStepper(withSingleStep: DemoStep.loginIsRequired)))
    }
    
    private func navigateToHome() -> FlowContributors {
        let homeFlow = HomeFlow()
        
        Flows.use(homeFlow, when: .created) { root in
            self.window.rootViewController = root
        }
        
        return .one(flowContributor: .contribute(withNextPresentable: homeFlow, withNextStepper: OneStepper(withSingleStep: DemoStep.homeIsRequired)))
    }
}
