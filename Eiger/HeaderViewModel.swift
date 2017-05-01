//
//  HeaderViewModel.swift
//  Eiger
//
//  Created by temma on 2017/04/30.
//  Copyright © 2017年 eifaniori. All rights reserved.
//

import Foundation
import UIKit

protocol HeaderViewModelDelegate {
    func headerViewModelDidChangeProgress(progress: CGFloat)
}

class HeaderViewModel {
    // 通知センター
    let center = NotificationCenter.default
    
    var delegate: HeaderViewModelDelegate?

    init () {
        center.addObserver(self,
                           selector: #selector(type(of: self).applicationDidBecomeActive(notification:)),
                           name: .UIApplicationDidBecomeActive,
                           object: nil)
        center.addObserver(self,
                           selector: #selector(type(of: self).headerViewModelWillChangeProgress(notification:)),
                           name: .headerViewModelWillChangeProgress,
                           object: nil)
    }

// MARK: Public Method
    
    func notifyChangeWebView(text: String) {
        center.post(name: .baseViewModelWillSearchWebView, object: text)
    }
    
// MARK: Notification受信
    
    @objc private func headerViewModelWillChangeProgress(notification: Notification) {
        log.debug("[HeaderView Event]: headerViewModelWillChangeProgress")
        delegate?.headerViewModelDidChangeProgress(progress: notification.object as! CGFloat)
    }
    
    @objc private func applicationDidBecomeActive(notification: Notification) {
        // プログレスバーの初期化
        delegate?.headerViewModelDidChangeProgress(progress: 0)
    }
}
