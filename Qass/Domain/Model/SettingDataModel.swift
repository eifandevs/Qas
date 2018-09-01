//
//  SettingDataModel.swift
//  Qas
//
//  Created by tenma on 2018/04/19.
//  Copyright © 2018年 eifandevs. All rights reserved.
//

import Foundation
import Model

final class SettingDataModel {
    static let s = SettingDataModel()
    let repository = UserDefaultRepository()

    /// 閲覧履歴保存日数
    var commonHistorySaveCount: Int {
        return repository.commonHistorySaveCount
    }

    /// 自動スクロールインターバル
    var autoScrollInterval: Float {
        get {
            return repository.autoScrollInterval
        }
        set(value) {
            repository.autoScrollInterval = value
        }
    }

    /// 検索履歴保存日数
    var searchHistorySaveCount: Int {
        return repository.searchHistorySaveCount
    }

    private init() {}

    /// ユーザーデフォルト初期値設定
    func setup() {
        repository.setup()
    }

    /// ユーザーデフォルト初期化
    func initialize() {
        repository.initialize()
    }
}