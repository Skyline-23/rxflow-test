//
//  DemoStep.swift
//  rxflow-test
//
//  Created by 김부성 on 2021/07/29.
//

import RxFlow

enum DemoStep: Step {
    
    case dismiss
    case popViewController
    
    //MARK: - Login
    case loginIsRequired
    case homeIsRequired
}
