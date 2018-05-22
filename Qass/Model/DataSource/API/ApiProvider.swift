//
//  ApiProvider.swift
//  Qas
//
//  Created by tenma on 2018/03/21.
//  Copyright © 2018年 eifaniori. All rights reserved.
//

import Alamofire
import Foundation
import Moya

final class ApiProvider<T: TargetType>: MoyaProvider<T> {
    public init(endpointClosure: @escaping EndpointClosure = ApiProvider.defaultEndpointMapping,
                requestClosure: @escaping RequestClosure = ApiProvider.defaultRequestMapping,
                callbackQueue: DispatchQueue? = nil,
                trackInflights: Bool = false) {
        let sessionManager: SessionManager = {
            let configuration = URLSessionConfiguration.default
            // リクエストタイムアウト5秒
            configuration.timeoutIntervalForRequest = 5
            // リソースタイムアウト10秒
            configuration.timeoutIntervalForResource = 10
            return SessionManager(configuration: configuration)
        }()

        var plugins = [PluginType]()
        #if DEBUG
            // デバッグ時は通信ログを出す
            plugins = [NetworkLoggerPlugin(verbose: true, responseDataFormatter: ApiProvider.formatJsonResponseData)]
        #endif

        var stubClosure: (Target) -> Moya.StubBehavior
        #if DEVELOP
            stubClosure = ApiProvider.immediatelyStub
        #else
            stubClosure = ApiProvider.neverStub
        #endif

        super.init(endpointClosure: endpointClosure,
                   requestClosure: requestClosure,
                   stubClosure: stubClosure,
                   callbackQueue: callbackQueue,
                   manager: sessionManager,
                   plugins: plugins,
                   trackInflights: trackInflights)
    }

    /// ログ出力用
    static func formatJsonResponseData(_ data: Data) -> Data {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return prettyData
        } catch {
            return data // fallback to original data if it can't be serialized.
        }
    }
}