//
//  ReportHandlerUseCase.swift
//  Amby
//
//  Created by tenma on 2018/08/23.
//  Copyright © 2018年 eifandevs. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

public enum ReportHandlerUseCaseAction {
    case present
    case load(url: String)
}

/// レポートユースケース
public final class ReportHandlerUseCase {
    public static let s = ReportHandlerUseCase()

    /// アクション通知用RX
    public let rx_action = PublishSubject<ReportHandlerUseCaseAction>()

    /// 最終お問い合わせ日
    public var lastReportDate: Date {
        get {
            return settingDataModel.lastReportDate
        }
        set(value) {
            settingDataModel.lastReportDate = value
        }
    }

    /// models
    private var issueDataModel: IssueDataModelProtocol!
    private var settingDataModel: SettingDataModelProtocol!

    private init() {
        setupProtocolImpl()
    }

    private func setupProtocolImpl() {
        issueDataModel = IssueDataModel.s
        settingDataModel = SettingDataModel.s
    }

    /// レポート画面表示
    public func open() {
        rx_action.onNext(.present)
    }

    /// レポート一覧表示
    public func openList() {
        rx_action.onNext(.load(url: ModelConst.URL.ISSUE_URL))
    }

    /// Issue登録
    public func registerReport(title: String, message: String) {
        IssueDataModel.s.post(title: title, body: message)
    }
}
