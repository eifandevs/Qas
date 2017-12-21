//
//  HeaderViewDataModel.swift
//  Qas
//
//  Created by jmas on 2017/12/07.
//  Copyright © 2017年 eifaniori. All rights reserved.
//

import Foundation
import UIKit

/// ページ共通データモデル
final class HeaderViewDataModel {
    static let s = HeaderViewDataModel()
    let center = NotificationCenter.default
    
    // プログレス
    private var progress = 0.f
    
    // ヘッダーテキスト
    private var headerFieldText = ""
    
    /// プログレス情報の更新
    func updateProgress(progress: CGFloat) {
        self.progress = progress
        center.post(name: .headerViewDataModelProgressDidUpdate, object: progress)
    }
    
    /// ヘッダーテキストの更新
    func updateHeaderFieldText(text: String) {
        headerFieldText = text
        center.post(name: .headerViewDataModelHeaderFieldTextDidUpdate, object: text)
    }
    
    /// 編集開始通知
    func beginEditing(forceEditFlg: Bool) {
        center.post(name: .headerViewDataModelDidBeginEditing, object: forceEditFlg)
    }
}