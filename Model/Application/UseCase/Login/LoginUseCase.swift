//
//  LoginUseCase.swift
//  Amby
//
//  Created by tenma.i on 2019/08/14.
//  Copyright © 2019 eifandevs. All rights reserved.
//

import Foundation
import Entity
import RxCocoa
import RxSwift

public final class LoginUseCase {
    public static let s = LoginUseCase()

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
        let request = AccessTokenRequest(auth_type: 1, email: "", refresh_token: "")
        accessTokenDataModel.rx_action
            .subscribe { [weak self] action in
                guard let `self` = self, let action = action.element else { return }
                switch action {
                case let .get(accessToken):
                    log.debug("accessToken: \(accessToken)")
                }
            }
            .disposed(by: disposeBag)
        accessTokenDataModel.get(request: request)
    }
}
