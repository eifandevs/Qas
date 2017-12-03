//
//  FooterViewModel.swift
//  Eiger
//
//  Created by tenma on 2017/03/23.
//  Copyright © 2017年 eifaniori. All rights reserved.
//

import Foundation

protocol FooterViewModelDelegate: class {
    func footerViewModelDidAddThumbnail(pageHistory: PageHistory)
    func footerViewModelDidChangeThumbnail()
    func footerViewModelDidRemoveThumbnail(index: Int)
    func footerViewModelDidStartLoading(context: String)
    func footerViewModelDidEndLoading(context: String, title: String)
}

class FooterViewModel {
    /// 現在位置
    var pageHistories: [PageHistory] {
        return PageHistoryDataModel.s.histories
    }
    
    var currentHistory: PageHistory {
        return PageHistoryDataModel.s.currentHistory
    }
    
    var currentLocation: Int {
        return PageHistoryDataModel.s.currentLocation
    }
    
    weak var delegate: FooterViewModelDelegate?
    
    /// 通知センター
    let center = NotificationCenter.default
    
    init(index: Int) {
        // webview追加
        center.addObserver(forName: .footerViewModelWillAddWebView, object: nil, queue: nil) { [weak self] (notification) in
            guard let `self` = self else { return }
            log.debug("[Footer Event]: footerViewModelWillAddWebView")
            let pageHistory = notification.object as! PageHistory
            
            // 新しいサムネイルを追加
            self.delegate?.footerViewModelDidAddThumbnail(pageHistory: pageHistory)
        }
        // webviewロード開始
        center.addObserver(forName: .pageHistoryDataModelDidStartLoading, object: nil, queue: nil) { [weak self] (notification) in
            guard let `self` = self else { return }
            log.debug("[Footer Event]: pageHistoryDataModelDidStartLoading")
            // FooterViewに通知をする
            self.delegate?.footerViewModelDidStartLoading(context: notification.object as! String)
        }
        // webviewロード完了
        center.addObserver(forName: .pageHistoryDataModelDidEndLoading, object: nil, queue: nil) { [weak self] (notification) in
            guard let `self` = self else { return }
            log.debug("[Footer Event]: pageHistoryDataModelDidEndLoading")
            // FooterViewに通知をする
            let context = notification.object as! String
            let pageHistory = D.find(PageHistoryDataModel.s.histories, callback: { $0.context == context })!
            self.delegate?.footerViewModelDidEndLoading(context: context, title: pageHistory.title)
        }

        // webview切り替え
        center.addObserver(forName: .footerViewModelWillChangeWebView, object: nil, queue: nil) { [weak self] (notification) in
            guard let `self` = self else { return }
            log.debug("[Footer Event]: footerViewModelWillChangeWebView")
            self.delegate?.footerViewModelDidChangeThumbnail()
        }
        
        // webview削除
        center.addObserver(forName: .footerViewModelWillRemoveWebView, object: nil, queue: nil) { [weak self] (notification) in
            guard let `self` = self else { return }
            log.debug("[Footer Event]: footerViewModelWillRemoveWebView")
//            let index = notification.object as! Int
//
//            // 実データの削除
//            try! FileManager.default.removeItem(atPath: Util.thumbnailFolderUrl(folder: self.pageHistories[index].context).path)
//
//            if ((index != 0 && self.currentLocation == index && index == self.pageHistories.count - 1) || (index < self.currentLocation)) {
//                // フロントの削除
//                // 最後の要素を削除する場合
//                self.currentLocation = self.currentLocation - 1
//            }
//            self.pageHistories.remove(at: index)
//            self.delegate?.footerViewModelDidRemoveThumbnail(index: index)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
// MARK: Public Method
    
    func changePageHistoryDataModel(context: String) {
        PageHistoryDataModel.s.change(context: context)
    }
    
    func notifyRemoveWebView(index: Int) {
        center.post(name: .baseViewModelWillRemoveWebView, object: index)
    }
}
