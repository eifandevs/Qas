//
//  AccessTokenResponse.swift
//  Entity
//
//  Created by iori tenma on 2019/08/13.
//  Copyright © 2019 eifandevs. All rights reserved.
//

import Foundation

/// 記事取得APIレスポンス
public struct AccessTokenResponse: Codable {
    public init(code: String, data: AccessToken?) {
        self.code = code
        self.data = data
    }

    public let code: String
    public let data: AccessToken?
}
