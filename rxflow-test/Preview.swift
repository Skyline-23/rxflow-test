//
//  Preview.swift
//  rxflow-test
//
//  Created by 김부성 on 2021/07/28.
//

import Foundation

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let reactor = LoginViewReactor()
        LoginViewController(reactor: reactor).showPreview(.iPhone12Pro)
    }
}

#endif
