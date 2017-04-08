//
//  BaseModels.swift
//  Eiger
//
//  Created by tenma on 2017/02/07.
//  Copyright © 2017年 eifaniori. All rights reserved.
//

import Foundation
import Bond
import WebKit

class BaseViewModel {
    
    // リクエストURL(jsのURL)
    var requestUrl = Observable("http://about:blank")
    
    // クッキーの共有
    var processPool = WKProcessPool()

    // 最新のリクエストURL(wv.url)。エラーが発生した時用
    var latestRequestUrl: String = ""
    
    // webviewの数
    var webViewCount: Int {
        get {
            return eachHistory.count
        }
    }

    // 現在表示しているwebviewのインデックス
    var locationIndex: Int {
        get {
            return UserDefaults.standard.integer(forKey: AppDataManager.shared.locationIndexKey)
        }
        set(index) {
            log.debug("location index changed. \(locationIndex) -> \(index)")
            UserDefaults.standard.set(index, forKey: AppDataManager.shared.locationIndexKey)
            if eachHistory.count == index {
                // 新規追加
                log.debug("create new each history")
                eachHistory.append(EachHistoryItem())
                requestUrl.value = (!eachHistory[locationIndex].url.isEmpty) ? eachHistory[locationIndex].url : defaultUrl
            }
        }
    }
    
    // 全てのwebViewの履歴
    private var commonHistory: [CommonHistoryItem] = []
    
    // webViewそれぞれの履歴とカレントページインデックス
    private var eachHistory: [EachHistoryItem] = []
    
    // Footerへ送信する用の通知センター
    let center = NotificationCenter.default
    
    var defaultUrl: String {
        get {
            return UserDefaults.standard.string(forKey: AppDataManager.shared.defaultUrlKey)!
        }
        set(url) {
            UserDefaults.standard.set(url, forKey: AppDataManager.shared.defaultUrlKey)
        }
    }
    
    var currentContext: String? {
        get {
            return eachHistory.count > locationIndex ? eachHistory[locationIndex].context : nil
        }
    }
    
    init() {
        // eachHistory読み込み
        do {
            let data = try Data(contentsOf: AppDataManager.shared.eachHistoryPath)
            eachHistory = NSKeyedUnarchiver.unarchiveObject(with: data) as! [EachHistoryItem]
            requestUrl.value = (!eachHistory[locationIndex].url.isEmpty) ? eachHistory[locationIndex].url : defaultUrl
            log.debug("each history read. url: \n\(requestUrl.value)")
        } catch let error as NSError {
            eachHistory.append(EachHistoryItem())
            requestUrl.value = defaultUrl
            log.error("failed to read each history: \(error)")
        }
        center.post(name: .baseViewDidLoad, object: eachHistory)
    }
    
    func postNotification(name: NSNotification.Name, object: [String: Any]?) {
        center.post(name: name, object: object)
    }
    
    func saveHistory(wv: EGWebView) {
        // Common History
        let common = CommonHistoryItem(url: wv.requestUrl, title: wv.requestTitle, date: Date())
        commonHistory.append(common)
        log.debug("save history. url: \(common.url)")
        
        // Each History
        let each = EachHistoryItem(context: wv.context, url: common.url, title: common.title)
        eachHistory[locationIndex] = each
    }
    
    func storeHistory() {
        storeCommonHistory()
        storeEachHistory()
        commonHistory = []
    }
    
    func goForwardLocationIndex() {
        locationIndex = locationIndex + 1
    }
    
    func goBackLocationIndex() {
        locationIndex = locationIndex - 1
    }
    
    private func storeCommonHistory() {
        if commonHistory.count > 0 {
            // commonHistoryを日付毎に分ける
            var commonHistoryByDate: [String: [CommonHistoryItem]] = [:]
            for item in commonHistory {
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: NSLocale.current.identifier)
                dateFormatter.dateFormat = "yyyyMMdd"
                let key = dateFormatter.string(from: item.date)
                if commonHistoryByDate[key] == nil {
                    commonHistoryByDate[key] = [item]
                } else {
                    commonHistoryByDate[key]?.append(item)
                }
            }
            
            for (key, value) in commonHistoryByDate {
                let commonHistoryPath = AppDataManager.shared.commonHistoryPath(date: key)
                
                let saveData: [CommonHistoryItem] = { () -> [CommonHistoryItem] in
                    do {
                        let data = try Data(contentsOf: commonHistoryPath)
                        let old = NSKeyedUnarchiver.unarchiveObject(with: data) as! [CommonHistoryItem]
                        let saveData: [CommonHistoryItem] = old + value
                        return saveData
                    } catch let error as NSError {
                        log.error("failed to read: \(error)")
                        return value
                    }
                }()

                let commonHistoryData = NSKeyedArchiver.archivedData(withRootObject: saveData)
                do {
                    try commonHistoryData.write(to: commonHistoryPath)
                    log.debug("store common history")
                } catch let error as NSError {
                    log.error("failed to write: \(error)")
                }
            }
        }
    }
    
    private func storeEachHistory() {
        if commonHistory.count > 0 {
            let eachHistoryData = NSKeyedArchiver.archivedData(withRootObject: eachHistory)
            do {
                try eachHistoryData.write(to: AppDataManager.shared.eachHistoryPath)
                log.debug("store each history")
            } catch let error as NSError {
                log.error("failed to write: \(error)")
            }
        }
    }
}
