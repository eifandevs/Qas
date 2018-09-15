//
//  OptionMenuAppTableViewModel.swift
//  Qas
//
//  Created by temma on 2017/12/24.
//  Copyright © 2017年 eifaniori. All rights reserved.
//

import Foundation
import Model

final class OptionMenuAppTableViewModel {
    // セル情報
    struct Row {
        let cellType: CellType
    }

    enum CellType: Int {
        case opensource
        case policy
        case review
        case source

        var title: String {
            switch self {
            case .opensource: return AppConst.APP_INFORMATION.OPENSOURCE
            case .policy: return AppConst.APP_INFORMATION.POLICY
            case .review: return AppConst.APP_INFORMATION.REVIEW
            case .source: return AppConst.APP_INFORMATION.SOURCE
            }
        }
    }

    // セル
    let rows = [
        Row(cellType: .opensource),
        Row(cellType: .policy),
        Row(cellType: .review),
        Row(cellType: .source)
    ]

    // 高さ
    let cellHeight = AppConst.FRONT_LAYER.TABLE_VIEW_CELL_HEIGHT
    // 数
    var cellCount: Int {
        return rows.count
    }

    /// セル情報取得
    func getRow(indexPath: IndexPath) -> Row {
        return rows[indexPath.row]
    }

    /// ソース表示
    func openSource() {
        SourceCodeUseCase.s.open()
    }

    /// ライセンス表示
    func openLicense() {
        OpenSourceUseCase.s.open()
    }

    /// ポリシー表示
    func openPolicy() {
        PolicyUseCase.s.open()
    }

    /// レビュー表示
    func openReview() {
        ReviewUseCase.s.open()
    }
}
