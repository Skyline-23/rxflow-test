//
//  LoginFlow.swift
//  rxflow-test
//
//  Created by 김부성 on 2021/07/30.
//

import RxFlow

class LoginFlow: Flow {
    
    // MARK: - Properties
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController = UINavigationController()
    
    // MARK: - init
    init() {
        
    }
    
    // MARK: - Switch Navigation
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DemoStep else { return .none }
        
        switch step {
        
        // 홈화면
        case .loginIsRequired:
            return self.navigateToLogin()
            
        // 로그인 화면
        case .homeIsRequired:
            return .end(forwardToParentFlowWithStep: DemoStep.homeIsRequired)
            
        case .dismiss:
            self.rootViewController.dismiss(animated: true, completion: nil)
            return .none
            
        default:
            return .none
        }
    }
    
}

extension LoginFlow {
    
    private func navigateToLogin() -> FlowContributors {
        let reactor = LoginViewReactor()
        let viewController = LoginViewController(reactor: reactor)
        
        self.rootViewController.setViewControllers([viewController], animated: false)
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
    
}
