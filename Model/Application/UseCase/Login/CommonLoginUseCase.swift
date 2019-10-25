//
//  CommonLoginUseCase.swift
//  Model
//
//  Created by tenma.i on 2019/10/25.
//  Copyright © 2019 eifandevs. All rights reserved.
//

import Foundation
import Entity
import RxCocoa
import RxSwift

public final class CommonLoginUseCase {

    private var accessTokenDataModel: AccessTokenDataModelProtocol!

    /// Observable自動解放
    let disposeBag = DisposeBag()

    private init() {
        setupProtocolImpl()
    }

    private func setupProtocolImpl() {
        accessTokenDataModel = AccessTokenDataModel.s
    }

    public func exe() {
        if accessTokenDataModel.hasApiToken {
            log.debug("has api token. so skip login")
        } else {
            log.debug("has not api token. will common login")
            let request = GetAccessTokenRequest(auth_type: 1, email: "")
            accessTokenDataModel.rx_action
                .subscribe { [weak self] action in
                    guard let `self` = self, let action = action.element else { return }
                    switch action {
                    case let .fetch(accessToken):
                        log.debug("accessToken: \(accessToken)")
                    }
                }
                .disposed(by: disposeBag)
            accessTokenDataModel.fetch(request: request)
        }
    }
}
