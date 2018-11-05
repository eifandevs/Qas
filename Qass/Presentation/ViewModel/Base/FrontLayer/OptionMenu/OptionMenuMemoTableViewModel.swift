//
//  OptionMenuMemoTableViewModel.swift
//  Qass
//
//  Created by tenma on 2018/10/31.
//  Copyright © 2018年 eifandevs. All rights reserved.
//

import Foundation
import Model
import RxCocoa
import RxSwift

final class OptionMenuMemoTableViewModel {
    /// ページリロード通知用RX
    let rx_optionMenuMemoTableViewModelWillReload = PublishSubject<()>()

    /// Observable自動解放
    private let disposeBag = DisposeBag()

    init() {
        setupRx()
    }

    func setupRx() {
        // リロード監視
        MemoUseCase.s.rx_memoUseCaseDidClose
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                log.eventIn(chain: "rx_memoUseCaseDidClose")
                self.rx_optionMenuMemoTableViewModelWillReload.onNext(())
                log.eventOut(chain: "rx_memoUseCaseDidClose")
            }
            .disposed(by: disposeBag)
    }

    // セル情報
    struct Row {
        let data: Memo
    }

    // セル
    private var rows: [Row] {
        return MemoUseCase.s.select().map { Row(data: $0) }
    }

    // 高さ
    let cellHeight = AppConst.FRONT_LAYER.TABLE_VIEW_MEMO_CELL_HEIGHT
    // 数
    var cellCount: Int {
        return rows.count
    }

    /// セル情報取得
    func getRow(indexPath: IndexPath) -> Row {
        return rows[indexPath.row]
    }

    /// セル削除
    func removeRow(indexPath: IndexPath) {
        // モデルから削除
        let row = getRow(indexPath: indexPath)
        MemoUseCase.s.delete(memo: row.data)
    }

    /// ロック or アンロック
    func invertLock(memo: Memo) {
        MemoUseCase.s.invertLock(memo: memo)
        rx_optionMenuMemoTableViewModelWillReload.onNext(())
    }

    /// お問い合わせ表示
    func openMemo(memo: Memo? = nil) {
        if let memo = memo {
            MemoUseCase.s.open(memo: memo)
        } else {
            // 新規作成
            let newMemo = Memo()
            MemoUseCase.s.open(memo: newMemo)
        }
    }
}
