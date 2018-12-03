//
//  MessageConst.swift
//  Model
//
//  Created by tenma on 2018/09/08.
//  Copyright © 2018年 eifandevs. All rights reserved.
//

import Foundation
import UIKit

struct MessageConst {

    // MARK: - 通知

    struct NOTIFICATION {
        static let REGISTER_BOOK_MARK = "お気に入りに登録しました"
        static let DELETE_SEARCH_HISTORY = "検索履歴を削除しました"
        static let STORE_PAGE_HISTORY_ERROR = "タブ情報の保存に失敗しました"
        static let DELETE_PAGE_HISTORY_ERROR = "タブ情報の削除に失敗しました"
        static let DELETE_THUMBNAIL_ERROR = "サムネイルの削除に失敗しました"
        static let STORE_THUMBNAIL_ERROR = "サムネイルの保存に失敗しました"
        static let CREATE_THUMBNAIL_ERROR = "サムネイルふフォルダの作成に失敗しました"
        static let GET_SEARCH_HISTORY_ERROR = "検索履歴の取得に失敗しました"
        static let STORE_SEARCH_HISTORY_ERROR = "検索履歴の保存に失敗しました"
        static let DELETE_SEARCH_HISTORY_ERROR = "検索履歴の削除に失敗しました"
        static let DELETE_BOOK_MARK = "お気に入りを削除しました"
        static let DELETE_BOOK_MARK_ERROR = "お気に入りの削除に失敗しました"
        static let DELETE_COMMON_HISTORY = "閲覧履歴を削除しました"
        static let GET_COMMON_HISTORY_ERROR = "閲覧履歴の取得に失敗しました"
        static let GET_ARTICLE_ERROR = "記事の取得に失敗しました"
        static let GET_FAVORITE_ERROR = "お気に入りの取得に失敗しました"
        static let STORE_FAVORITE_ERROR = "お気に入りの保存に失敗しました"
        static let STORE_COMMON_HISTORY_ERROR = "閲覧履歴の保存に失敗しました"
        static let DELETE_COMMON_HISTORY_ERROR = "閲覧履歴の削除に失敗しました"
        static let DELETE_COOKIES = "クッキー情報を削除しました"
        static let DELETE_CACHES = "キャッシュ情報を削除しました"
        static let DELETE_FORM = "フォーム情報を削除しました"
        static let DELETE_FORM_ERROR = "フォーム情報の削除に失敗しました"
        static let PASSCODE_NOT_REGISTERED = "パスコードが設定されていません"
        static let REGISTER_BOOK_MARK_ERROR = "ページ情報を取得できませんでした"
        static let REGISTER_FORM = "フォーム情報を登録しました"
        static let REGISTER_FORM_ERROR_INPUT = "フォーム情報の入力を確認できませんでした"
        static let REGISTER_FORM_ERROR_CRAWL = "ページ情報を取得できませんでした"
        static let REGISTER_REPORT = "レポートを登録しました。ご協力ありがとうございました"
        static let REGISTER_REPORT_ERROR = "レポートの登録に失敗しました"
    }
}
