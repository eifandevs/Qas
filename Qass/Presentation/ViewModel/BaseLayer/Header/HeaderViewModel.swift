//
//  HeaderViewModel.swift
//  Eiger
//
//  Created by temma on 2017/04/30.
//  Copyright © 2017年 eifandevs. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class HeaderViewModel {
    /// プログレス更新通知用RX
    let rx_headerViewModelDidChangeProgress = Observable
        .merge([
            HeaderViewDataModel.s.rx_headerViewDataModelDidUpdateProgress,
            NotificationCenter.default.rx.notification(.UIApplicationDidBecomeActive, object: nil).flatMap { _ in Observable.just(0) }
        ])
        .flatMap { progress -> Observable<CGFloat> in
            return Observable.just(progress)
        }
    /// お気に入り変更通知用RX
    let rx_headerViewModelDidChangeFavorite = Observable
        .merge([
            PageHistoryDataModel.s.rx_pageHistoryDataModelDidAppend.flatMap { _ in Observable.just(()) },
            PageHistoryDataModel.s.rx_pageHistoryDataModelDidChange.flatMap { _ in Observable.just(()) },
            PageHistoryDataModel.s.rx_pageHistoryDataModelDidInsert.flatMap { _ in Observable.just(()) },
            PageHistoryDataModel.s.rx_pageHistoryDataModelDidRemove.flatMap { _ in Observable.just(()) },
            FavoriteDataModel.s.rx_favoriteDataModelDidInsert.flatMap { _ in Observable.just(()) },
            FavoriteDataModel.s.rx_favoriteDataModelDidRemove,
            FavoriteDataModel.s.rx_favoriteDataModelDidReload.flatMap { _ in Observable.just(()) }
        ])
        .flatMap { _ -> Observable<Bool> in
            if let currentHistory = PageHistoryDataModel.s.currentHistory, !currentHistory.url.isEmpty {
                return Observable.just(FavoriteDataModel.s.select().map({ $0.url }).contains(currentHistory.url))
            } else {
                return Observable.just(false)
            }
        }
    /// テキストフィールド更新通知用RX
    let rx_headerViewModelDidChangeField = HeaderViewDataModel.s.rx_headerViewDataModelDidUpdateText
        .flatMap { text -> Observable<String> in
            return Observable.just(text)
        }
    /// 編集開始通知用RX
    let rx_headerViewModelDidbeginSearching = SearchUseCase.s.rx_searchUseCaseDidBeginSearching
        .flatMap { forceEditFlg -> Observable<Bool> in
            return Observable.just(forceEditFlg)
        }

    /// グレップ開始通知用RX
    let rx_headerViewModelDidBeginGreping = GrepUseCase.s.rx_grepUseCaseDidBeginGreping
        .flatMap { _ -> Observable<()> in
            return Observable.just(())
        }

    deinit {
        log.debug("deinit called.")
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: Public Method

    func historyBack() {
        HistoryUseCase.s.goBack()
    }

    func historyForward() {
        HistoryUseCase.s.goForward()
    }

    func loadRequest(text: String) {
        SearchUseCase.s.load(url: text)
    }

    func grepRequest(word: String) {
        GrepUseCase.s.grep(word: word)
    }

    func updateFavorite() {
        FavoriteUseCase.s.update()
    }

    func remove() {
        TabUseCase.s.remove()
    }
}
