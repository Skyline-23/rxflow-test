//
//  SplashViewControllerReactor.swift
//  rxflow-test
//
//  Created by 김부성 on 2021/07/29.
//

import RxSwift
import RxCocoa
import ReactorKit
import RxFlow

final class LoginViewReactor: Reactor, Stepper {
    var steps = PublishRelay<Step>()
    
    enum Action {
        case login
    }
    
    enum Mutation {
        
    }
    
    struct State {
        var isLoading: Bool
    }
    
    var initialState: State
    
    init() {
        self.initialState = State(isLoading: false)
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        
        switch action {
        case .login:
            self.steps.accept(DemoStep.homeIsRequired)
            return .empty()
        }
    }
    
    
}
