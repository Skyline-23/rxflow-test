//
//  HomeFlow.swift
//  rxflow-test
//
//  Created by 김부성 on 2021/07/31.
//

import RxFlow

class HomeFlow: Flow {
    
    // MARK: - Properties
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController = UINavigationController()
    
    // MARK: - Initalizing
    init() {
        
    }
    
    // MARK: - Switch Navigation
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DemoStep else { return .none }
        
        switch step {
        
        case .homeIsRequired:
            return self.navigateToHome()
            
        case .loginIsRequired:
            return .end(forwardToParentFlowWithStep: DemoStep.loginIsRequired)
            
        default:
            return .none
        }
    }
}

extension HomeFlow {
    
    private func navigateToHome() -> FlowContributors {
        let reactor = HomeViewReactor()
        let viewController = HomeViewController(reactor: reactor)
        
        self.rootViewController.setViewControllers([viewController], animated: false)
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: reactor))
    }
}
