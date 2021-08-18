//
//  Network.swift
//  rxflow-test
//
//  Created by 김부성 on 2021/08/01.
//

import RxSwift
import Moya

class Network<API: TargetType>: MoyaProvider<API> {
    init(plugins: [PluginType] = []) {
        let session = MoyaProvider<API>.defaultAlamofireSession()
        session.sessionConfiguration.timeoutIntervalForRequest = 10
        
        super.init(session: session, plugins: plugins)
    }
    
    func request(_ api: API) -> Single<Response> {
        return self.rx.request(api)
            .filterSuccessfulStatusCodes()
    }
    
}

extension Network {
    func requestObject<T:Codable>(target: API, Type: T.Type) -> Single<T> {
        let decoder = JSONDecoder()
        return request(target)
            .map(Type, using: decoder)
    }
}
