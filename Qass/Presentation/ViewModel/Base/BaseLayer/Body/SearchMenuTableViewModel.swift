//
//  SearchMenuTableViewModel.swift
//  Qas
//
//  Created by temma on 2017/08/01.
//  Copyright © 2017年 eifaniori. All rights reserved.
//

import Foundation
import Model
import RxCocoa
import RxSwift

final class SearchMenuTableViewModel {
    /// 画面更新通知用RX
    let rx_searchMenuViewWillUpdateLayout = PublishSubject<()>()
    /// 画面無効化通知用RX
    let rx_searchMenuViewWillHide = PublishSubject<()>()

    /// ニュースセル高さ
    let newsCellHeight = AppConst.FRONT_LAYER.TABLE_VIEW_NEWS_CELL_HEIGHT
    /// 通常セル高さ
    let cellHeight = AppConst.FRONT_LAYER.TABLE_VIEW_CELL_HEIGHT
    /// セクション高さ
    let sectionHeight = AppConst.FRONT_LAYER.TABLE_VIEW_SECTION_HEIGHT
    /// 表示セル数
    let cellNum = AppConst.FRONT_LAYER.SEARCH_TABLE_VIEW_ROW_NUM

    /// セクション
    let sectionItem: [String] = ["Google検索", "検索履歴", "閲覧履歴", "Top News"]
    /// オートコンプリートアイテム
    var suggestCellItem: [String] = []
    /// 検索履歴アイテム
    var searchHistoryCellItem: [SearchHistory] = []
    /// 閲覧履歴アイテム
    var commonHistoryCellItem: [CommonHistory] = []
    /// 記事アイテム
    var newsItem: [Article] = []
    /// 閲覧履歴読み込み数
    private let readCommonHistoryNum = SettingUseCase.s.commonHistorySaveCount
    /// 検索履歴読み込み数
    private let readSearchHistoryNum = SettingUseCase.s.searchHistorySaveCount
    /// サジェスト取得キュー
    private var requestSearchQueue = [String?]()
    /// サジェスト取得中フラグ
    private var isRequesting = false
    /// Observable自動解放
    let disposeBag = DisposeBag()

    init() {
        // webview検索
        // オペレーション監視
        SuggestUseCase.s.rx_suggestUseCaseDidRequestSuggest
            .subscribe { [weak self] object in
                log.eventIn(chain: "rx_operationUseCaseDidRequestSuggest")
                guard let `self` = self else { return }
                if let token = object.element {
                    // 閲覧履歴と検索履歴の検索
                    self.commonHistoryCellItem = HistoryUseCase.s.select(title: token, readNum: self.readCommonHistoryNum).objects(for: self.cellNum)
                    self.searchHistoryCellItem = SearchUseCase.s.select(title: token, readNum: self.readSearchHistoryNum).objects(for: self.cellNum)

                    // とりあえずここで画面更新
                    self.rx_searchMenuViewWillUpdateLayout.onNext(())

                    // オートサジェスト
                    self.requestSearchQueue.append(token)
                    self.requestSearch()
                }
                log.eventOut(chain: "rx_operationUseCaseDidRequestSuggest")
            }
            .disposed(by: disposeBag)

        // サジェスト検索監視
        SuggestUseCase.s.rx_suggestUseCaseDidUpdate
            .subscribe { [weak self] suggest in
                log.eventIn(chain: "rx_suggestDataModelDidUpdate")

                guard let `self` = self else { return }
                if let suggest = suggest.element, let data = suggest.data, data.count > 0 {
                    // suggestあり
                    self.suggestCellItem = data.objects(for: self.cellNum)
                } else {
                    self.suggestCellItem = []
                }
                self.isRequesting = false
                // キューに積まれている場合は、再度検索にいく
                if self.requestSearchQueue.count > 0 {
                    self.requestSearch()
                } else {
                    self.rx_searchMenuViewWillUpdateLayout.onNext(())
                }

                log.eventOut(chain: "rx_suggestDataModelDidUpdate")
            }
            .disposed(by: disposeBag)

        // 記事取得監視
        NewsUseCase.s.rx_newsUseCaseDidUpdate
            .subscribe { [weak self] element in
                log.eventIn(chain: "rx_articleDataModelDidUpdate")

                guard let `self` = self else { return }
                if let articles = element.element, articles.count > 0 {
                    // exist article
                    self.newsItem = articles
                } else {
                    self.newsItem = []
                }

                // 画面更新
                self.rx_searchMenuViewWillUpdateLayout.onNext(())

                log.eventOut(chain: "rx_articleDataModelDidUpdate")
            }
            .disposed(by: disposeBag)
    }

    deinit {
        log.debug("deinit called.")
        requestSearchQueue.removeAll()
        NotificationCenter.default.removeObserver(self)
    }

    /// 記事取得
    public func getArticle() {
        // 記事取得
        NewsUseCase.s.get()
    }

    /// 検索開始
    private func requestSearch() {
        if !isRequesting {
            isRequesting = true
            if let token = self.requestSearchQueue.removeFirst(), !token.isEmpty {
                if token.isUrl {
                    isRequesting = false
                } else {
                    SuggestUseCase.s.get(token: token)
                }
            } else {
                suggestCellItem = []
                commonHistoryCellItem = []
                searchHistoryCellItem = []
                isRequesting = false
                if requestSearchQueue.count > 0 {
                    requestSearch()
                } else {
                    rx_searchMenuViewWillHide.onNext(())
                }
            }
        }
    }

    /// ロードリクエスト
    func loadRequest(url: String) {
        SearchUseCase.s.load(text: url)
    }
}